//
//  StateRI.h
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"
#import "RSStateObj.h"

@interface StateRI : RSStateObj {
    
}

+(NSString*)urlFromCamera:(Camera*)cam;
+(NSTimeInterval)updateTime;
+(NSArray*)cameras;

@end
