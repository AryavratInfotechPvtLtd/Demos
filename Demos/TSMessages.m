//
//  TSMessages.m
//  Demos
//
//  Created by Rohit Parihar on 19/08/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "TSMessages.h"

@interface TSMessages ()

@end

@implementation TSMessages

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)TSMessagesBtnAction:(id)sender {
    [TSMessage showNotificationInViewController:self
                                           title:@"TSMessages Example" subtitle:@"TSMessages Example Subtitle."
                                          image:nil
                                           type:TSMessageNotificationTypeSuccess
                                       duration:3.0
                                       callback:^{
                                           NSLog(@"Notification on Click");}
                                    buttonTitle:nil
                                 buttonCallback:nil
                                     atPosition:TSMessageNotificationPositionNavBarOverlay
                           canBeDismissedByUser:YES];
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
