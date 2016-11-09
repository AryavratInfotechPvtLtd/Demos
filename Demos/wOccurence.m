//
//  wOccurence.m
//  Demos
//
//  Created by Rohit Parihar on 20/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "wOccurence.h"

@interface wOccurence ()

@end

@implementation wOccurence

- (void)viewDidLoad {
    [super viewDidLoad];
    _lblWithOccurenceString.text = @"<Info>Personal Details</Info>Rohit Parihar is an IOS Developer at Aryavrat Infotech.<scriptOne>Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.</scriptOne><scriptTwo>Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.</scriptTwo>";
    
    NSString *Intermeditive;
    Intermeditive = [self removeSubstring:_lblWithOccurenceString.text thatStartsWith:@"<Info>" andEndsWith:@"</Info>"];
    Intermeditive = [self removeSubstring:Intermeditive thatStartsWith:@"<scriptOne>" andEndsWith:@"</scriptOne>"];
    Intermeditive = [self removeSubstring:Intermeditive thatStartsWith:@"<scriptTwo>" andEndsWith:@"</scriptTwo>"];
    _lblWithoutOccurenceString.text = Intermeditive;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *) removeSubstring:(NSString *)fromString thatStartsWith:(NSString *)startsWith andEndsWith:(NSString *)endsWith
{
    
    NSArray *splitByStartsWith = [fromString componentsSeparatedByString:startsWith];
    if ([splitByStartsWith count] > 1) {
        NSArray *splitByEndsWith = [splitByStartsWith[1] componentsSeparatedByString:endsWith];
        if ([splitByEndsWith count] > 1) {
            NSString *replaceThis = [startsWith stringByAppendingFormat:@"%@%@",splitByEndsWith[0],endsWith];
            return [fromString stringByReplacingOccurrencesOfString:replaceThis withString:@""];
        }
    }
    return fromString;
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
