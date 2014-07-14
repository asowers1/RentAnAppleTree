//
//  UIViewBuilder.m
//  RentAnAppleTrees
//
//  Created by Andrew Sowers on 6/11/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import "UIViewBuilder.h"





@interface UIViewBuilder (){
    NSInteger device;
}

@end

@implementation UIViewBuilder
@synthesize overlay;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"builder disappears");
}


-(BOOL)shouldAutorotate
{
    return device == 1 ? 0 : 1;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return  [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        device = 1;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        device = 2;
    }
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending) {
        self.navigationBar.topItem.title = @"Rent An Apple Tree";
        
        self.navigationBar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        self.navigationBar.tintColor = [UIColor whiteColor];
        
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor colorWithRed:242/255.0 green:130/255.0 blue:2/255.0 alpha:1.0];
        shadow.shadowOffset = CGSizeMake(1, 0);
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                               shadow, NSShadowAttributeName,
                                                               [UIFont fontWithName:@"Baskerville" size:21.0], NSFontAttributeName, nil]];
    }else if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
        self.navigationBar.topItem.title = @"Rent An Apple Tree";
        
        self.navigationBar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        self.navigationBar.tintColor = [UIColor whiteColor];
        
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor colorWithRed:242/255.0 green:130/255.0 blue:2/255.0 alpha:1.0];
        shadow.shadowOffset = CGSizeMake(1, 0);
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                               shadow, NSShadowAttributeName,
                                                               [UIFont fontWithName:@"Baskerville" size:21.0], NSFontAttributeName, nil]];
        
    
    
    
    }else{
        self.navigationBar.topItem.title = @"Rent An Apple Tree";
        
        self.navigationBar.barTintColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        self.navigationBar.tintColor = [UIColor whiteColor];
        
        NSShadow *shadow = [[NSShadow alloc] init];
        shadow.shadowColor = [UIColor colorWithRed:242/255.0 green:130/255.0 blue:2/255.0 alpha:1.0];
        shadow.shadowOffset = CGSizeMake(1, 0);
        [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor colorWithRed:255/255.0 green:255/255.0 blue:102/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                               shadow, NSShadowAttributeName,
                                                               [UIFont fontWithName:@"Baskerville" size:21.0], NSFontAttributeName, nil]];
    }


    
    
    //[self.navigationBar addSubview:overlay];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
