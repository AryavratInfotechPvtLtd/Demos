//
//  ValidationViewController.m
//  Demos
//
//  Created by Rohit Parihar on 22/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "ValidationViewController.h"

@interface ValidateTexts : NSObject

//Check Email Validations
+(BOOL)validateEmailWithString:(NSString*)txtEmail;
@end

@implementation ValidateTexts

+(BOOL)validateEmailWithString:(NSString*)txtEmail
{
    //PrimaryEmail MustContains (numbers, alphabates, digits, special characters(._%+-))
    //Domain Name Must Contains (numbers, alphabates, digits, .-)
    //
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:txtEmail];
}

@end

@interface ValidationViewController ()

@end

@implementation ValidationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BtnValidate:(id)sender {
    if ([ValidateTexts validateEmailWithString:_Txt.text]) {
        _Txt.textColor = [UIColor blueColor];
    }else{
        _Txt.textColor = [UIColor redColor];
    }
}

- (IBAction)BtnBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
