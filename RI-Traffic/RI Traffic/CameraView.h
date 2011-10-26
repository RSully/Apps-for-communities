//
//  CameraView.h
//  RI Traffic
//
//  Created by Ryan on 6/15/11.
//  Copyright 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSStateObj.h"

@class Camera;

@interface CameraView : UIViewController {
    Camera *camera;
    UIImageView *img;
    NSTimer *refresh;
}

- (id)initWithCamera:(Camera*)cam;
-(void)refreshImage;

@end
