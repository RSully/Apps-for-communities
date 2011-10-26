//
//  ForecastAppDelegate.h
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSForecastMain.h"
#import "RSForecast.h"

@interface ForecastAppDelegate : NSObject <UIApplicationDelegate> {
    RSForecastMain *main;
    UINavigationController *ctrl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
