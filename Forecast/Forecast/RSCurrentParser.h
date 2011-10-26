//
//  RSCurrentParser.h
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSCurrentDay : NSObject {
    CGFloat curr;
}
@property (assign) CGFloat curr;
@end



@interface RSCurrentParser : NSObject {}
+(RSCurrentDay*)parseCurrentDay:(NSDictionary*)dict;
@end
