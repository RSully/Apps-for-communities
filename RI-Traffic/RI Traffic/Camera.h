//
//  Camera.h
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class RSStateObj;

@interface Camera : NSObject <MKAnnotation> {
    Class state;
    NSString *info;
    NSString *ident;
    CGFloat lat;
    CGFloat lon;
    
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
- (NSString *)subtitle;
- (NSString *)title;
- (void)setupCoord;

+(Camera*)cameraWithState:(Class)s lat:(CGFloat)la lon:(CGFloat)lo ident:(NSString*)i info:(NSString*)str;

@property (assign) Class state;
@property (assign) CGFloat lat;
@property (assign) CGFloat lon;

@property (retain) NSString *ident;
@property (retain) NSString *info;

@end
