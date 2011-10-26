//
//  RSForecastView.m
//  Forecast
//
//  Created by Ryan on 6/21/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecastView.h"


@implementation RSForecastView

@synthesize icon;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        icon = [[UIImageView alloc] init];
        [self addSubview:icon];
    }
    return self;
}

-(void)setWeatherIcon:(UIImage*)img {
    icon.image = img;
    CGFloat imgX = (self.frame.size.width/2)-(img.size.width/2);
    CGFloat imgY = (self.frame.size.height/2)-(img.size.height/2);
    icon.frame = CGRectMake(imgX, imgY, img.size.width, img.size.height);
}
-(void)setDaycast:(RSForecastDay*)day {}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [icon release];
    [super dealloc];
}

@end
