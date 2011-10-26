//
//  RSAlertViewTextInput.h
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RSAlertViewTextInput;


@interface RSAlertViewTextInput : UIAlertView <UIAlertViewDelegate> {
    UITextField *text;
    BOOL isTehHiddenz;
}

+(NSString*)textWithTitle:(NSString*)t cancelBtn:(NSString*)c submitBtn:(NSString*)s;

-(BOOL)isTehHiddenz;
-(UITextField*)text;

-(void)setTitle:(NSString*)t message:(NSString*)m cancelButton:(NSString*)can submitButton:(NSString*)sub;

@end
