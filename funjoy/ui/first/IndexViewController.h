//
//  IndexViewController.h
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMAdView.h"
#import "rilegouleView.h"
@interface IndexViewController : UIViewController<DMAdViewDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) DMAdView *dmAdView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) rilegouleView *rilegoule;

@property (nonatomic, strong) UIImageView *BlurredView;

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end
