//
//  mytextfield.m
//  ios
//
//  Created by ivy.sun on 16/2/28.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "mytextfield.h"

@implementation mytextfield
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSDictionary *attr = @{
                               NSForegroundColorAttributeName :[UIColor redColor],
                               NSFontAttributeName : [UIFont systemFontOfSize:13]
                                      };
        NSAttributedString *str = [[NSAttributedString alloc]initWithString:@"这是自定义的textfield" attributes:attr];
        self.attributedPlaceholder = str;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}
@end
