//
//  uiViewDetailViewController.m
//  UiView
//
//  Created by Andrew Sowers on 3/25/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import "uiViewDetailViewController.h"
#import "uiTabOneViewController.h"
#import "uiTabTwoViewController.h"
#import "uiViewViewController.h"
@interface uiViewDetailViewController (){
    int key;
    int device;
}
@end

@implementation uiViewDetailViewController
@synthesize foodLabel, foodName, titleBar,titleBariPhone,webView,toolbar;


- (BOOL)shouldAutorotate {
    return YES;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    self.toolbar.hidden = 1;
    self.webView.hidden = 1;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    NSLog(@"did rotate0");
    self.toolbar.hidden = 0;
    self.webView.hidden = 0;
    [self layoutMath];
    
}
- (void) layoutForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"initLayout");
    [self layoutMath];

}

-(void)layoutMath{
    activity.center = self.view.center;
    if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        //do portrait work
        CGFloat width = CGRectGetWidth(self.view.bounds);
        NSLog(@"           WIDTH %f",width);
        CGSize toolbarSize = [self.toolbar sizeThatFits:self.view.bounds.size];
        self.toolbar.frame = (CGRect){CGPointMake(0.f, CGRectGetHeight(self.view.bounds) - toolbarSize.height), toolbarSize};
        if ([foodName isEqualToString:@"Gallery"]) {
            NSLog(@"GAL INIT port");


            detailScrollView.frame = CGRectMake(0, 0, width, self.view.bounds.size.height);
            
            if (device == 2){
                windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-64);
                webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);

            }else{
                detailScrollView.contentSize = CGSizeMake(width, 2000);
                if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                    self.webView.frame = CGRectMake(0, 0, width, self.view.frame.size.height);
                }
                else
                    self.webView.frame = CGRectMake(0, 64, width, self.view.frame.size.height);

            }
            
        }
        else{
            if(![foodName isEqualToString:@"1"]){
                NSLog(@"TEST0!");

                if (device == 2){
                    windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-64);
                    webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                    detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
                    detailScrollView.contentSize = CGSizeMake(width, 1000);
                }else{
                    if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                        windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                        webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                        
                    }else{
                        windowView.frame = CGRectMake(0, 64, width, [UIScreen mainScreen].bounds.size.height-64);
                        webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-108);
                    }
                }
            }else{   //view for apple varieties
                    NSLog(@"TEST! %@",foodName);
                    if (device == 2){
                        windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-64);
                        webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                        detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
                    }else{
                        if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                            windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                            webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                            
                        }else{
                            windowView.frame = CGRectMake(0, 64, width, [UIScreen mainScreen].bounds.size.height-64);
                            webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-108);
                        }
                    }
            }
        }
    } else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        //do landscape work
        CGFloat width = CGRectGetWidth(self.view.bounds);
        NSLog(@"           WIDTH %f",width);
        CGSize toolbarSize = [self.toolbar sizeThatFits:self.view.bounds.size];
        self.toolbar.frame = (CGRect){CGPointMake(0.f, CGRectGetHeight(self.view.bounds) - toolbarSize.height), toolbarSize};
        detailScrollView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
        detailScrollView.contentSize = CGSizeMake(width, 1000);
        text.frame = CGRectMake(30, 96, width-60,300);
        topText.frame = CGRectMake(0, 10, width, 64);
        
        
        if ([foodName isEqualToString:@"Gallery"]) {
            NSLog(@"GAL INIT");
            
            if (device == 2 ){
                if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                    self.webView.frame = CGRectMake(0,0, width, [UIScreen mainScreen].bounds.size.height);
                }else
                    self.webView.frame = CGRectMake(0,0, width, [UIScreen mainScreen].bounds.size.height-256);
            }else
                self.webView.frame = CGRectMake(0,0, width, [UIScreen mainScreen].bounds.size.height-320);
 
        }else if ([foodName isEqualToString:@"1"]){
            
            if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
            }
            else{
                windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-300);
                detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
            }
        }
        else {
            if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
                windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-44);
                detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
            }
            else{
                windowView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height);
                webView.frame = CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height-300);
                detailScrollView.frame = CGRectMake(0, 64, width, self.view.bounds.size.height-64);
            }
        }
    }else
        NSLog(@"else");
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}
-(void)viewDidAppear:(BOOL)animated{

}
-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"disappear detial");
    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        device = 1;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        device = 2;
    }
    key = 0;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];

    if (![foodName isEqual: @"Gallery"]&&![foodName isEqual:@"farmView"]&&![foodName isEqualToString:@"About us"]&&![foodName isEqualToString:@"1"]) {
        windowView = [[UIView alloc] init];
        
        webView = [[UIWebView alloc] init];
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        webView.scalesPageToFit = 1;
        toolbar = [[UIToolbar alloc] init];
        if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }else{
            self.toolbar.tintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        }
        
        
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
        toolbar.items = items;

            NSURL *urlString = [NSURL URLWithString:foodName];
            NSURLRequest *url = [NSURLRequest requestWithURL:urlString];
        activity = [[UIActivityIndicatorView alloc] init];
        webView.delegate = self;
        activity.color = [UIColor grayColor];
        [webView loadRequest:url];
        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        [self.view addSubview:windowView];
        [windowView addSubview:webView];
        [windowView addSubview:activity];
        [self.view addSubview:toolbar];
        

        
    }else if([foodName isEqual:@"farmView"]){
        
        NSLog(@"farmView");
        self.navigationItem.title = @"Our Farm";
        tabBarController = [[UITabBarController alloc] init];
        uiTabOneViewController *tabOne = [[uiTabOneViewController alloc] init];
        uiTabTwoViewController *tabTwo = [[uiTabTwoViewController alloc] init];
        //[tabOne.tabBarItem setImage:[UIImage imageNamed:@"safari.png"]];
        //[tabTwo.tabBarItem setImage:[UIImage imageNamed:@"maps.png"]];
        NSArray* controllers = [NSArray arrayWithObjects:tabOne,tabTwo, nil];
        tabBarController.viewControllers = controllers;
        tabBarController.view.frame = self.view.bounds;
        if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
            [[UITabBar appearance] setTintColor:[UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0]];
            [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0]];
            
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
            [[UITabBar appearance] setTintColor:[UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0]];
            [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0]];
        }
        
        
        [self.view addSubview:tabBarController.view];
        
    }else if([foodName isEqualToString:@"Gallery"]){ // gallery view

        
        webView = [[UIWebView alloc] init];
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        webView.tag = 99;
        webView.scalesPageToFit = 1;
        
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"]isDirectory:NO]]];
        [self.view addSubview:webView];
        NSLog(@"hi");

    }else if ([foodName isEqualToString:@"About us"]){
        self.navigationItem.title = @"About us";
        
        
        windowView = [[UIView alloc] init];
        
        webView = [[UIWebView alloc] init];
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        webView.scalesPageToFit = 1;
        toolbar = [[UIToolbar alloc] init];
        if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }else{
            self.toolbar.tintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        }
        
        
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
        toolbar.items = items;
        
        NSURL *urlString = [NSURL URLWithString:@"http://www.rentanappletree.com/about-new-york-apple-orchard.html"];
        NSURLRequest *url = [NSURLRequest requestWithURL:urlString];
        activity = [[UIActivityIndicatorView alloc] init];
        webView.delegate = self;
        activity.color = [UIColor grayColor];
        [webView loadRequest:url];
        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        [self.view addSubview:windowView];
        [windowView addSubview:webView];
        [windowView addSubview:activity];
        [self.view addSubview:toolbar];
    }else if ([foodName isEqualToString:@"1"]){
        self.navigationItem.title = @"Apple Varieties";
        
        windowView = [[UIView alloc] init];
        webView = [[UIWebView alloc] init];
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        webView.scalesPageToFit = 1;
        toolbar = [[UIToolbar alloc] init];
        if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }
        else if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
            self.toolbar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
            self.toolbar.tintColor = [UIColor whiteColor];
            self.toolbar.translucent =0;
            
        }else{
            self.toolbar.tintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        }
        
        
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
        toolbar.items = items;
        
        NSURL *urlString = [NSURL URLWithString:@"http://www.rentanappletree.com/product-category/apple-trees-for-rent/"];
        NSURLRequest *url = [NSURLRequest requestWithURL:urlString];
        activity = [[UIActivityIndicatorView alloc] init];
        webView.delegate = self;
        activity.color = [UIColor grayColor];
        [webView loadRequest:url];
        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        
        webView.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
        [self.view addSubview:windowView];
        [windowView addSubview:webView];
        [windowView addSubview:activity];
        [self.view addSubview:toolbar];
    
        //NSString* someText = @"hey";
        //NSArray* dataToShare = @[someText];  // ...or whatever pieces of data you want to share.
        
        //UIActivityViewController* activityViewController =
        //[[UIActivityViewController alloc] initWithActivityItems:dataToShare
        //                                  applicationActivities:nil];
        //[self presentViewController:activityViewController animated:YES completion:^{}];
