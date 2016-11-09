//
//  CollectionViewExample.h
//  Demos
//
//  Created by Rohit Parihar on 08/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewExample : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *CollectionVw;

@end
