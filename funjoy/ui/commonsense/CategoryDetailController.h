//
//  CategoryDetailController.h
//  funjoy
//
//  Created by xubojoy on 2018/2/8.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDetailController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArrray;
@end
