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

+ (void)setupYALTabBarController:(UIViewController *)rootViewController {
//    YALFoldingTabBarController *tabBarController = (YALFoldingTabBarController *)rootViewController;
//
//    //prepare leftBarItems
//    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//
//    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
//                                                      leftItemImage:[UIImage imageNamed:@"edit_icon"]
//                                                     rightItemImage:nil];
//
//    tabBarController.leftBarItems = @[item1, item2];
//
//    //prepare rightBarItems
//    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
//                                                      leftItemImage:[UIImage imageNamed:@"search_icon"]
//                                                     rightItemImage:[UIImage imageNamed:@"new_chat_icon"]];
//
//
//    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//    tabBarController.rightBarItems = @[item3, item4];
//
//    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
//
//
//    CatchwordViewController *vc1 = [[CatchwordViewController alloc] init];
//    FJNavigationController *nc1 = [[FJNavigationController alloc]initWithRootViewController:vc1];
//
//
//    CommonSenseController *vc2 = [[CommonSenseController alloc] init];
//    FJNavigationController *nc2 = [[FJNavigationController alloc]initWithRootViewController:vc2];
//
//    TodayHistoryController * v3 = [[TodayHistoryController alloc]init];
//    FJNavigationController *nc3 = [[FJNavigationController alloc]initWithRootViewController:v3];
//
//    UserCenterViewController * v4 = [[UserCenterViewController alloc]init];
//    FJNavigationController *nc4 = [[FJNavigationController alloc]initWithRootViewController:v4];
//
//    NSMutableArray *vcArr = [NSMutableArray arrayWithObjects:nc1,nc2,nc3,nc4, nil];
////    NSArray *titleArr = @[@"首页",@"理财",@"生活",@"保险",@"我的"];
////    NSArray *picArr = @[@"icon04_02",@"icon01_02",@"icon03_02",@"icon08_02",@"icon02_02"];
////    NSArray *selectPicArr = @[@"icon04_01",@"icon01_01",@"icon03_01",@"icon08_01",@"icon02_01"];
//
//
//
////    for (int i = 0; i < vcArr.count; i++) {
////        UIViewController *vc = vcArr[i];
////        vc.title = titleArr[i];
////        FJNavigationController *nc = [[FJNavigationController alloc]initWithRootViewController:vc];
////        [nc.tabBarItem setImage:[[UIImage imageNamed:picArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
////        [nc.tabBarItem setTitle:titleArr[i]];
////        nc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
////        [nc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectPicArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
////        [vcArr replaceObjectAtIndex:i withObject:nc];
//    }
//    tabBarController.viewControllers = vcArr;
//
//
//
//
//
//
//
//    tabBarController.selectedIndex = 2;
//
//    //customize tabBarView
//    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
//    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
//    tabBarController.tabBarView.backgroundColor = [UIColor colorWithRed:94.f/255.f green:91.f/255.f blue:149.f/255.f alpha:1.f];
//    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
//    tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
//    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
//    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
}


@end
