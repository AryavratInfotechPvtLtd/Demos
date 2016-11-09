//
//  LocalNotification.m
//  Demos
//
//  Created by Rohit Parihar on 21/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "LocalNotification.h"

@interface LocalNotification ()

@end

@implementation LocalNotification

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PostNotification:(id)sender {
    UILocalNotification *Notification = [[UILocalNotification alloc] init];
    Notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:60];
    Notification.alertBody = @"Rohit Parihar";
    Notification.timeZone = [NSTimeZone defaultTimeZone];
    Notification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:Notification];
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
