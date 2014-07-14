//
//  uiViewViewController.h
//  UiView
//
//  Created by Andrew Sowers on 3/25/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface uiViewViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UIImageView *imgView;
    UIButton *treeButton;
    UILabel *scoreLabel;
    UIImageView *banner;
    UIImageView *base;
    UIImage *background;
    

}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, readwrite) UIButton *treeButton;
@property (nonatomic, readwrite) UILabel *scoreLabel;

@end
