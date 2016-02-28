//
//  thridViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/27.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "thridViewController.h"
#import "buttonViewController.h"

@interface thridViewController ()

@end

@implementation thridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor clearColor];
    float w = [UIScreen mainScreen].bounds.size.width;
    float h = [UIScreen mainScreen].bounds.size.height;
    
    UIButton *anniubtn = [UIButton buttonWithType:UIButtonTypeCustom];
    anniubtn.frame = CGRectMake(10, 70, 70*375/w, 70*568/h);
    [anniubtn setBackgroundColor:[UIColor redColor]];
    anniubtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [anniubtn setTitle:@"自定义按钮" forState: UIControlStateNormal];
    [anniubtn addTarget:self action:@selector(navTObuttonSence:) forControlEvents:UIControlEventTouchUpInside];
    anniubtn.layer.borderWidth = 2.0;
    anniubtn.layer.borderColor = [UIColor whiteColor].CGColor;
    anniubtn.layer.cornerRadius = 5.0;
//    anniubtn.layer.bounds = CGRectMake(1, 1, 1, 1);
//    anniubtn.layer.masksToBounds = YES;
    [self.view addSubview:anniubtn];
}

-(void)navTObuttonSence:(UIButton *)btn {
    
    buttonViewController *vc = [[buttonViewController alloc]init];
    [self.navigationController pushViewController: vc animated:YES];
    vc.title = @"自定义按钮";
    
}


@end
