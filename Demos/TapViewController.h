//
//  TapViewController.h
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *Vw;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *VwHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *VwWidth;

- (void)handleGestureMethods:(UITapGestureRecognizer *)TapGesture;
- (void)handleDoubleTapGestureMethods:(UITapGestureRecognizer *)TapGesture;
@end
