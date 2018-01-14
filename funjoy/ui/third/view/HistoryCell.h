//
//  HistoryCell.h
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "History.h"
@interface HistoryCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) History *history;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
//- (void)renderCellWithHistory:(History *)history;
@end
