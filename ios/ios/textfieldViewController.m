//
//  textfieldViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/28.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "textfieldViewController.h"
#import "mytextfield.h"

@interface textfieldViewController ()<UITextFieldDelegate>
@property (nonatomic,weak) UITextField  *textfield;
@end

@implementation textfieldViewController
{
    UILabel *_label1;
    UILabel *_label2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UITextField *fristTF = [[UITextField alloc]initWithFrame:CGRectMake(10, 75, 260, 40)];
    fristTF.backgroundColor = [UIColor whiteColor];
   UIImageView *leftview =  [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    leftview.image =[UIImage imageNamed:@"1"];
    
    fristTF.leftView = leftview;
    fristTF.leftViewMode = UITextFieldViewModeAlways;
    
    
    UIButton *rightview = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    rightview.backgroundColor = [UIColor blackColor];
    rightview.enabled = NO;
    [rightview setTitle:@"发送" forState:UIControlStateNormal];
    [rightview setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [rightview setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [rightview addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    fristTF.rightView = rightview;
    fristTF.rightViewMode =UITextFieldViewModeAlways ;
    self.textfield = fristTF;
    [fristTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:fristTF];
    
    
    
   _label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, [UIScreen mainScreen].bounds.size.width-20, 40)];
    
    _label2 =[[UILabel alloc]initWithFrame:CGRectMake(10, 330, [UIScreen mainScreen].bounds.size.width-20, 40)];
    
    [self.view addSubview:_label1];
    [self.view addSubview:_label2];
    
    mytextfield *secTF = [[mytextfield alloc]initWithFrame:CGRectMake(10, 230, [UIScreen mainScreen].bounds.size.width-20, 40)];
    [secTF addTarget:self action:@selector(secondtextfielddidchange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:secTF];
    
    
}
-(void)secondtextfielddidchange:(UITextField *)textField
{
    _label2.text = [NSString stringWithFormat:@"textfield_2文字监听：%@",textField.text];
}

-(void)textFieldDidChange:(UITextField *)textField
{
    NSLog(@"--%@", textField.text);
    UIButton *btn =(UIButton *)  textField.rightView;
    if ((textField.text == nil) | [textField.text isEqualToString:@""]) {
        
        btn.enabled = NO;
    }else{
        btn.enabled = YES;
    }
    _label1.text = [NSString stringWithFormat:@"textfield_1文字监听：%@",_textfield.text];

}

-(void)click:(id *)sender

{
    _label1.text = [NSString stringWithFormat:@"textfield_1文字监听：%@",_textfield.text];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
