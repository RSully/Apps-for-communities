//
//  RSForecast.h
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "RSForecastParser.h"
#import "RSCurrentParser.h"

#import "XMLReader.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

@class RSForecast;
@protocol RSForecastDelegate <NSObject>
-(void)forecastNeedsLocationQuery:(RSForecast*)fc;
-(void)forecast:(RSForecast*)fc isGettingLocation:(BOOL)yon;
-(void)forecast:(RSForecast*)fc gotLocation:(NSString*)loc;
-(void)forecast:(RSForecast*)fc gotDaycast:(NSArray*)arr;
-(void)forecast:(RSForecast*)fc gotCurrent:(RSCurrentDay*)day;
@end


@interface RSForecast : NSObject <CLLocationManagerDelegate> {
    NSObject<RSForecastDelegate> *delegate;
    NSThread *delegateThread;
    
    CLLocationManager *clManager;
    NSString *locQuery;
    
    ASIHTTPRequest *locRequest;
    ASIHTTPRequest *forRequest;
    ASIHTTPRequest *curRequest;
}

-(id)initWithDelegate:(id<RSForecastDelegate>)del;
-(void)setDelegate:(id<RSForecastDelegate>)d;

-(void)setLocationQuery:(NSString*)query;
-(void)refreshWeather;

@property (retain) NSString *locQuery;

@end
