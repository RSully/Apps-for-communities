//
//  RSForecastFuture.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecastFuture.h"


@implementation RSForecastFuture

-(UIImage*)getBG {
    static UIImage *bg = nil;
    if (!bg) {
        bg = [[UIImage imageNamed:@"bg_forecast"] retain];
    }
    return bg;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[self getBG]];
        [img setFrame:self.bounds];
        [self addSubview:img];
        [img release];
        
        weekday = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 114, frame.size.height)];
        [weekday setBackgroundColor:[UIColor clearColor]];
        [weekday setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [weekday setTextColor:[UIColor colorWithRed:(233.0/255.0) green:(236.0/255.0) blue:(239.0/255.0) alpha:1.0]];
        [weekday setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.75f]];
        [weekday setShadowOffset:CGSizeMake(0.0, 1.0)];
        
        high = [[UILabel alloc] initWithFrame:CGRectMake(248.0f, 0, 32.0f, frame.size.height)];
        [high setBackgroundColor:[UIColor clearColor]];
        [high setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [high setTextColor:[UIColor colorWithRed:(213.0/255.0) green:(85.0/255.0) blue:(85.0/255.0) alpha:1.0]];
        [high setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.75f]];
        [high setShadowOffset:CGSizeMake(0.0, 1.0)];
        
        low = [[UILabel alloc] initWithFrame:CGRectMake(282.0f, 0, 32.0f, frame.size.height)];
        [low setBackgroundColor:[UIColor clearColor]];
        [low setFont:[UIFont boldSystemFontOfSize:15.0f]];
        [low setTextColor:[UIColor colorWithRed:(99.0/255.0) green:(168.0/255.0) blue:(226.0/255.0) alpha:1.0]];
        [low setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.75f]];
        [low setShadowOffset:CGSizeMake(0.0, 1.0)];
        
        [self addSubview:weekday];
        [self addSubview:high];
        [self addSubview:low];
        [self bringSubviewToFront:icon];
    }
    return self;
}

-(void)setDaycast:(RSForecastDay*)day {
    [self setWeatherIcon:[[RSTools shared] iconForIconDscp:[day icon]]];
    weekday.text = [day getDayOfTheWeek];
    high.text = [NSString stringWithFormat:@"%0.f°", [day high]];
    low.text = [NSString stringWithFormat:@"%0.f°", [day low]];
}


-(void)setWeatherIcon:(UIImage *)img {
    [super setWeatherIcon:img];
    [self setNeedsDisplay];
}

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
    [super dealloc];
}

@end
