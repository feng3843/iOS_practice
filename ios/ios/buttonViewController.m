//
//  buttonViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/27.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "buttonViewController.h"
#import "mybutton.h"
#import "mybutton2.h"

@interface buttonViewController ()

@end

@implementation buttonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    mybutton *btn1 = [[mybutton alloc]initWithFrame:CGRectMake(200*375/w, 100*568/h, 150*375/w, 30*568/h)];
    
    [self.view addSubview: btn1];
    mybutton2 *btn2 = [[mybutton2 alloc]initWithFrame:CGRectMake(20*375/w, 144*568/h, 60*375/w, 60*568/h)];
    
    [self.view addSubview: btn2];
    mybutton2 *btn3 = [[mybutton2 alloc]initWithFrame:CGRectMake(20*375/w, 240*568/h, 60*375/w, 60*568/h)];
    btn3.layer.cornerRadius = btn3.frame.size.width /2.0;
    btn3.layer.masksToBounds  = true;
    btn3.layer.borderColor = [UIColor yellowColor].CGColor;
    btn3.layer.borderWidth =3;
//    btn3.layer.
//    btn3.layer.masksToBounds = YES;
//    btn3.layer.masksToBounds =NO;
    [self.view addSubview: btn3];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    mybutton *titlebtn = [[mybutton alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    [titlebtn setTitle:@"我的自定义按钮" forState: UIControlStateNormal];
    self.navigationItem.titleView = titlebtn;
    
    
    UIButton *rightbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    [rightbtn setImage:[UIImage imageNamed:@"1"] forState: UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbtn];
    
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

@end
