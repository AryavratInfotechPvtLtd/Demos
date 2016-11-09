//
//  PanViewController.m
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "PanViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self AddGesture];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    _Vw.layer.cornerRadius = _Vw.frame.size.height/2;
    _TopVw.layer.cornerRadius = _TopVw.frame.size.height/2;
    _BottomVw.layer.cornerRadius = _BottomVw.frame.size.height/2;
    _LeftVw.layer.cornerRadius = _LeftVw.frame.size.height/2;
    _RightVw.layer.cornerRadius = _RightVw.frame.size.height/2;
    
   
    [_LeftVw setHidden:NO];
    [_TopVw setHidden:NO];
    [_Vw setHidden:NO];
    [_BottomVw setHidden:NO];
    [_RightVw setHidden:NO];
    
    [self Set_Animator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Set_Animator{
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self SetGravity];
}

-(void)SetGravity{
    UIGravityBehavior *GravityBehaviour = [[UIGravityBehavior alloc] initWithItems:@[_LeftVw, _TopVw, _Vw, _BottomVw, _RightVw]];
    [_animator addBehavior:GravityBehaviour];
    [self AddCollisionBehaviour];
}

-(void)AddCollisionBehaviour{
    UICollisionBehavior *CollisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[_LeftVw, _TopVw, _Vw, _BottomVw, _RightVw]];
    CollisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [CollisionBehavior addBoundaryWithIdentifier:@"Tabbar" fromPoint:self.tabBarController.tabBar.frame.origin toPoint:CGPointMake(self.tabBarController.tabBar.frame.origin.x + self.tabBarController.tabBar.frame.size.width, self.tabBarController.tabBar.frame.origin.y)];
    CollisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    [_animator addBehavior:CollisionBehavior];
    [self AddDymanicItemBehavior];
}

-(void)AddDymanicItemBehavior{
    UIDynamicItemBehavior *DynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[_LeftVw, _TopVw, _Vw, _BottomVw, _RightVw]];
    DynamicItemBehavior.elasticity = 0.9;
    DynamicItemBehavior.resistance = 0.0;
    DynamicItemBehavior.friction = 0.0;
    DynamicItemBehavior.allowsRotation = YES;
    [_animator addBehavior:DynamicItemBehavior];
}

-(void)AddGesture{
    UIPanGestureRecognizer *PanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handlePanGesture:)];
    [_Vw addGestureRecognizer:PanGesture];
    
    UIPanGestureRecognizer *TopPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handleTopVwPanGesture:)];
    [_TopVw addGestureRecognizer:TopPanGesture];
    
    
    UIPanGestureRecognizer *BottomPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handleBottomVwPanGesture:)];
    [_BottomVw addGestureRecognizer:BottomPanGesture];
    
    UIPanGestureRecognizer *RightPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handleRightVwPanGesture:)];
    [_RightVw addGestureRecognizer:RightPanGesture];
    
    UIPanGestureRecognizer *LeftPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(handleLeftVwPanGesture:)];
    [_LeftVw addGestureRecognizer:LeftPanGesture];
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)Gesture{

    CGPoint TouchPoints = [Gesture locationInView:self.view];
    _Vw.center = TouchPoints;
    [_animator updateItemUsingCurrentState:_Vw];
}

-(void)handleTopVwPanGesture:(UIPanGestureRecognizer *)Gesture{
    
    CGPoint TouchPoints = [Gesture locationInView:self.view];
    _TopVw.center = TouchPoints;
}

-(void)handleBottomVwPanGesture:(UIPanGestureRecognizer *)Gesture{
    
    CGPoint TouchPoints = [Gesture locationInView:self.view];
    _BottomVw.center = TouchPoints;
}

-(void)handleRightVwPanGesture:(UIPanGestureRecognizer *)Gesture{
    
    CGPoint TouchPoints = [Gesture locationInView:self.view];
    _RightVw.center = TouchPoints;
}

-(void)handleLeftVwPanGesture:(UIPanGestureRecognizer *)Gesture{
    
    CGPoint TouchPoints = [Gesture locationInView:self.view];
    _LeftVw.center = TouchPoints;
}

- (IBAction)BtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)BtnRefresh:(id)sender {
    [_animator removeAllBehaviors];
    [self Set_Animator];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *Touch = [touches anyObject];
    CGPoint TouchLocation = [Touch locationInView:self.view];
    CGPoint MakePoint = CGPointMake(TouchLocation.x, TouchLocation.y);
    if (Touch.view.tag == 1) {
        _Vw.center = MakePoint;
        [_animator updateItemUsingCurrentState:_Vw];
    }else if (Touch.view.tag == 2) {
        _TopVw.center = MakePoint;
        [_animator updateItemUsingCurrentState:_TopVw];
    }else if (Touch.view.tag == 3) {
        _BottomVw.center = MakePoint;
        [_animator updateItemUsingCurrentState:_BottomVw];
    }else if (Touch.view.tag == 4) {
        _LeftVw.center = MakePoint;
        [_animator updateItemUsingCurrentState:_LeftVw];
    }else if (Touch.view.tag == 5) {
        _RightVw.center = MakePoint;
        [_animator updateItemUsingCurrentState:_RightVw];
    }
}

//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch *Touch = [touches anyObject];
//    CGPoint TouchLocation = [Touch locationInView:self.view];
//    NSLog(@"Locations : %f", TouchLocation.x);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
