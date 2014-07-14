//
//  uiViewDetailViewController.h
//  UiView
//
//  Created by Andrew Sowers on 3/25/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface uiViewDetailViewController : UIViewController <UIScrollViewDelegate,UITextFieldDelegate,UIWebViewDelegate>{
    UIWebView *webView;
    UIToolbar *toolbar;
    UIScrollView *scrollView;
    UIPageControl *imageCart;
    UICollectionView *imageCollect;
    UITabBarController *tabBarController;
    UIScrollView *detailScrollView;
    UILabel *text;
    UILabel *topText;
    UIActivityIndicatorView *activity;
    UIView *windowView;
    
}
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, strong) IBOutlet UILabel *foodLabel;
@property (nonatomic, strong) NSString *foodName;
@property (strong, nonatomic) IBOutlet UINavigationItem *titleBar;
@property (strong, nonatomic) IBOutlet UINavigationItem *titleBariPhone;

@end
