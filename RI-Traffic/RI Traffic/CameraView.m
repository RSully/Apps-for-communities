//
//  CameraView.m
//  RI Traffic
//
//  Created by Ryan on 6/15/11.
//  Copyright 2011. All rights reserved.
//

#import "CameraView.h"
#import "Camera.h"

@implementation CameraView

- (id)initWithCamera:(Camera*)cam
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        camera = cam;
        img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        [self refreshImage];
        refresh = [NSTimer scheduledTimerWithTimeInterval:[[camera state] updateTime] target:self selector:@selector(refreshImage) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)refreshImage {
    if (camera == nil) { return; }
    NSString *theUrl = [[camera state] urlFromCamera:camera];
    UIImage *imgData = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:theUrl]]];
    
    CGFloat goodHeight = (320/imgData.size.width)*imgData.size.height;
    @try {
        img.image = imgData;
        img.frame = CGRectMake(0.0, 0.0, 320.0f, goodHeight);
    } @catch (NSException *exception) {
        NSLog(@"Whoops: %@", exception);
    }
}

- (void)dealloc
{
    camera = nil;
    [refresh invalidate];
    [img release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStyleBordered target:self action:@selector(refreshImage)] autorelease];
    [self.view addSubview:img];
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
