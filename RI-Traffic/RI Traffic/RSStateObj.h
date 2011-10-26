//
//  RSStateObj.h
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;

@interface RSStateObj : NSObject {
    
}

+(NSString*)urlFromCamera:(Camera*)cam;
+(NSTimeInterval)updateTime;
+(NSArray*)cameras;

@end
