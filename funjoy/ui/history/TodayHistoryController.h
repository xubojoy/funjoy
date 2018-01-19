//
//  TodayHistoryController.h
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFStretchableTableHeaderView.h"
@interface TodayHistoryController : BaseViewController<UITableViewDelegate, UITableViewDataSource,YALTabBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *historyArray;
@property (nonatomic, strong) HFStretchableTableHeaderView* stretchableTableHeaderView;
@end
