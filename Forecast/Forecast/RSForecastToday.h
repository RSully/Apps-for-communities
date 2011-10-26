//
//  RSForecastToday.h
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RSForecastView.h"
#import "RSCurrentParser.h"

@interface RSForecastToday : RSForecastView {
    UILabel *current;
    UILabel *lowL;
    UILabel *lowD;
    UILabel *highL;
    UILabel *highD;
}
-(void)setForecastCurrent:(RSCurrentDay*)day;
@end
