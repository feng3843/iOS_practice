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
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,300, w )];
    NSLog(@"tableView创建时Frame： %@",NSStringFromCGRect(self.tableView.frame));
    self.tableView.transform = CGAffineTransformMakeRotation(M_PI/2*3);
    NSLog(@"tableView翻转后Frame： %@",NSStringFromCGRect(self.tableView.frame));
    
    
    
    self.tableView.tableFooterView = [[UIView alloc]init];
//    [self.tableView setSeparatorInset:UIEdgeInsetsZero]; 
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
    NSString *labeltext = self.dataArry[indexPath.row];
    HXTableViewCell *cell = [HXTableViewCell CreatCellWithTableView:tableView];
    cell.lab.text = labeltext;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.width;
}


@end
