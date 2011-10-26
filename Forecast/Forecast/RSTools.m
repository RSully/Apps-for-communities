//
//  RSTools.m
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import "RSTools.h"

@interface RSTools (Private)
-(NSString*)weatherMainFileFromDscp:(NSString*)str;
-(UIImage*)weatherImageForFile:(NSString*)str;
-(UIImage*)weatherCurrImageForFile:(NSString*)str;
@end


@implementation RSTools

-(NSString*)weatherMainFileFromDscp:(NSString*)str {
    NSString *test = [str lowercaseString];
    
    if ([test hasSuffix:@"rain"]) {
        return @"light_rain";
    } else if ([test hasSuffix:@"tstorms"]) {
        return @"storm";
    } else if ([test hasPrefix:@"sun"]) {
        return @"clear";
    } else if ([test hasPrefix:@"cloud"]) {
        return @"cloudy";
    }
    return @"partly_cloudy";
}

-(UIImage*)iconForIconDscp:(NSString*)str {
    NSString *img = [self weatherMainFileFromDscp:str];
    return img == nil ? nil : [self weatherForecastImageForFile:img];
}
-(UIImage*)iconCurrentForIconDscp:(NSString*)str {
    NSString *img = [self weatherMainFileFromDscp:str];
    return img == nil ? nil : [self weatherCurrentImageForFile:img];
}

-(UIImage*)weatherForecastImageForFile:(NSString*)str {
    return [self weatherImageForFile:[NSString stringWithFormat:@"%@_day", str]];
}
-(UIImage*)weatherCurrentImageForFile:(NSString *)str {
    NSString *don = @"day";
    // Check hour:
    NSDate *now = [[NSDate alloc] initWithTimeIntervalSinceNow:0.0];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(kCFCalendarUnitHour) fromDate:now];
    NSInteger hour = [components hour];
    if (hour > 16) { don = @"night"; }
    [now release];
    
    return [self weatherCurrImageForFile:[NSString stringWithFormat:@"%@_%@", str, don]];
}

-(UIImage*)weatherCurrImageForFile:(NSString*)str {
    return [self weatherImageForFile:[NSString stringWithFormat:@"%@_current", str]];
}
-(UIImage*)weatherImageForFile:(NSString*)str {
    return [UIImage imageNamed:[NSString stringWithFormat:@"weather_%@", str]];
}


+(RSTools*)shared {
    static RSTools *shared = nil;
    if (!shared) { shared = [[RSTools alloc] init]; }
    return shared;
}

@end
