//
//  HistoryDetailController.h
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryDetailController : BaseViewController
@property (nonatomic, assign) int e_id;
@property (nonatomic, strong) UIScrollView *bgScrollView;

- (instancetype)initWithE_id:(int)e_id;

@end
