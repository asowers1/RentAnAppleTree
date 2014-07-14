//
//  uiTabTwoViewController.m
//  RentAnAppleTree
//
//  Created by Andrew Sowers on 7/3/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import "uiTabTwoViewController.h"

@interface uiTabTwoViewController (){
    int device;

}

@end

@implementation uiTabTwoViewController

- (id)init
{
    if (self) {
        self.tabBarItem.title = @"Map";
        // Custom initialization


    }
    return self;
}

- (void) layoutForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"initLayout TabOne");
    [self layoutMath];
    
}
-(void)layoutMath{
    NSLog(@"LayoutMath");
    
    CGRect myFrame = [self.view frame];
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        //do portrait work
       

            map.frame = CGRectMake(0, 64, myFrame.size.width, [UIScreen mainScreen].bounds.size.height-113);

        
    } else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        //do landscape work
        

            map.frame = CGRectMake(0, 64, myFrame.size.width, [UIScreen mainScreen].bounds.size.height-360);
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [self layoutForInterfaceOrientation:(UIInterfaceOrientation)self];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutMath) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        device = 1;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        device = 2;
    }
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(2, 64, 130, 40)];
    [button setTitle:@"open in maps" forState:UIControlStateNormal];
    [button setTitleColor: [UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(mapButtonMethod) forControlEvents:UIControlEventTouchDown];
    [button.titleLabel setFont:[UIFont fontWithName:@"Avenir" size:18]];
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    NSLog(@"Tab Two loaded");
    map = [[MKMapView alloc] init];
    map.delegate = self;
    [map setMapType: MKMapTypeStandard];
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude = 42.15827;
    coordinate.longitude = -76.66987;
    map.mapType = MKMapTypeHybrid;
    map.region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
    [self.view addSubview: map];
    [self.view addSubview:button];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    [annotation setCoordinate:coordinate];
    [annotation setTitle:@"160 Bixby Rd, Erin, NY 14838"];
    [map addAnnotation:annotation];

}
- (void)mapButtonMethod{
    NSLog(@"button press");
    NSURL *url = [NSURL URLWithString:@"http://maps.apple.com/?q=160,+Bixby+Rd,+Erin,+NY,+14838,&t=h"];
    [[UIApplication sharedApplication] openURL:url];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
