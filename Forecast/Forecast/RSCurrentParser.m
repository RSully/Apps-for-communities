//
//  RSCurrentParser.m
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import "RSCurrentParser.h"


@implementation RSCurrentDay
@synthesize  curr;
@end


@implementation RSCurrentParser
+(RSCurrentDay*)parseCurrentDay:(NSDictionary*)dict {
    RSCurrentDay *day = [[RSCurrentDay alloc] init];
    day.curr = [(NSString*)[dict objectForKey:@"temp_f"] floatValue];
    return [day autorelease];
}
@end
