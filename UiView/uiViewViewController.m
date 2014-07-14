//
//  uiViewViewController.m
//  UiView
//
//  Created by Andrew Sowers on 3/25/13.
//  Copyright (c) 2013 Andrew Sowers. All rights reserved.
//
#import "uiViewViewController.h"
#import "uiViewDetailViewController.h"
#import "UIViewBuilder.h"
@interface uiViewViewController ()
{
    int device;
    int segueIdent;
    int flipKey;
    int setupKey;
}
@end
@implementation uiViewViewController
{
    NSArray *recipes;
    
}
@synthesize treeButton, scoreLabel;

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [treeButton removeFromSuperview];
    [scoreLabel removeFromSuperview];
    self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self layoutMath:0];
    [self.view addSubview:treeButton];
    [self.view addSubview:scoreLabel];
}

- (void) layoutForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"initLayout");
    [self layoutMath:1];
    
}
-(void)layoutMath:(NSInteger)initFlag{
CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (initFlag == 1) {
        if (device == 1) {
            if(fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)568)<DBL_EPSILON) // is iphone 5
            {
                scoreLabel =  [[UILabel alloc] initWithFrame:CGRectMake(100, 460, 120, 50)];
                treeButton =  [UIButton buttonWithType:UIButtonTypeCustom];
                treeButton.frame = CGRectMake(95, 332, 132, 185);
                            self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backPhone.png"]];
            }
            else
            {
                scoreLabel =  [[UILabel alloc] initWithFrame:CGRectMake(100, 425, 120, 50)];
                treeButton =  [UIButton buttonWithType:UIButtonTypeCustom];
                treeButton = [[UIButton alloc] initWithFrame:CGRectMake(95, 300, 132, 185)];
                self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backPhoneSmall.png"]];

            }
            //self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
            scoreLabel.font = [UIFont fontWithName:@"Baskerville-Italic" size:(22)];
        }else if (device == 2){
            if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
                NSLog(@"port");
                treeButton = [[UIButton alloc] initWithFrame:CGRectMake((screenRect.size.width / 3.0)-4, 520, 264, 370)];
                scoreLabel =  [[UILabel alloc] initWithFrame:CGRectMake((screenRect.size.width / 2.4), 760, 120, 50)];
                //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPadPort.png"]];
                NSLog(@"back Port");
 
            }else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
                NSLog(@"lan");
                if([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending){

                    treeButton = [[UIButton alloc] initWithFrame:CGRectMake((screenRect.size.width / 2.0)-111.5, 325, 234, 370)];
                    scoreLabel =  [[UILabel alloc] initWithFrame:CGRectMake((screenRect.size.width / 2.0)-52, 560, 120, 50)];
                    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPad.png"]];
                }else{
                    treeButton = [[UIButton alloc] initWithFrame:CGRectMake((screenRect.size.width / 2.0)+11.5, 325, 234, 370)];
                    scoreLabel =  [[UILabel alloc] initWithFrame:CGRectMake((screenRect.size.width / 2.0)+68, 560, 120, 50)];
                    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPad.png"]];
                }
            }
            scoreLabel.font = [UIFont fontWithName:@"Baskerville-Italic" size:(26)];
            NSLog(@"FlipKey%d",flipKey);
        }
        [scoreLabel setTextAlignment:NSTextAlignmentCenter];
        scoreLabel.textColor = [UIColor colorWithRed:51/255.0 green:75/255.0 blue:17/255.0 alpha:1.0];
        scoreLabel.shadowColor = [UIColor colorWithRed:239/255.0 green:237/255.0 blue:214/255.0 alpha:1.0];
        scoreLabel.backgroundColor = [UIColor clearColor];
        scoreLabel.text = @"Tap To Rent";
        [treeButton addTarget:self action:@selector(moveView) forControlEvents:UIControlEventTouchDown];
        [treeButton setImage:[UIImage imageNamed:@"tree.png"] forState:UIControlStateNormal];
        [self.view addSubview: treeButton];
        [self.view addSubview: scoreLabel];

        setupKey = 1;
    }else if (initFlag == 0){
        if (device == 1) {
            
            if(fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)568)<DBL_EPSILON) // is iphone 5
                treeButton.frame = CGRectMake(95, 300, 132, 185);
            else
                treeButton.frame = CGRectMake(95, 225, 132, 185);
        }else if (device == 2){
            NSLog(@"FlipKey%d",flipKey);
            if(UIInterfaceOrientationIsPortrait(self.interfaceOrientation)){
                treeButton.frame = CGRectMake((screenRect.size.width / 3.0)-4, 520, 264, 370);
                scoreLabel.frame = CGRectMake((screenRect.size.width / 2.4), 760, 120, 50);
                //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPadPort.png"]];
                NSLog(@"back Port");
                NSLog(@"port");

            }else if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
                if([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending){
                    
                    treeButton.frame = CGRectMake((screenRect.size.width / 2.0)-111.5, 325, 234, 370);
                    scoreLabel.frame = CGRectMake((screenRect.size.width / 2.0)-52, 560, 120, 50);
                    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPad.png"]];
                }else{
                    treeButton.frame = CGRectMake((screenRect.size.width / 2.0)+11.5, 325, 234, 370);
                    scoreLabel.frame = CGRectMake((screenRect.size.width / 2.0)+68, 560, 120, 50);
                    //self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundPad.png"]];
                }
            }
        }
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidAppear:(BOOL)animated{
    if (setupKey == 0) {
        [self layoutForInterfaceOrientation:(UIInterfaceOrientation)self];
    }else if (setupKey == 1){
        [self layoutMath:1];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    flipKey = 0;
    recipes = [NSArray arrayWithObjects: @"About us", @"Gallery", @"Apple Varieties", @"Our Farm", @"Blog", nil];
    self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if(([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending)||[[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending){
        
        self.tableView.frame = CGRectMake(100, 100, screenRect.size.width, 128);
    }
    

    
    UIStoryboard *storyboard;
    segueIdent = 0;
    setupKey = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        device = 1;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
        device = 2;
    }
    

}
-(void)moveView{
    segueIdent = 1;
    [self performSegueWithIdentifier:@"showRecipeDetail" sender:self];
}

- (void)viewDidUnload
{
    NSLog(@"viewdidunload");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [recipes count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"ViewWillApear");
    NSLog(@"SETUPKEY %d",setupKey);

    // Unselect the selected row if any
    NSIndexPath*    selection = [self.tableView indexPathForSelectedRow];
    if (selection) {
        
        [self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segueIdent %d",segueIdent);
    UIImage *barButton = [UIImage imageNamed:@"bars2.png"];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithImage:barButton landscapeImagePhone:nil style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    uiViewDetailViewController *destViewController = segue.destinationViewController;
    if (segueIdent == 1) {
        destViewController.foodName = @"http://www.rentanappletree.com/product-category/apple-trees-for-rent/";
        destViewController.navigationItem.title = @"Rent a tree";
    }else{
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *selection = [recipes objectAtIndex:indexPath.row];
        
        if ([selection isEqual:@"Blog"]){
            destViewController.navigationItem.title = selection;
            NSLog(@"BLOG");
            destViewController.foodName = @"http://rentafruittreeblog.com";
            }else if([selection isEqual:@"Gallery"]){
                destViewController.navigationItem.title = selection;
                destViewController.foodName = @"Gallery";
            }else if ([selection isEqualToString:@"About us"]){
                destViewController.foodName = @"About us";
            }else if ([selection isEqualToString:@"Our Farm"]){
                    destViewController.foodName = @"farmView";
            }else if ([selection isEqualToString:@"Apple Varieties"]){
                destViewController.foodName = @"1";
            }
            else destViewController.foodName = @"http://www.google.com";
    
        }
    }
    segueIdent = 0;
    
    if (([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending&&device!=1)||device==2) {
    [treeButton removeFromSuperview];
    [scoreLabel removeFromSuperview];
    self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
    }else if (([[[UIDevice currentDevice] systemVersion] compare:@"8" options:NSNumericSearch] != NSOrderedAscending&&device!=1)||device==2) {
        [treeButton removeFromSuperview];
        [scoreLabel removeFromSuperview];
        self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:247/255.0 blue:224/255.0 alpha:1.0];
    }
    
}
@end