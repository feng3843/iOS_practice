//
//  HXTableViewCell.h
//  ios
//
//  Created by ivy.sun on 16/2/25.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView   *imgV;
+(instancetype)CreatCellWithTableView:(UITableView *)tableView;
@end
