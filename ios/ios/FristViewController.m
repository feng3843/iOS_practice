//
//  FristViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "FristViewController.h"
#import "ZXHbutton.h"
#import "ViewController.h"
#import "HXtableViewController1.h"
#import "HXcollectionviewController.h"

@interface FristViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dictLabel;
@property (weak, nonatomic) IBOutlet UITextField *textfieldForBtn;
- (IBAction)btn1:(id)sender;
@property (weak, nonatomic) ZXHbutton *btn2;
@property (weak, nonatomic) UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
- (IBAction)jump:(id)sender;
- (IBAction)GOtoHXtableView:(id)sender;
- (IBAction)gotoHXcollectionview:(id)sender;




@end

@implementation FristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationTitle];
    CGSize size =[UIScreen mainScreen].bounds.size;
    _dictLabel.text = (size.height < size.width)? @"横屏" : @"竖屏";
    [_textfieldForBtn addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self addbtns];

    

    
}

/*
  自定义按钮 及 添加约束
 **/
-(void)addbtns
{
    ZXHbutton *mybtn = [[ZXHbutton alloc]init];
    [self.view addSubview:mybtn];
    mybtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mybtn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.btn1 attribute:NSLayoutAttributeRight multiplier:1 constant:30]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mybtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textfieldForBtn attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
    self.btn2 = mybtn;
    
    UIButton *mybtn2 = [[UIButton alloc]init];
    [self.view addSubview:mybtn2];
    mybtn2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mybtn2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:mybtn attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:mybtn2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:mybtn attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
    [mybtn2 setTitle:@"按钮" forState:UIControlStateNormal];
    [mybtn2 setImage:[UIImage imageNamed:@"m_3_100"] forState:UIControlStateNormal];
    [mybtn2 setBackgroundColor:[UIColor blackColor]];
    self.btn3 = mybtn2;
    
    
    self.btn1.selected = YES;
    
    
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
    sender.selected = !sender.selected;
    NSString *text = _textfieldForBtn.text;
    NSLog(@"%@",text);
    if (text!=nil && ![text  isEqual: @""]) {
        
        [self.btn2 setTitle:text forState:UIControlStateNormal];
        [self.btn3 setTitle:text forState:UIControlStateNormal];
        
    }
//    [self.btn2 setImage:[UIImage imageNamed:@"m_3_100"] forState:UIControlStateNormal];
//    [self.btn2 setBackgroundColor:[UIColor blackColor]];
//    [self.btn2 setTintColor:[UIColor blackColor]];
    
    
    self.btn2.hidden = !sender.selected;
    self.btn3.hidden = self.btn2.hidden;
    
}

- (void) textFieldDidChange:(UITextField *) TextField
{
//    NSLog(@"%@",TextField.text);
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)jump:(id)sender {
    
    
    ViewController *myvc = [[ViewController alloc]init];
    myvc.filmImages = @[@1,@1,@3,@4,@3];
   
    [self.navigationController pushViewController:myvc animated:YES];
    
}

- (IBAction)GOtoHXtableView:(id)sender {
    
    HXtableViewController1 *vc = [[HXtableViewController1 alloc]init];
//    
//    vc.dataArry = [NSMutableArray arrayWithArray:@[@"111",@"333",@"bcd"]];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)gotoHXcollectionview:(id)sender {
    
    HXcollectionviewController *vc = [[HXcollectionviewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];

}
@end
