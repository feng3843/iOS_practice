//
//  HXcollectionviewController.m
//  ios
//
//  Created by ivy.sun on 16/2/25.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "HXcollectionviewController.h"
#import "ZCollectionViewCell.h"
#import  "Hxflowlayout.h"

@interface HXcollectionviewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HXcollectionviewController

-(NSMutableArray *)dataArry
{
    if (!_dataArry) {
        self.dataArry = [NSMutableArray array];
        for (int i = 0; i<11; i++) {
            [_dataArry addObject:[NSString stringWithFormat:@"%d",i]];
        }
     }
    return _dataArry;
}



static NSString * const ID=@"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    Hxflowlayout *layout =  [[Hxflowlayout alloc]init];
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, w, w) collectionViewLayout:layout];
    collectionview.pagingEnabled = YES;
    collectionview.delegate =self;
    collectionview.dataSource = self;
    [collectionview registerClass:[ZCollectionViewCell class] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionview];
     self.collectionView = collectionview;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArry.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCollectionViewCell *cell;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    
    [cell.imgv setImage:[UIImage imageNamed:@"m_3_100"]];
//    NSLog(@"%p",cell);
    
    return cell;
}

@end
