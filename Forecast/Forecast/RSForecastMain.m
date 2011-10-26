//
//  RSForecastMain.m
//  Forecast
//
//  Created by Ryan on 6/17/11.
//  Copyright 2011. All rights reserved.
//

#import "RSForecastMain.h"


@implementation RSForecastMain

-(void)forecastNeedsLocationQuery:(RSForecast*)fc {
    NSString *zipCode = [RSAlertViewTextInput textWithTitle:@"Enter your postal code" cancelBtn:@"Cancel" submitBtn:@"Submit"];
    [fc setLocationQuery:zipCode];
    //[fc setLocationQuery:@"02893"];
}
-(void)forecast:(RSForecast*)fc isGettingLocation:(BOOL)yon {}
-(void)forecast:(RSForecast*)fc gotLocation:(NSString*)loc {
    self.title = loc;
}
-(void)forecast:(RSForecast*)fc gotDaycast:(NSArray*)arr {
    if ([arr count] < 1) { return; }
    
    [todayView setDaycast:(RSForecastDay*)[arr objectAtIndex:0]];
    for (int i = 0; i < [arr count]; i++) {
        if ([futureViews count] <= i) { break; }
        
        RSForecastDay *day = [arr objectAtIndex:i];
        [(RSForecastFuture*)[futureViews objectAtIndex:i] setDaycast:day];
    }
}
-(void)forecast:(RSForecast*)fc gotCurrent:(RSCurrentDay*)day {
    [todayView setForecastCurrent:day];
}



-(void)refreshWeather {
    [forecast refreshWeather];
}
-(void)updateLocation {
    NSString *zipCode = [RSAlertViewTextInput textWithTitle:@"Enter your postal code" cancelBtn:@"Cancel" submitBtn:@"Submit"];
    [forecast setLocationQuery:zipCode];
}




- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        forecast = [[RSForecast alloc] initWithDelegate:self];
        futureViews = [[NSMutableArray alloc] init];
        
        todayView = [[RSForecastToday alloc] initWithFrame:CGRectMake(0, 0, 320, 110)];
        for (int i = 0; i < 6; i++) {
            CGFloat newY = 110+(51*i);
            RSForecastFuture *fut = [[RSForecastFuture alloc] initWithFrame:CGRectMake(0, newY, 320, 51)];
            [futureViews addObject:fut];
            [fut release];
        }
    }
    return self;
}

- (void)dealloc
{
    [forecast release];
    [todayView release];
    [futureViews release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    [super loadView]; // Oh this is probably a bad idea.
    //UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    //self.view = view;
    //[view release];
    
    NSInteger dow = 0;
    todayView.tag = dow;
    [self.view addSubview:todayView];
    for(UIView *v in futureViews) {
        dow++; v.tag = dow;
        [self.view addSubview:v];
    }
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"button_location"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"button_location_pressed"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(updateLocation) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
