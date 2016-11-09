//
//  MenuViewController.m
//  Demos
//
//  Created by Rohit Parihar on 06/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "MenuViewController.h"
#define menuWidth 150.0

@interface MenuViewController ()
{
    NSArray *MenuItems;
//    BOOL floatShowHide;
    //NSMutableArray *SocialApplication;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Initilaize];
    
    [self SetTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)Initilaize{
    MenuItems = [NSArray arrayWithObjects:@"Login", @"Register", @"AboutUs", @"ContactUs", @"LogOut", nil];
}

-(void)SetTableView{
    _TblMenu.delegate = self;
    _TblMenu.dataSource = self;
    _TblMenu.backgroundColor = [UIColor blackColor];

    [_TblMenu reloadData];
    
    //[self ShowOrHide:YES];
    
//    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    
//    UISwipeGestureRecognizer *showMenuGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                          action:@selector(handleGesture:)];
//    showMenuGesture.direction = UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:showMenuGesture];
//    
//    UISwipeGestureRecognizer *hideMenuGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                          action:@selector(handleGesture:)];
//    hideMenuGesture.direction = UISwipeGestureRecognizerDirectionLeft;
//    [_MenuVw addGestureRecognizer:hideMenuGesture];
}

-(void)handleGesture:(UISwipeGestureRecognizer *)gesture{
//    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
//        //[self ShowOrHide:YES];
//    }
//    else{
//        //[self ShowOrHide:NO];
//    }
}

#pragma mark - UITableViewDelegate & DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return [MenuItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell;
        Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        UILabel *MenuItemText = [Cell.contentView viewWithTag:1];
        MenuItemText.text = [MenuItems objectAtIndex:indexPath.row];
        Cell.backgroundColor = [UIColor clearColor];
    return Cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 65;
}

-(void)ShowOrHide:(BOOL)Hide{
    [self.animator removeAllBehaviors];
    
    CGFloat gravityDirectionX = (Hide) ? 1.0 : -1.0;
    CGFloat pushMagnitude = (Hide) ? 20.0 : -20.0;
    CGFloat boundaryPointX = (Hide) ? menuWidth : -menuWidth;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[_MenuVw]];
    gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX, 0.0);
    [self.animator addBehavior:gravityBehavior];
    
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_MenuVw]];
    [collisionBehavior addBoundaryWithIdentifier:@"menuBoundary"
                                       fromPoint:CGPointMake(boundaryPointX, 20.0)
                                         toPoint:CGPointMake(boundaryPointX, self.tabBarController.tabBar.frame.origin.y)];
    [self.animator addBehavior:collisionBehavior];
    
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[_MenuVw]
                                                                    mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.magnitude = pushMagnitude;
    [self.animator addBehavior:pushBehavior];
    
    
    UIDynamicItemBehavior *menuViewBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_MenuVw]];
    menuViewBehavior.elasticity = 0.4;
    [self.animator addBehavior:menuViewBehavior];
    
    _MenuVw.alpha = (Hide) ? 0.5 : 0.0;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
