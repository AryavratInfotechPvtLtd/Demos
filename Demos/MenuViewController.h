//
//  MenuViewController.h
//  Demos
//
//  Created by Rohit Parihar on 06/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIView *MenuVw;
@property (strong, nonatomic) IBOutlet UITableView *TblMenu;
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