//        detailScrollView = [[UIScrollView alloc] init];
//        detailScrollView.scrollEnabled = 1;
//        
//        
//        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
//        //detailScrollView.delegate = self;
//        [self.view addSubview:detailScrollView];
//        text = [[UILabel alloc]init];
//        topText = [[UILabel alloc] init];
//        
//        topText.numberOfLines = 2;
//        topText.text = @"Rent an apple tree from our beautiful NY State orchard";
//        topText.textAlignment = NSTextAlignmentCenter;
//        topText.backgroundColor = [UIColor clearColor];
//        topText.font = [UIFont fontWithName:@"Baskerville" size:26];
//
//        text.backgroundColor = [UIColor clearColor];
//        text.numberOfLines = 100;
//
//        text.textAlignment = NSTextAlignmentLeft;
//        text.textColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
//        text.text = @"    Are you searching for the perfect gift for the upcoming holidays, or perhaps a birthday or anniversary? Or, maybe you have always wanted your own apple tree, but do not want to spend all that time and effort to care for it yourself? Or, maybe you love locally grown apples from New York State but live too far away?\n\nWhy not rent your own apple tree from a family orchard in upstate New York?\n\nThis way, you get all the benefits of owning your own tree without all the work. Plus, the beautiful box of 48 apples shipped directly to your door! We take care of the tricky jobs of planting, trimming, and harvesting the apples for you. You get to enjoy the fruits of our labor!\n\nApple trees can be rented for you personally, for a loved one, or to remember a special occasion or to honor an upcoming event!\n\nA gift box of apples from your tree will be sent to the appropriate recipient. The gift box of apples is personalized because they are harvested and made from your own tree. We also issue a beautiful personalized rental certificate that is mailed along in the gift box. Plus, we include four personalized gift bags for your use.";
//        [detailScrollView addSubview:topText];
//        [detailScrollView addSubview:text];
//        
//        
//    }else if ([foodName isEqualToString:@"1"]){
//        /*
//         self.navigationItem.title = @"Apple Varieties";
//         [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apples" ofType:@"html"]isDirectory:NO]]];
//         */
//        self.navigationItem.title = @"Apple Varieties";
//        detailScrollView = [[UIScrollView alloc] init];
//        detailScrollView.scrollEnabled = 1;
//        
//        
//        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
//        //detailScrollView.delegate = self;
//        [self.view addSubview:detailScrollView];
//        text = [[UILabel alloc]init];
//        topText = [[UILabel alloc] init];
//        webView = [[UIWebView alloc] init];
//        webView.scalesPageToFit = 0;
//        webView.scrollView.scrollEnabled = 0;
////        webView.layer.borderWidth = 2;
////        webView.layer.borderColor = [UIColor grayColor].CGColor;
//        topText.numberOfLines = 2;
//        topText.text = @"Infomation on different varieties:";
//        topText.textAlignment = NSTextAlignmentCenter;
//        topText.backgroundColor = [UIColor clearColor];
//        if (device == 1) topText.font = [UIFont fontWithName:@"Baskerville" size:20];
//        else topText.font = [UIFont fontWithName:@"Baskerville" size:28];
//        
//        text.backgroundColor = [UIColor clearColor];
//        text.numberOfLines = 100;
//        
//        text.textAlignment = NSTextAlignmentLeft;
//        text.textColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
//        text.text = @"    Seven deliciously distinct apple tree varieties are available for you to rent. Read below for specific information on each variety available. Please do not hesitate to contact us with any questions you may have about your variety of apple tree.\n\nWhat you will receive when you rent this tree:\n\nGift box filled with 48 beautiful apples from your own tree\n\nPersonalized Rental Certificate\n\nFour personalized gift bags\n\nQuarterly E-Newsletter";
//        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"apples" ofType:@"html"]isDirectory:NO]]];
//        [detailScrollView addSubview:topText];
//        [detailScrollView addSubview:text];
//        [detailScrollView addSubview:webView];
        
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"WEBVIEW");
    [activity startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"WEBVIEW END");
    [activity stopAnimating];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"web fail");
}
-(void)navWeb : (UIBarButtonItem*) sender{
    if (sender.tag == 1) {
        [webView goBack];
        NSLog(@"back");
    }else if (sender.tag == 2){
        [webView goForward];
        NSLog(@"forward");
    }else if (sender.tag == 3){
        [webView reload];
        NSLog(@"reload");
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [self layoutForInterfaceOrientation:(UIInterfaceOrientation)self];
}

-(void)orientationChanged{
    // key is intended to prevent false refresh on orientation shifts that are similar
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        if ([foodName isEqualToString:@"Gallery"] && key == 1) {
            NSLog(@"landscape");
        }
        key = 2;
        //[self layoutForInterfaceOrientation:(UIInterfaceOrientation)self];
        
    }else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
    {
        if ([foodName isEqualToString:@"Gallery"] && key == 2) {
            NSLog(@"portrait");
        }
        key = 1;
    }
}
-(void)initKey{
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        key = 2;
        NSLog(@"initLan");
        
    }else if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
    {
        key = 1;
        NSLog(@"initPort");
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"memory warning");
    // Dispose of any resources that can be recreated.
}

@end
