//
//  RSForecastToday.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecastToday.h"


@implementation RSForecastToday

-(UIImage*)getBG {
    static UIImage *bg = nil;
    if (!bg) {
        bg = [[UIImage imageNamed:@"bg_current"] retain];
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
        
        current = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 0.0, 80.0, frame.size.height)];
        [current setFont:[UIFont systemFontOfSize:40.0]];
        [current setBackgroundColor:[UIColor clearColor]];
        [current setTextColor:[UIColor colorWithRed:(69.0/255.0) green:(69.0/255.0) blue:(69.0/255.0) alpha:1.0]];
        [current setShadowColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        [current setShadowOffset:CGSizeMake(0.0, 1.0)];
        
        
        // total height 34, second is 20Y
        CGFloat initY = (frame.size.height/2)-(34/2);
        highL = [[UILabel alloc] initWithFrame:CGRectMake(229.0, initY, 52.0, 16.0)];
        highD = [[UILabel alloc] initWithFrame:CGRectMake(229.0+53.0, initY, 54.0, 16.0)];
        lowL = [[UILabel alloc] initWithFrame:CGRectMake(229.0, initY+20.0, 52.0, 16.0)];
        lowD = [[UILabel alloc] initWithFrame:CGRectMake(229.0+53.0, initY+20.0, 54.0, 16.0)];
        
        [highL setBackgroundColor:[UIColor clearColor]];
        [lowL setBackgroundColor:[UIColor clearColor]];
        [highD setBackgroundColor:[UIColor clearColor]];
        [lowD setBackgroundColor:[UIColor clearColor]];
        
        [highL setFont:[UIFont systemFontOfSize:15.0]];
        [lowL setFont:[UIFont systemFontOfSize:15.0]];
        [highD setFont:[UIFont systemFontOfSize:15.0]];
        [lowD setFont:[UIFont systemFontOfSize:15.0]];
        
        [highL setTextColor:[UIColor colorWithRed:(69.0/255.0) green:(69.0/255.0) blue:(69.0/255.0) alpha:1.0]];
        [lowL setTextColor:[UIColor colorWithRed:(69.0/255.0) green:(69.0/255.0) blue:(69.0/255.0) alpha:1.0]];
        
        [highD setTextColor:[UIColor colorWithRed:(219.0/255.0) green:(0.0/255.0) blue:(16.0/255.0) alpha:1.0]];
        [lowD setTextColor:[UIColor colorWithRed:(0.0/255.0) green:(83.0/255.0) blue:(214.0/255.0) alpha:1.0]];
                
        [highL setShadowColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        [lowD setShadowColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        [highD setShadowColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        [lowL setShadowColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        
        [highL setShadowOffset:CGSizeMake(0.0, 1.0)];
        [lowD setShadowOffset:CGSizeMake(0.0, 1.0)];
        [highD setShadowOffset:CGSizeMake(0.0, 1.0)];
        [lowL setShadowOffset:CGSizeMake(0.0, 1.0)];
        
        
        [self addSubview:current];
        [self addSubview:lowL];
        [self addSubview:lowD];
        [self addSubview:highL];
        [self addSubview:highD];
        [self bringSubviewToFront:icon];
    }
    return self;
}

-(void)setForecastCurrent:(RSCurrentDay*)day {
    [current setText:[NSString stringWithFormat:@"%0.f°", [day curr]]];
}
-(void)setDaycast:(RSForecastDay *)day {
    [self setWeatherIcon:[[RSTools shared] iconCurrentForIconDscp:[day icon]]];
    [lowD setText:[NSString stringWithFormat:@"%0.f°", [day low]]];
    [highD setText:[NSString stringWithFormat:@"%0.f°", [day high]]];
    
    // Lazy-loaderrr
    [lowL setText:@"Low of"];
    [highL setText:@"High of"];
}

-(void)setWeatherIcon:(UIImage*)img {
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
