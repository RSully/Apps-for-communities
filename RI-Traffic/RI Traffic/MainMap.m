//
//  MainMap.m
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011. All rights reserved.
//

#import "MainMap.h"
#import "StateRI.h"

@implementation MainMap

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Map";
        
        map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        [map setZoomEnabled:YES];
        [map setDelegate:self];
        [map setMapType:MKMapTypeStandard];
    }
    return self;
}

- (void)dealloc
{
    [map release];
    [super dealloc];
}

-(void)addPins:(Class)clazz {
    [map removeAnnotations:[map annotations]];
    NSArray *cams = [clazz cameras];
    [map addAnnotations:cams];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString *ident = @"MyPinz";
    
    MKPinAnnotationView *pin = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:ident];
    if (!pin) {
        pin = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ident] autorelease];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    return pin;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    CameraView *cv = [[CameraView alloc] initWithCamera:view.annotation];
    [self.navigationController pushViewController:cv animated:YES];
    [cv release];
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
    [self.view addSubview:map];
    [self addPins:[StateRI class]];
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
