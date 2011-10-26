//
//  MainMap.h
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CameraView.h"
#import "Camera.h"

@interface MainMap : UIViewController <MKMapViewDelegate> {
    MKMapView *map;
}

-(void)addPins:(Class)clazz;

@end
