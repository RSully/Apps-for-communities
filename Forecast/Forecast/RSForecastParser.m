//
//  RSForecastParser.m
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecastParser.h"

@implementation RSForecastDay
@synthesize period, day;
@synthesize high, low;
@synthesize icon;
- (NSString *)getDayOfTheWeek {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =[gregorian components:NSWeekdayCalendarUnit fromDate:self.day];
    NSInteger weekday = [weekdayComponents weekday];
    [gregorian release];
    switch (weekday) {
        case 1: return @"Sunday";
        case 2: return @"Monday";
        case 3: return @"Tuesday";
        case 4: return @"Wednesday";
        case 5: return @"Thursday";
        case 6: return @"Friday";
        case 7: return @"Saturday";
    }
    return @"Unknown";
}
@end

@implementation RSDayParser
+(RSForecastDay*)parseDay:(NSDictionary*)day {
    RSForecastDay *ret = [[RSForecastDay alloc] init];
    ret.period = [(NSString*)[day objectForKey:@"period"] integerValue];
    NSTimeInterval epoch = [(NSString*)[[day objectForKey:@"date"] objectForKey:@"epoch"] doubleValue];
    ret.day = [NSDate dateWithTimeIntervalSince1970:epoch];
    ret.high = [(NSString*)[[day objectForKey:@"high"] objectForKey:@"fahrenheit"] floatValue];
    ret.low = [(NSString*)[[day objectForKey:@"low"] objectForKey:@"fahrenheit"] floatValue];
    ret.icon = (NSString*)[day objectForKey:@"icon"];
    return [ret autorelease];
}
@end


@implementation RSForecastParser
+(NSArray*)parseDays:(NSArray*)days {
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    for (NSDictionary *day in days) {
        [ret addObject:[RSDayParser parseDay:day]];
    }
    return [ret autorelease];
}
@end
