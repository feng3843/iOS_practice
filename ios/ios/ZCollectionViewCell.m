//
//  ZCollectionViewCell.m
//  ios
//
//  Created by ivy.sun on 16/2/24.
//  Copyright © 2016年 zxh. All rights reserved.
//
//
#import "ZCollectionViewCell.h"

@implementation ZCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UIImageView *imgv = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imgv = imgv;
        [self.contentView addSubview:self.imgv];
        self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
@end
