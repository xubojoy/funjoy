//
//  FunJoyFoldingTabbar.m
//  funjoy
//
//  Created by xubojoy on 2018/1/18.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "FunJoyFoldingTabbar.h"
//model "YALTabBarItem.h"
#import <FoldingTabBar/YALTabBarItem.h>

//controller
#import <FoldingTabBar/YALFoldingTabBarController.h>

//helpers
#import <FoldingTabBar/YALAnimatingTabBarConstants.h>
#import "FJNavigationController.h"
#import "CatchwordViewController.h"
#import "CommonSenseController.h"
#import "TodayHistoryController.h"
#import "UserCenterViewController.h"
@implementation FunJoyFoldingTabbar

+ (void)setupYALTabBarController:(UIWindow *)window {
    YALFoldingTabBarController *tabBarController = [[YALFoldingTabBarController alloc] init];
    window.rootViewController = tabBarController;

    //prepare leftBarItems
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];


    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"edit_icon"]
                                                     rightItemImage:nil];

    tabBarController.leftBarItems = @[item1, item2];

    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
                                                      leftItemImage:[UIImage imageNamed:@"search_icon"]
                                                     rightItemImage:[UIImage imageNamed:@"new_chat_icon"]];


    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];

    tabBarController.rightBarItems = @[item3, item4];

    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];

    tabBarController.selectedIndex = 2;

    //customize tabBarView
    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
//    tabBarController.tabBarView.backgroundColor = [UIColor colorWithRed:94.f/255.f green:91.f/255.f blue:149.f/255.f alpha:1.f];
    tabBarController.tabBarView.backgroundColor = [UIColor clearColor];
    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
    tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    
    CatchwordViewController *vc1 = [[CatchwordViewController alloc] init];
    FJNavigationController *nc1 = [[FJNavigationController alloc]initWithRootViewController:vc1];
    
    
    CommonSenseController *vc2 = [[CommonSenseController alloc] init];
    FJNavigationController *nc2 = [[FJNavigationController alloc]initWithRootViewController:vc2];
    
    TodayHistoryController * v3 = [[TodayHistoryController alloc]init];
    FJNavigationController *nc3 = [[FJNavigationController alloc]initWithRootViewController:v3];
    
    UserCenterViewController * v4 = [[UserCenterViewController alloc]init];
    FJNavigationController *nc4 = [[FJNavigationController alloc]initWithRootViewController:v4];
    
    tabBarController.viewControllers = @[nc1,nc2,nc3,nc4];
    [tabBarController.view bringSubviewToFront:tabBarController.tabBarView];
}


@end
