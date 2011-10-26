//
//  RSForecast.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecast.h"


#define kRSWeatherKey @"RS_LOC_QUERY"


@implementation RSForecast
@synthesize locQuery;



-(void)giveDelegateDaycast:(id)obj {
    [delegate forecast:self gotDaycast:(NSArray*)obj];
}
-(void)giveDelegateLocation:(id)obj {
    [delegate forecast:self gotLocation:(NSString*)obj];
}
-(void)giveDelegateCurrentCast:(id)obj {
    [delegate forecast:self gotCurrent:(RSCurrentDay*)obj];
}


-(id)initWithDelegate:(id<RSForecastDelegate>)del {
    self = [super init];
    if (self) {
        [self setDelegate:del];
        
        clManager = [[CLLocationManager alloc] init];
        [clManager setDelegate:self];
        [clManager startMonitoringSignificantLocationChanges];
        
        CLLocation *loc = [clManager location];
        if (loc) {
            [self locationManager:clManager didUpdateToLocation:loc fromLocation:nil];
        } else if ([[[NSUserDefaults standardUserDefaults] objectForKey:kRSWeatherKey] length] > 1) {
            [self setLocationQuery:[[NSUserDefaults standardUserDefaults] objectForKey:kRSWeatherKey]];
        } else {// if (![CLLocationManager locationServicesEnabled]) {
            [self locationManager:clManager didFailWithError:nil];
        }
    }
    return self;
}
-(void)dealloc {
    [clManager stopMonitoringSignificantLocationChanges];
    [locQuery release];
    [clManager release];
    [locRequest release];
    [forRequest release];
    [super dealloc];
}

-(void)resetCurRequest {
    if (curRequest) {
        if ([curRequest isExecuting] || (![curRequest isFinished] && [curRequest url] != nil)) {
            NSLog(@"Executing CUR?");
            [curRequest cancel];
        }
        [curRequest release], curRequest = nil;
    }
    curRequest = [[ASIHTTPRequest alloc] initWithURL:nil];
    [curRequest setDelegate:self];
    [curRequest setDidFinishSelector:@selector(curReqFinished:)];
    [curRequest setDidFailSelector:@selector(reqFailed:)];
}
-(void)resetMainRequests {
    if (locRequest) {
        if ([locRequest isExecuting] || (![locRequest isFinished] && [locRequest url] != nil)) {
            NSLog(@"Executing LOC?");
            [locRequest cancel];
        }
        [locRequest release], locRequest = nil;
    }
    if (forRequest) {
        if ([forRequest isExecuting] || (![forRequest isFinished] && [forRequest url] != nil)) {
            NSLog(@"Executing FOR?");
            [forRequest cancel];
        }
        [forRequest release], forRequest = nil;
    }
    locRequest = [[ASIHTTPRequest alloc] initWithURL:nil];
    forRequest = [[ASIHTTPRequest alloc] initWithURL:nil];
    
    [locRequest setDelegate:self];
    [forRequest setDelegate:self];
    [locRequest setDidFinishSelector:@selector(locReqFinished:)];
    [forRequest setDidFinishSelector:@selector(forReqFinished:)];
    [locRequest setDidFailSelector:@selector(reqFailed:)];
    [forRequest setDidFailSelector:@selector(reqFailed:)];
}

-(void)setDelegate:(id<RSForecastDelegate>)d {
    delegate = d;
    delegateThread = [NSThread currentThread];
}

