//
//  HXtableViewController1.m
//  ios
//
//  Created by ivy.sun on 16/2/25.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "HXtableViewController1.h"
#import "HXTableViewCell.h"

@interface HXtableViewController1 ()

@end

@implementation HXtableViewController1

-(NSMutableArray *)dataArry
{
    if (!_dataArry) {
        self.dataArry = [NSMutableArray array];
        for (int i = 111 ; i<119; i++) {
            [self.dataArry addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

 
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,300,w)];
    
    self.tableView.center= CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    //tableview默认上边距64，下边距48
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, -48, 0);
    self.tableView.transform = CGAffineTransformMakeRotation(M_PI_2*3);
//    NSLog(@"tableView翻转后Frame： %@",NSStringFromCGRect(self.tableView.frame));
//    for (UIView *subview in self.tableView.subviews) {
//        NSLog(@"tableView-子控件%@--Frame： %@",subview, NSStringFromCGRect(subview.frame));
//    }
    
    
//    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.pagingEnabled = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
   self.tableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden  = YES;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@",self.tableView);
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden  = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *labeltext = self.dataArry[indexPath.row];
    HXTableViewCell *cell = [HXTableViewCell CreatCellWithTableView:tableView];
    cell.imgV.image = [UIImage imageNamed:@"m_3_100"];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.row % 2 ==0) {
        cell.backgroundColor=[UIColor redColor];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.width;
//    return 50;
}


@end
