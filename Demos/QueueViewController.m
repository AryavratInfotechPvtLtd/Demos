//
//  ViewController.m
//  DispatchQueues
//
//  Created by Rohit Parihar on 10/08/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "QueueViewController.h"

@interface Downloader : NSObject

+(UIImage *)DownloadImageFromUrl : (NSString *)url;

@end

@implementation Downloader

+(UIImage *)DownloadImageFromUrl : (NSString *)url
{
    UIImage *Img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    return url;
}

@end

@interface QueueViewController ()
{
    NSArray *imgurls;
    NSOperationQueue *OperationQueue;
}
@end

@implementation QueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imgurls = @[@"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", @"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", @"http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg", @"http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"];
    
    OperationQueue = [[NSOperationQueue alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)BtnAction:(id)sender {
    [self BtnRemoveAction:sender];
    
    dispatch_queue_t Queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(Queue, ^{
        UIImage *Img1 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:0]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw1.image = Img1;
        });
     });
    
    dispatch_async(Queue, ^{
        UIImage *Img2 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:1]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw2.image = Img2;
        });
    });
    
    dispatch_async(Queue, ^{
        UIImage *Img3 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:2]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw3.image = Img3;
        });
    });
    
    dispatch_async(Queue, ^{
        UIImage *Img4 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:3]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw4.image = Img4;
        });
    });
}

- (IBAction)BtnSDQAction:(id)sender{
    [self BtnRemoveAction:sender];
    
    dispatch_queue_t Queue = dispatch_queue_create("com.imageQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(Queue, ^{
        UIImage *Img1 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:0]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw1.image = Img1;
        });
    });
    
    dispatch_async(Queue, ^{
        UIImage *Img2 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:1]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw2.image = Img2;
        });
    });
    
    dispatch_async(Queue, ^{
        UIImage *Img3 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:2]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw3.image = Img3;
        });
    });
    
    dispatch_async(Queue, ^{
        UIImage *Img4 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:3]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imgVw4.image = Img4;
        });
    });
}

- (IBAction)BtnRemoveAction:(id)sender {
    _imgVw1.image = nil;
    _imgVw2.image = nil;
    _imgVw3.image = nil;
    _imgVw4.image = nil;
}

- (IBAction)BtnOperation:(id)sender {
    [self BtnRemoveAction:sender];
    
    [OperationQueue addOperationWithBlock:^{
        UIImage *Img1 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:0]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            _imgVw1.image = Img1;
        }];
    }];
    
    [OperationQueue addOperationWithBlock:^{
        UIImage *Img2 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:1]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            _imgVw2.image = Img2;
        }];
    }];
    
    NSBlockOperation *OperationBlock1 = [NSBlockOperation blockOperationWithBlock:^{
        UIImage *Img3 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:2]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            _imgVw3.image = Img3;
        }];
    }];
    
    
    [OperationBlock1 setCompletionBlock:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIAlertController *Alert = [UIAlertController alertControllerWithTitle:@"Done" message:@"Download Completed!!!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            
            [Alert addAction:Ok];
            [self presentViewController:Alert animated:YES completion:nil];
        }];
    }];
    [OperationQueue addOperation:OperationBlock1];
    [OperationBlock1 setCompletionBlock:^{
        NSLog(@"Download 3 Img Operation Completed");
    }];
    
    NSBlockOperation *OperationBlock2 = [NSBlockOperation blockOperationWithBlock:^{
        UIImage *Img4 = [Downloader DownloadImageFromUrl:[imgurls objectAtIndex:3]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            _imgVw4.image = Img4;
        }];
    }];
    
    
    [OperationBlock2 setCompletionBlock:^{
         [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIAlertController *Alert = [UIAlertController alertControllerWithTitle:@"Done" message:@"Download Completed!!!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            
            [Alert addAction:Ok];
            [self presentViewController:Alert animated:YES completion:nil];
        }];
    }];
    
    [OperationQueue addOperation:OperationBlock2];
    [OperationBlock2 setCompletionBlock:^{
        NSLog(@"Download 4 Img Operation Completed");
    }];
    [OperationBlock1 addDependency:OperationBlock2];
}

- (IBAction)BtnOperationCancel:(id)sender {
    [OperationQueue cancelAllOperations];
}

@end
