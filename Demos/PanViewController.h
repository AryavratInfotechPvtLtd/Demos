//
//  PanViewController.h
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *Vw;
@property (strong, nonatomic) IBOutlet UIView *TopVw;
@property (strong, nonatomic) IBOutlet UIView *BottomVw;
@property (strong, nonatomic) IBOutlet UIView *RightVw;
@property (strong, nonatomic) IBOutlet UIView *LeftVw;

-(void)handlePanGesture:(UIPanGestureRecognizer *)Gesture;
-(void)handleTopVwPanGesture:(UIPanGestureRecognizer *)Gesture;
-(void)handleBottomVwPanGesture:(UIPanGestureRecognizer *)Gesture;
-(void)handleLeftVwPanGesture:(UIPanGestureRecognizer *)Gesture;
-(void)handleRightVwPanGesture:(UIPanGestureRecognizer *)Gesture;

@property (nonatomic, strong)UIDynamicAnimator *animator;

@end
