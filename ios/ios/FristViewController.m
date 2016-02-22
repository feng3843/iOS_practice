//
//  FristViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "FristViewController.h"
#import "mybutton.h"

@interface FristViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dictLabel;
@property (weak, nonatomic) IBOutlet UITextField *textfieldForBtn;
- (IBAction)btn1:(id)sender;
@property (weak, nonatomic) IBOutlet mybutton *btn2;
@property (weak, nonatomic) IBOutlet mybutton *btn3;




@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationTitle];
    CGSize size =[UIScreen mainScreen].bounds.size;
    _dictLabel.text = (size.height < size.width)? @"横屏" : @"竖屏";
    
    
}
/*
 设置导航条中间label显示
 **/
-(void)setupNavigationTitle{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"当前ios版本：%0.1f",[[[UIDevice currentDevice]systemVersion]floatValue]]];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor redColor]
                           };
    NSRange range = NSMakeRange(8, 3);
    [str setAttributes:dict range: range];
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    titlelabel.attributedText = str;
    //    titlelabel.backgroundColor = [UIColor blackColor];
    self.navigationItem.titleView = titlelabel;

}
/*
 判断横竖屏
 **/
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    _dictLabel.text = (size.height < size.width)? @"横屏" : @"竖屏";

}



- (IBAction)btn1:(UIButton*)sender {
    _btn2.hidden = sender.selected;
    _btn3.hidden = sender.selected;
}
@end
