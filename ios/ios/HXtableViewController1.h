//
//  HXtableViewController1.h
//  ios
//
//  Created by ivy.sun on 16/2/25.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXtableViewController1 : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray  *dataArry;
@property (nonatomic,strong) UITableView  *tableView;
@end
