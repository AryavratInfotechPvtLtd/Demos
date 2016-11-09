//
//  SwipeViewController.h
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *FriendName;
@property (strong, nonatomic) IBOutlet UILabel *Known_Unknown;

-(void)handleRightSwipeGesture:(UISwipeGestureRecognizer *)SwipeGesture;
-(void)handleLeftSwipeGesture:(UISwipeGestureRecognizer *)SwipeGesture;

@end
