//
//  TapViewController.m
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddGesture];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AddGesture{
    UITapGestureRecognizer *SingleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureMethods:)];
    [_Vw addGestureRecognizer:SingleTapGesture];
    
    UITapGestureRecognizer *DoubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGestureMethods:)];
    DoubleTapGesture.numberOfTapsRequired = 2;
    DoubleTapGesture.numberOfTouchesRequired = 2;
    [_Vw addGestureRecognizer:DoubleTapGesture];
}

- (void)handleGestureMethods:(UITapGestureRecognizer *)TapGesture{
    CGFloat newWidth;
    CGFloat newHeight;
    if (self.Vw.frame.size.width == 100.0 && self.Vw.frame.size.height == 100.0) {
        //HW (100, 100)
        newHeight = 200.0;
        newWidth = 100.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }else if(self.Vw.frame.size.width == 100.0 && self.Vw.frame.size.height == 200.0){
        //HW (200, 200)
        newWidth = 200.0f;
        newHeight = 200.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }else if (self.Vw.frame.size.width == 200.0 && self.Vw.frame.size.height == 200.0) {
        //HW (200, 100)
        newWidth = 200.0f;
        newHeight = 100.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }else{
        //HW (100, 100)
        newWidth = 100.0f;
        newHeight = 100.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }
    
    CGPoint VwCenter = self.view.center;
    self.Vw.center = VwCenter;
}

- (void)handleDoubleTapGestureMethods:(UITapGestureRecognizer *)TapGesture{
    CGFloat newWidth;
    CGFloat newHeight;
    if (self.Vw.frame.size.width == 100.0 && self.Vw.frame.size.height == 100.0) {
        //HW (100, 100)
        newHeight = 200.0;
        newWidth = 200.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }else if (self.Vw.frame.size.width == 200.0 && self.Vw.frame.size.height == 200.0){
        //HW (200, 200)
        newHeight = 100.0;
        newWidth = 100.0f;
        self.Vw.frame = CGRectMake(self.Vw.frame.origin.x, self.Vw.frame.origin.y, newWidth, newHeight);
    }
    
    CGPoint VwCenter = self.view.center;
    self.Vw.center = VwCenter;
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
