//
//  weiboViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/28.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "weiboViewController.h"


@interface weiboViewController ()

@end

@implementation weiboViewController



/*
 App Key：1175972848
 App Secret：0ada5ac8a579cbfcd7d1d3f6377d5e92
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(10, 80, 30, 30);
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:btn];
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
