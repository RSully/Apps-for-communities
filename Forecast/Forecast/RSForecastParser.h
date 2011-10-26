//
//  RSForecastParser.h
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSForecastDay : NSObject {
    NSInteger period;
    NSDate *day;
    CGFloat high;
    CGFloat low;
    NSString *icon;
}
- (NSString *)getDayOfTheWeek;
@property (assign) NSInteger period;
@property (retain) NSDate *day;
@property (assign) CGFloat high;
@property (assign) CGFloat low;
@property (retain) NSString *icon;
@end

@interface RSDayParser : NSObject {}
+(RSForecastDay*)parseDay:(NSDictionary*)day;
@end


@interface RSForecastParser : NSObject {}
+(NSArray*)parseDays:(NSArray*)days;
@end
