//
//  UINavigationBar+BG.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "UINavigationBar+BG.h"


@implementation UINavigationBar (BG)

-(UIImage*)bgImg {
    static UIImage *bg = nil;
    if (!bg) {
        bg = [[UIImage imageNamed:@"Navbar"] retain];
    }
    return bg;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [[self bgImg] drawInRect:self.bounds];
}


@end
