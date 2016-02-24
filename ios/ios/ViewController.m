//
//  ViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/24.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ViewController

-(NSArray *)filmImages
{
    if (_filmImages==nil) {
        self.filmImages = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [self.filmImages addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _filmImages;
}



static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.itemSize = CGSizeMake(30, 30);
//    layout.minimumInteritemSpacing = 0;
//    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
//    layout.sectionInset = UIEdgeInsetsMake(0.f, 0, 9.f, 0);
    UICollectionView *collectionview= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 300, 400) collectionViewLayout:layout];
    
    [collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    NSLog(@"%zd",self.filmImages.count);
    //    self.collectionView.backgroundColor = [UIColor yellowColor];
    collectionview.delegate=self;
    collectionview.dataSource = self;
    [self.view addSubview:collectionview];
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

#pragma mark <UICollectionViewDataSource>




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of items
    NSLog(@"----->%zd",self.filmImages.count);
    return self.filmImages.count;
    //    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    
    UICollectionViewCell *cell ;
    cell= [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
//    UIImageView *imgV =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    imgV.backgroundColor = [UIColor redColor];
//    [imgV setImage:[UIImage imageNamed:@"m_3_100"]];
//    [cell.contentView addSubview:imgV];
    cell.backgroundColor = [UIColor grayColor];
    // Configure the cell
    
    return cell;
}


@end
