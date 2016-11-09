//
//  DemosGlobalFunctions.m
//  Demos
//
//  Created by Rohit Parihar on 21/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "DemosGlobalFunctions.h"

@implementation DemosGlobalFunctions

+(id)getTopViewController{
    //for getting top presented view controller when info view is opened
    @try {
        UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        while (topController.presentedViewController) {
            topController = topController.presentedViewController;
        }
        if (![topController isKindOfClass:[NSNull class]]) {
            return topController;
        }
    }
    @catch (NSException *exception) {
        NSLog(NSLocalizedString(@"errorHandling", nil), __func__, __LINE__, exception.reason);
    }
}

@end
