//
//  RSAlertViewTextInput.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "RSAlertViewTextInput.h"


@implementation RSAlertViewTextInput

+(NSString*)textWithTitle:(NSString*)t cancelBtn:(NSString*)c submitBtn:(NSString*)s {
    RSAlertViewTextInput *test = [[RSAlertViewTextInput alloc] init];
    [test setTitle:t message:nil cancelButton:c submitButton:s];
    [test show];
    
    do {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
        //[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    } while (![test isTehHiddenz]);
    
    [test autorelease];
    return [[test text] text];
}

-(UITextField*)text { return text; }
-(BOOL)isTehHiddenz { return isTehHiddenz; }

-(id)init {
    self = [super init];
    if (self) {
        [self setDelegate:self];
        text = [[UITextField alloc] initWithFrame:CGRectMake(12, 45, 260, 25)];
        [text setBackgroundColor:[UIColor whiteColor]];
        [text setTextAlignment:UITextAlignmentCenter];
        isTehHiddenz = NO;
    }
    return self;
}
-(void)dealloc {
    [text release];
    [super dealloc];
}

-(void)setTitle:(NSString*)t message:(NSString*)m cancelButton:(NSString*)can submitButton:(NSString*)sub {
    [self setTitle:t];
    [self setMessage:@"    "];
    
    [self addButtonWithTitle:can];
    [self setCancelButtonIndex:0];
    [self addButtonWithTitle:sub];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [self cancelButtonIndex]) {
        // Do things?
    }
    isTehHiddenz = YES;
}


-(void)show {
    [text removeFromSuperview];
    [self addSubview:text];
    [super show];
    [text becomeFirstResponder];
}

@end
