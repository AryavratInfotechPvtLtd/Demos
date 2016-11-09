//
//  CoreAnimationViewController.m
//  Demos
//
//  Created by Rohit Parihar on 22/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "CoreAnimationViewController.h"

@interface CoreAnimationViewController ()

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    _rocketVw.hidden = YES;
    _planVw.hidden = YES;
    _moonVw.hidden = YES;
    _sunVw.hidden = YES;
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _rocketVw.layer.cornerRadius = _rocketVw.frame.size.height/2;
    _rocketVw.clipsToBounds = YES;
    
    _planVw.layer.cornerRadius = _planVw.frame.size.height/2;
    _planVw.clipsToBounds = YES;
    
    _moonVw.layer.cornerRadius = _moonVw.frame.size.height/2;
    _moonVw.clipsToBounds = YES;
    
    _sunVw.layer.cornerRadius = _sunVw.frame.size.height/2;
    _sunVw.clipsToBounds = YES;
    
    _rocketVw.hidden = NO;
    _planVw.hidden = NO;
    _moonVw.hidden = NO;
    _sunVw.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAnimation:(id)sender {
    //Basic Animation
    CABasicAnimation *Animation = [CABasicAnimation animation];
    Animation.fromValue = @50;
    Animation.byValue = @200;
    Animation.duration = 1;
    
    Animation.fillMode = kCAFillModeForwards;
    Animation.removedOnCompletion = NO;
    
    //planView
    [UIView animateWithDuration:2.5 animations:^{
        Animation.keyPath = @"position.x";
        Animation.beginTime = CACurrentMediaTime() + 0.5;
        [_planVw.layer addAnimation:Animation forKey:@"basic"];
        
        _planVw.layer.position = CGPointMake(_planVw.frame.size.width/2, _planVw.frame.size.height/2);
        [_planVw layoutIfNeeded];
    }];
    
    //rockectView
    [UIView animateWithDuration:0.5 animations:^{
        Animation.keyPath = @"position.y";
        Animation.beginTime = CACurrentMediaTime() + 0.5;
        [_rocketVw.layer addAnimation:Animation forKey:@"basic"];
        
        _rocketVw.layer.position = CGPointMake(_rocketVw.frame.size.width/2, _rocketVw.frame.size.height/2);
        [_rocketVw layoutIfNeeded];
    } completion:^(BOOL finished) {
        CAKeyframeAnimation *KeyAnimation = [CAKeyframeAnimation animation];
        KeyAnimation.keyPath = @"position.x";
        
        KeyAnimation.values = @[ @0, @10, @-10, @10, @0 ];
        KeyAnimation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
        KeyAnimation.duration = 0.4;
        
        KeyAnimation.additive = YES;
        
        [_planVw.layer addAnimation:KeyAnimation forKey:@"shake"];
    }];
    
    
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_sunVw.layer addAnimation:orbit forKey:@"orbit"];
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
