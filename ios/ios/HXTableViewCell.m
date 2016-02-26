//
//  HXTableViewCell.m
//  ios
//
//  Created by ivy.sun on 16/2/25.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "HXTableViewCell.h"

@implementation HXTableViewCell

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    UIImageView    *imgv = [[UIImageView alloc]initWithFrame:CGRectMake(85, 52, 200 , 200)];
    [self.contentView addSubview:imgv];
    self.imgV   = imgv;
    self.transform = CGAffineTransformMakeRotation(M_PI/2);
    return  self;
    
}


+(instancetype)CreatCellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"cell";
    HXTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
