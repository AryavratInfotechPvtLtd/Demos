//
//  SwipeViewController.m
//  Demos
//
//  Created by Rohit Parihar on 05/10/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
{
    NSMutableArray *Friends;
    NSInteger Count;
    MBProgressHUD *Hud;
}
@end

@implementation SwipeViewController

- (void)viewDidLoad {
    
    
    
    
    [super viewDidLoad];
    
    [self AddGesture];
    
    Count = 0;
    Friends = [[NSMutableArray alloc] init];
    _FriendName.text = _Known_Unknown.text = nil;
    
    Hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:Hud];
    
    Hud.mode = MBProgressHUDModeText;
    Hud.yOffset = 100.0f;
    
    NSDictionary *_UKFriendFirst = [[NSDictionary alloc] initWithObjectsAndKeys:@"Rajat Jain", @"_Friend", @"Yes", @"_Known", nil];
    [Friends addObject:_UKFriendFirst];
    
    NSDictionary *_UKFriendSecond = [[NSDictionary alloc] initWithObjectsAndKeys:@"Ramesh Sain", @"_Friend", @"Yes", @"_Known", nil];
    [Friends addObject:_UKFriendSecond];
    
    NSDictionary *_UKFriendThird = [[NSDictionary alloc] initWithObjectsAndKeys:@"Kapli Sharma", @"_Friend", @"No", @"_Known", nil];
    [Friends addObject:_UKFriendThird];
    
    
    NSDictionary *_UKFriendFour = [[NSDictionary alloc] initWithObjectsAndKeys:@"Udit Parihar", @"_Friend", @"Yes", @"_Known", nil];
    [Friends addObject:_UKFriendFour];
    
    NSDictionary *_UKFriendFifth = [[NSDictionary alloc] initWithObjectsAndKeys:@"Maya Shanker Sain", @"_Friend", @"Yes", @"_Known", nil];
    [Friends addObject:_UKFriendFifth];
    
    NSDictionary *_UKFriendSix = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mohit Jain", @"_Friend", @"No", @"_Known", nil];
    [Friends addObject:_UKFriendSix];
    
    NSDictionary *_UKFriendSeven = [[NSDictionary alloc] initWithObjectsAndKeys:@"Juhi Jain", @"_Friend", @"No", @"_Known", nil];
    [Friends addObject:_UKFriendSeven];
    
    NSDictionary *_UKFriendEight = [[NSDictionary alloc] initWithObjectsAndKeys:@"Priyanka Choudhary", @"_Friend", @"Yes", @"_Known", nil];
    [Friends addObject:_UKFriendEight];
    
    NSDictionary *_UKFriendNine = [[NSDictionary alloc] initWithObjectsAndKeys:@"Priyanka Sharma", @"_Friend", @"No", @"_Known", nil];
    [Friends addObject:_UKFriendNine];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)AddGesture{
    UISwipeGestureRecognizer *RightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleRightSwipeGesture:)];
    RightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:RightGesture];
    
    UISwipeGestureRecognizer *LeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleLeftSwipeGesture:)];
    LeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:LeftGesture];
}

-(void)handleRightSwipeGesture:(UISwipeGestureRecognizer *)SwipeGesture{
    
    @try {
        if (Count >= [Friends count]){
            Hud.detailsLabel.text = @"You Have Reached at Last";
            [Hud showAnimated:YES];
            [Hud hideAnimated:YES afterDelay:0.2f];
        }else{
            _FriendName.text = [[Friends objectAtIndex:Count] valueForKey:@"_Friend"];
            
            if ([[[Friends objectAtIndex:Count] valueForKey:@"_Known"] isEqualToString:@"Yes"]) {
                _Known_Unknown.text = @"Friend";
            } else{
                _Known_Unknown.text = @"Unknown";
            }
            Count++;
        }
    } @catch (NSException *exception) {
        NSLog(@"%s", __func__);
    }
}

-(void)handleLeftSwipeGesture:(UISwipeGestureRecognizer *)SwipeGesture{
    @try {
        if (Count > 0){
            _FriendName.text = [[Friends objectAtIndex:Count-1] valueForKey:@"_Friend"];
            if ([[[Friends objectAtIndex:Count-1] valueForKey:@"_Known"] isEqualToString:@"Yes"]) {
                _Known_Unknown.text = @"Friend";
            } else{
                _Known_Unknown.text = @"Unknown";
            }
            Count--;
            
        }else{
            Hud.detailsLabel.text = @"You Have Reached at First";
            [Hud showAnimated:YES];
            [Hud hideAnimated:YES afterDelay:0.2f];
        }
    } @catch (NSException *exception) {
        NSLog(@"%s", __func__);
    }
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
