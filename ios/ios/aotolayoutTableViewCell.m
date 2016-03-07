//
//  aotolayoutTableViewCell.m
//  ios
//
//  Created by ivy.sun on 16/3/7.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "aotolayoutTableViewCell.h"
#define randomcolor [UIColor colorWithRed:arc4random_uniform(256)/255 green:arc4random_uniform(256)/255 blue:arc4random_uniform(256)/255 alpha:1]


@implementation aotolayoutTableViewCell

- (void)awakeFromNib {
    UIView *view0 = UIView.new;
    UIView *view1 = UIView.new;
    UIView *view2 = UIView.new;
    UIView *view3 = UIView.new;
    view0.backgroundColor = randomcolor;
    view1.backgroundColor = randomcolor;
    view2.backgroundColor = randomcolor;
    view3.backgroundColor = randomcolor;
    [self.contentView addSubview:view0];
    [self.contentView addSubview:view1];
    [self.contentView addSubview:view2];
    [self.contentView addSubview:view3];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
