//
//  RSTools.h
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RSTools : NSObject {
    
}

-(UIImage*)iconForIconDscp:(NSString*)str;
-(UIImage*)iconCurrentForIconDscp:(NSString*)str;

-(UIImage*)weatherForecastImageForFile:(NSString*)str;
-(UIImage*)weatherCurrentImageForFile:(NSString *)str;

+(RSTools*)shared;

@end
