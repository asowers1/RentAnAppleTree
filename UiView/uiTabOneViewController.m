//
//  uiTabOneViewController.m
//  RentAnAppleTree
//
//  Created by Andrew Sowers on 7/3/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import "uiTabOneViewController.h"

@interface uiTabOneViewController (){
    int key;
    int device;
}

@end

@implementation uiTabOneViewController
@synthesize webView,toolbar;

- (id)init
{
    if (self) {
        self.tabBarItem.title = @"Orchard";
    }
    return self;
}

- (BOOL)shouldAutorotate {
    return device == 2 ? 1 : 0;
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"appear");
    [self layoutForInterfaceOrientation:(UIInterfaceOrientation)self];
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"disappear");
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
        webView.frame = CGRectMake(0, 64, myFrame.size.width, [UIScreen mainScreen].bounds.size.height-114);
        
    } else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        //do landscape work
        
            if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                webView.frame = CGRectMake(0, 64, myFrame.size.width, [UIScreen mainScreen].bounds.size.height-114);
            }else
                webView.frame = CGRectMake(0, 64, myFrame.size.width, [UIScreen mainScreen].bounds.size.height-380);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(layoutMath) name:@"UIDeviceOrientationDidChangeNotification" object:nil];
    
    NSLog(@"View loaded");
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        device = 1;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        device = 2;
    }
    key = 0;
    
    NSMutableArray *items = [NSMutableArray array];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                            target:nil
                                                                            action:@selector(navWeb:)];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@" <- "
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil
                                                                  action:@selector(navWeb:)];
    
    UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc] initWithTitle:@" -> "
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:nil
                                                                     action:@selector(navWeb:)];
    backButton.tag = 1;
    forwardButton.tag = 2;
    button.tag = 3;
    [items addObject:button];
    [items addObject:backButton];
    [items addObject:forwardButton];
    
    
    webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.rentanappletree.com/how-rent-apple-tree"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    webView.scalesPageToFit = 1;
    webView.delegate = self;
    webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
    activity = [[UIActivityIndicatorView alloc] init];
    activity.color = [UIColor grayColor];
    activity.center = self.view.center;
    
    [self.view addSubview:webView];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [activity startAnimating];
    NSLog(@"WEBVIEW");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [activity stopAnimating];
    NSLog(@"WEBVIEW END");
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"web fail");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
