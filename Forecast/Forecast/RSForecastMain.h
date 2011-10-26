//
//  RSForecastMain.h
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UINavigationBar+BG.h"

#import "RSTools.h"
#import "RSForecastToday.h"
#import "RSForecastFuture.h"

#import "RSAlertViewTextInput.h"
#import "RSForecast.h"

@interface RSForecastMain : UIViewController <RSForecastDelegate> {
    RSForecast *forecast;
    
    RSForecastToday *todayView;
    NSMutableArray *futureViews;
}

-(void)refreshWeather;
-(void)updateLocation;

@end
