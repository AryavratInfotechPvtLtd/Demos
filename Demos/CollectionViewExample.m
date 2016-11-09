//
//  CollectionViewExample.m
//  Demos
//
//  Created by Rohit Parihar on 08/09/16.
//  Copyright © 2016 Aryavrat. All rights reserved.
//

#import "CollectionViewExample.h"

@interface CollectionViewExample ()
{
    NSArray *Names;
    NSArray *Images;
}
@end

@implementation CollectionViewExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Names = [NSArray arrayWithObjects:@"@1", @"@2", @"@3", @"@4", @"@5", @"@6", @"@7", @"@8", @"@9", @"@10", @"@11", @"@12", @"@13", @"@14", @"@15", @"@16", nil];
    Images = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", nil];
    
    _CollectionVw.delegate = self;
    _CollectionVw.dataSource = self;
    
    _CollectionVw.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionView Delegate & DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [Names count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *RowCell;
    
    RowCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Collection_Cell" forIndexPath:indexPath];
    RowCell.backgroundColor = [UIColor grayColor];
    
    UIImageView *CellImgVw = [RowCell viewWithTag:1001];
    CellImgVw.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[Images objectAtIndex:indexPath.row]]];
    
    UILabel *CellName = [RowCell viewWithTag:1002];
    CellName.text = [Names objectAtIndex:indexPath.row];
    
    UIButton *CellBtn = [RowCell viewWithTag:1003];
    [CellBtn addTarget:self action:@selector(BtnPress) forControlEvents:UIControlEventTouchUpInside];
    
    return RowCell;
}

-(void) BtnPress {
    UIAlertController *Alert = [UIAlertController alertControllerWithTitle:@"@" message:@"You have Press Button On Cell!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *Ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [Alert addAction:Ok];
    [self presentViewController:Alert animated:YES completion:Nil];
}


#pragma mark - CollectionView Layout Things
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    //for setting spaces from (top left bottom right)
    return UIEdgeInsetsMake(5,5,5,5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //for setting item size
    NSInteger Width;
    if  ([[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortrait){
        Width = CGRectGetWidth(_CollectionVw.bounds) - 15;
        return CGSizeMake(Width/2, Width/2);
    }
    Width = CGRectGetWidth(_CollectionVw.bounds) - 20;
    return CGSizeMake(Width/3, Width/3);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *ReusableVw = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *HeaderVw = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header_Cell" forIndexPath:indexPath];
        HeaderVw.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:92.0/255.0f blue:92.0/255.0f alpha:1.0f];
        ReusableVw = HeaderVw;
    }
    else{
        UICollectionReusableView *FooterVw = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer_Cell" forIndexPath:indexPath];
        FooterVw.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:128.0/255.0f blue:128.0/255.0f alpha:1.0f];
        ReusableVw = FooterVw;
    }
    
    return ReusableVw;
}

#pragma mark - View Rotation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    [_CollectionVw.collectionViewLayout invalidateLayout];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [_CollectionVw performBatchUpdates:nil completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeZero;
    }else {
        return CGSizeMake(_CollectionVw.bounds.size.width, 20.0f);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
        return CGSizeMake(_CollectionVw.bounds.size.width, 20.0f);
}

@end
