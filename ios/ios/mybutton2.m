//
//  mybutton2.m
//  ios
//
//  Created by ivy.sun on 16/2/28.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "mybutton2.h"

@implementation mybutton2
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[[UIImage imageNamed:@"m_9_100"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)] forState:UIControlStateNormal];
        [self setTitle:@"分享" forState:UIControlStateNormal];
        [self setTitle:@"高亮" forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.imageView.contentMode =UIViewContentModeScaleAspectFill ;
//        [self setTintColor:[UIColor redColor]];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self layoutIfNeeded];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect imgframe = self.imageView.frame;
    CGRect titleframe = self.titleLabel.frame;
    titleframe.origin.y = CGRectGetMaxY(imgframe);
    titleframe.origin.x = imgframe.origin.x;
    titleframe.size.width = titleframe.size.width>imgframe.size.width?titleframe.size.width:imgframe.size.width;
    self.titleLabel.frame = titleframe;
    //排布完成后的新按钮大小
    CGFloat newboundsWH = self.titleLabel.frame.size.width>CGRectGetMaxY(self.titleLabel.frame)?self.titleLabel.frame.size.width:CGRectGetMaxY(self.titleLabel.frame);
    CGRect bounds = CGRectMake(0, 0, newboundsWH, newboundsWH);
    self.bounds =bounds;
    //在新尺寸上重新排布
    CGFloat imgX = (newboundsWH - self.imageView.frame.size.width)*0.5;
    CGFloat imgY = (newboundsWH - self.imageView.frame.size.height - self.titleLabel.frame.size.height)*0.5;
    CGFloat imgW = self.imageView.frame.size.width;
    CGFloat imgH = self.imageView.frame.size.height;
    self.imageView.frame = CGRectMake(imgX, imgY, imgW, imgH);
    CGFloat titleX = imgX;
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame);
    CGFloat titleW = self.titleLabel.frame.size.width;
    CGFloat titleH = self.titleLabel.frame.size.height;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    
}


@end