-(void)setLocationQuery:(NSString*)query {
    NSLog(@"-setLocationQuery: %@", query);
    NSString *try = [query stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([try length] < 1) {
        if (self.locQuery == nil) {
            // We *need* a postal code...
            [self locationManager:clManager didFailWithError:nil];
        }
        return;
    }
    
    self.locQuery = try;
    [[NSUserDefaults standardUserDefaults] setObject:self.locQuery forKey:kRSWeatherKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self refreshWeather];
}
-(void)refreshWeather {
    if (!self.locQuery) { return; }
    
    NSString *geoReq = [NSString stringWithFormat:@"http://api.wunderground.com/auto/wui/geo/GeoLookupXML/index.xml?query=%@", self.locQuery];
    NSString *forReq = [NSString stringWithFormat:@"http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=%@", self.locQuery];
    
    [self resetMainRequests];
    [locRequest setURL:[NSURL URLWithString:geoReq]];
    [forRequest setURL:[NSURL URLWithString:forReq]];
    [locRequest startAsynchronous];
    [forRequest startAsynchronous];
}
-(void)refreshCurrentWeather:(NSString*)locId {
    NSString *curReq = [NSString stringWithFormat:@"http://api.wunderground.com/weatherstation/WXCurrentObXML.asp?ID=%@", locId];
    
    [self resetCurRequest];
    [curRequest setURL:[NSURL URLWithString:curReq]];
    [curRequest startAsynchronous];
}



-(void)reqFailed:(ASIHTTPRequest*)req {
    NSLog(@"-RequestFailed: %@", req);
}
-(void)locReqFinished:(ASIHTTPRequest*)req {
    NSLog(@"-locReqFinished");
    NSDictionary *dict = [XMLReader dictionaryForXMLData:[req responseData] error:nil];
    if (dict) {
        NSDictionary *loc = [dict objectForKey:@"location"];
        NSString *locType = [[loc objectForKey:@"type"] lowercaseString]; // attr?
        NSString *locStr = [NSString stringWithFormat:@"%@, %@", [loc objectForKey:locType], [loc objectForKey:@"state"]];
        [self performSelector:@selector(giveDelegateLocation:) onThread:delegateThread withObject:locStr waitUntilDone:NO];
        
        NSString *got = nil;
        @try {
            NSDictionary *info = [loc objectForKey:@"nearby_weather_stations"];
            NSDictionary *pwss = [info objectForKey:@"pws"];
            NSArray *pws = [pwss objectForKey:@"station"];
            NSDictionary *closest = [pws objectAtIndex:0];
            got = [closest objectForKey:@"id"];
        } @catch (NSException *exception) { NSLog(@"Fucked: %@", exception); }
        
        if (got) {
            [self refreshCurrentWeather:got];
        }
    }
}
-(void)forReqFinished:(ASIHTTPRequest*)req {
    NSLog(@"-forReqFinished");
    NSDictionary *dict = [XMLReader dictionaryForXMLData:[req responseData] error:nil];
    if (dict) {
        dict = [dict objectForKey:@"forecast"];
        dict = [dict objectForKey:@"simpleforecast"];
        NSArray *days = [dict objectForKey:@"forecastday"];
        NSArray *dayCast = [RSForecastParser parseDays:days];
        [self performSelector:@selector(giveDelegateDaycast:) onThread:delegateThread withObject:dayCast waitUntilDone:NO];
    }
}
-(void)curReqFinished:(ASIHTTPRequest*)req {
    NSLog(@"-curReqFinished");
    NSDictionary *dict = [XMLReader dictionaryForXMLData:[req responseData] error:nil];
    if (dict) {
        dict = [dict objectForKey:@"current_observation"];
        RSCurrentDay *day = [RSCurrentParser parseCurrentDay:dict];
        [self performSelector:@selector(giveDelegateCurrentCast:) onThread:delegateThread withObject:day waitUntilDone:NO];
    }
}



// Location manager
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"-didChangeAuthStatus");
    if (status == kCLAuthorizationStatusAuthorized) {
        [self locationManager:clManager didUpdateToLocation:[clManager location] fromLocation:nil];
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"-didFailWithError: %@", error);
    if (self.locQuery == nil || [self.locQuery length] < 1) {
        [delegate performSelector:@selector(forecastNeedsLocationQuery:) onThread:delegateThread withObject:self waitUntilDone:NO];
    }
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"-didUpdateToLoc: %@", newLocation);
    [self setLocationQuery:[NSString stringWithFormat:@"%f,%f", newLocation.coordinate.latitude, newLocation.coordinate.longitude]];
}

@end
