//
//  GifAnimationViewController.m
//  Demos
//
//  Created by Rohit Parihar on 12/08/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "GifAnimationViewController.h"

@interface GifAnimationViewController ()

@end

@implementation GifAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //With Image Url
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"animated" withExtension:@"gif"];
    UIImage *Img1 = [UIImage animatedImageWithAnimatedGIFURL:url];
    _ImgVw1.animationImages = Img1.images;
    _ImgVw1.animationDuration = Img1.duration;
    _ImgVw1.animationRepeatCount = 1;
    _ImgVw1.image = Img1.images.lastObject;
    [_ImgVw1 startAnimating];
    
    
    //With Image Data
    UIImage *Img2 = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    _ImgVw2.animationImages = Img2.images;
    _ImgVw2.animationDuration = Img2.duration;
    _ImgVw2.animationRepeatCount = 10;
    _ImgVw2.image = Img2.images.lastObject;
    [_ImgVw2 startAnimating];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnAction:(id)sender {
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
