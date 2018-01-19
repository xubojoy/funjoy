//
//  FJTabBarViewController.m
//  funjoy
//
//  Created by xubojoy on 2018/1/19.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "FJTabBarViewController.h"
#import <FoldingTabBar/YALTabBarItem.h>

//controller
#import <FoldingTabBar/YALFoldingTabBarController.h>

//helpers
#import <FoldingTabBar/YALAnimatingTabBarConstants.h>
#import <FoldingTabBar/YALCustomHeightTabBar.h>
#import "FJNavigationController.h"
#import "CatchwordViewController.h"
#import "CommonSenseController.h"
#import "TodayHistoryController.h"
#import "UserCenterViewController.h"
@interface FJTabBarViewController ()

@end

@implementation FJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabbar];
}

- (void)initTabbar{
//    [self.tabBar setBackgroundColor:[UIColor purpleColor]];
    
    //prepare leftBarItems
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
    
    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"edit_icon"]
                                                     rightItemImage:nil];
    
    self.leftBarItems = @[item1, item2];
    
    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"search_icon"]
                                                     rightItemImage:[UIImage imageNamed:@"new_chat_icon"]];
    
    
    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];
    
    self.rightBarItems = @[item3, item4];
    
    self.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
    
    self.selectedIndex = 0;
    
    //customize tabBarView
    self.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    self.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
    self.tabBarView.backgroundColor = [UIColor colorWithRed:94.f/255.f green:91.f/255.f blue:149.f/255.f alpha:1.f];
    self.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
    self.tabBarViewHeight = YALTabBarViewDefaultHeight;
    self.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
    self.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    
    CatchwordViewController *vc1 = [[CatchwordViewController alloc] init];
    FJNavigationController *nc1 = [[FJNavigationController alloc]initWithRootViewController:vc1];
    
    CommonSenseController *vc2 = [[CommonSenseController alloc] init];
    FJNavigationController *nc2 = [[FJNavigationController alloc]initWithRootViewController:vc2];
    
    TodayHistoryController * v3 = [[TodayHistoryController alloc]init];
    FJNavigationController *nc3 = [[FJNavigationController alloc]initWithRootViewController:v3];
    
    UserCenterViewController * v4 = [[UserCenterViewController alloc]init];
    FJNavigationController *nc4 = [[FJNavigationController alloc]initWithRootViewController:v4];
    
    self.viewControllers = @[nc1,nc2,nc3,nc4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
