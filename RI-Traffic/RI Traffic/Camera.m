//
//  Camera.m
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import "Camera.h"

@implementation Camera

@synthesize coordinate;
@synthesize state, lat, lon;
@synthesize ident, info;

- (NSString *)subtitle {
    return info;
}
- (NSString *)title {
    return [NSString stringWithFormat:@"Camera %@", self.ident];
}

- (void)setupCoord {
    coordinate = CLLocationCoordinate2DMake(lat, lon);
}

+(Camera*)cameraWithState:(Class)s lat:(CGFloat)la lon:(CGFloat)lo ident:(NSString*)i info:(NSString*)str {
    Camera *cam = [[Camera alloc] init];
    cam.info = str;
    cam.state = s;
    cam.lat = la;
    cam.lon = lo;
    cam.ident = i;
    [cam setupCoord];
    return [cam autorelease];
}

@end
