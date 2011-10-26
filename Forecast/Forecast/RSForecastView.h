//
//  RSForecastView.h
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSForecastParser.h"
#import "RSTools.h"

@interface RSForecastView : UIView {
    UIImageView *icon;
}

-(void)setDaycast:(RSForecastDay*)day;

-(void)setWeatherIcon:(UIImage*)img;
@property (readonly) UIImageView *icon;

@end
