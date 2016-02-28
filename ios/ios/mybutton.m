//
//  mybutton.m
//  ios
//
//  Created by ivy.sun on 16/2/27.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "mybutton.h"

@implementation mybutton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setImage:[[UIImage imageNamed:@"YellowDownArrow"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)] forState:UIControlStateNormal];
        [self setTitle:@"MYBTN" forState:UIControlStateNormal];
        self.imageView.contentMode =UIViewContentModeScaleAspectFill ;
        [self setTitle:@"高亮" forState:UIControlStateHighlighted];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
//        [self setTintColor:[UIColor redColor]];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [self layoutIfNeeded];

    }
    

    return self;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect imgVframe = self.imageView.frame;
    CGRect titlelabelframe = self.titleLabel.frame;
    titlelabelframe.origin.x = 0;
    self.titleLabel.frame = titlelabelframe;
    imgVframe.origin.x = CGRectGetMaxX(self.titleLabel.frame);
    self.imageView.frame = imgVframe;

    }

//-(void)setTitle:(NSString *)title forState:(UIControlState)state
//{
//    [super setTitle:title forState:state];
//    [self sizeToFit];
//}
//
//-(void)setImage:(UIImage *)image forState:(UIControlState)state
//{
//    [super setImage:image forState:state];
//    [self sizeToFit];
//}

@end
