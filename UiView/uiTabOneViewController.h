//
//  uiTabOneViewController.h
//  RentAnAppleTree
//
//  Created by Andrew Sowers on 7/3/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface uiTabOneViewController : UIViewController <UIWebViewDelegate>{
    NSInteger *initKey;
    UIWebView *webView;
    UIActivityIndicatorView *activity;
}
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) UIWebView *webView;
@end
