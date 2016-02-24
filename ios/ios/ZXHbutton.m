//
//  ZXHbutton.m
//  ios
//
//  Created by ivy.sun on 16/2/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "ZXHbutton.h"

@implementation ZXHbutton

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
//        self.imageView.contentMode = UIViewContentModeCenter;
//        self.titleLabel.contentMode = UIViewContentModeCenter;
        [self setTitle:@"按钮" forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"m_3_100"] forState:UIControlStateNormal];
        [self setBackgroundColor:[UIColor blackColor]];
        [self layoutIfNeeded];
    }
    return  self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    
//    NSLog(@"%@",NSStringFromCGRect(self.titleLabel.frame));
//    
//    NSLog(@"%@",NSStringFromCGRect(self.imageView.frame));
        //计算label
        CGRect labelrect =  self.titleLabel.frame;
        CGRect imgrect = self.imageView.frame;
        labelrect.origin.x = imgrect.origin.x;
        self.titleLabel.frame = labelrect;
    //计算img
        imgrect.origin.x = CGRectGetMaxX(labelrect);
        self.imageView.frame = imgrect;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

-(void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

@end
