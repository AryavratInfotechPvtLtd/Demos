//
//  AnimatedView.m
//  Demos
//
//  Created by Rohit Parihar on 12/08/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "AnimatedView.h"

@interface AnimatedView ()

@end

@implementation AnimatedView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [_VwLog layoutIfNeeded];
    [_VwLog setFrame:CGRectMake(-_VwLog.frame.origin.x, _VwLog.frame.origin.y, _VwLog.frame.size.width, _VwLog.frame.size.height)];
    [_VwLog layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)animated{
    
}

-(void)viewDidLayoutSubviews {

        [super viewDidLayoutSubviews];
        [_VwLog setCenter:CGPointMake(-_VwLog.frame.size.width, _VwLog.center.y)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hideFromView{
    
    [UIView animateWithDuration:0.0 animations:^{
        
        [_txtUser setFrame:CGRectMake(-self.view.frame.size.width, _txtUser.frame.origin.y, _txtUser.frame.size.width, _txtUser.frame.size.height)];
        [_txtUser layoutIfNeeded];
    }];
    
}

+(UIImage *)DownloadImageFromUrl : (NSString *)url
{
    UIImage *Img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    return Imgurl
}

- (IBAction)BtnBack:(id)sender {
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
