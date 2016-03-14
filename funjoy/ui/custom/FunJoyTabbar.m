//
//  FunJoyTabbar.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "FunJoyTabbar.h"
#import "IndexViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UserCenterViewController.h"
@implementation FunJoyTabbar
-(id)init{
    self = [super init];
    if (self) {
        UIViewController *firstViewController = [[IndexViewController alloc] init];
        UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        firstNavigationController.delegate = self;
        firstNavigationController.title = @"新闻";
        
        UIViewController *secondViewController = [[SecondViewController alloc] init];
        UINavigationController *secondNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        secondNavigationController.navigationController.delegate = self;
        secondNavigationController.title = @"服务";
        
        UIViewController *thirdViewController = [[ThirdViewController alloc] init];
        UINavigationController *thirdNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:thirdViewController];
        thirdNavigationController.navigationController.delegate = self;
        thirdNavigationController.title = @"游戏";
        
        UIViewController *userViewController = [[UserCenterViewController alloc] init];
        UINavigationController *userNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:userViewController];
        userNavigationController.navigationController.delegate = self;
        userNavigationController.title = @"我";
        
        self.tabBarController = [[RDVTabBarController alloc] init];
        [self.tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                               thirdNavigationController,userNavigationController]];
        self.tabBarController.delegate = self;
        //设置各个item的图像
        [self customizeTabBarForController:self.tabBarController];

    }
    return self;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    UIImage *finishedImage = [UIImage imageNamed:@"under_bar"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"under_bar"];
    NSArray *tabBarItemImages = @[@"tabbar_news_icon",@"tabbar_private_icon",@"tabbar_game_icon",@"tabbar_user_icon"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_select",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_default",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        index++;
    }
}

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
   
    return YES;
}

/**
 * Tells the delegate that the user selected an item in the tab bar.
 */
- (void)tabBarController:(RDVTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
   
    [((UINavigationController *)viewController) popToRootViewControllerAnimated:NO];
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //记录页面访问日志
    if (self.currentPageName != nil) {
        NSLog(@">>>>>> 转出:%@", self.currentPageName);
    }
    self.currentPageName = [viewController getPageName];
    NSLog(@">>>>>> 转入:%@", self.currentPageName);

}

//# pragma mark - Tabbar相关
-(void)tabBarControllerChangedItoIndex:(int)toIndex
{
    [self.tabBarController setTabBarHidden:NO animated:YES];
}
//
//-(void)tabBarController:(LeveyTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    //    UIViewController *uc = [((UINavigationController *)viewController).viewControllers objectAtIndex:0];
//    
//    [((UINavigationController *)viewController) popToRootViewControllerAnimated:NO];
//    
//}
////
//#pragma mark --- navigationController协议
//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if ([viewController isKindOfClass:NSClassFromString(@"IndexViewController")]
//        ||[viewController isKindOfClass:NSClassFromString(@"SecondViewController")]
//        ||[viewController isKindOfClass:NSClassFromString(@"ThirdViewController")] || [viewController isKindOfClass:NSClassFromString(@"UserCenterViewController")]) {
//        [self.tabbarController hidesTabBar:NO animated:YES];
//    }
//    //    else if ([viewController isKindOfClass:NSClassFromString(@"UserLoginController")]&&[[viewController.navigationController.viewControllers objectAtIndex:0] isKindOfClass:[UserCenterViewController class]]) {
//    //        [self.tabbarController hidesTabBar:NO animated:YES];
//    //    }
//    else
//    {
//        [self.tabbarController hidesTabBar:YES animated:YES];
//    }
//    
//    //记录页面访问日志
////    if (self.currentPageName != nil) {
////        [MobClick endLogPageView:self.currentPageName];
////        NSLog(@">>>>>> 转出:%@", self.currentPageName);
////    }
////    self.currentPageName = [viewController getPageName];
////    [MobClick beginLogPageView:self.currentPageName];
////    NSLog(@">>>>>> 转入:%@", self.currentPageName);
//}
//
//
-(UINavigationController *) getSelectedViewController{
    return (UINavigationController *)self.tabBarController.selectedViewController;
}

-(UINavigationController *) getViewController:(int)index{
    return  (UINavigationController *)self.tabBarController.viewControllers[index];
}

-(NSInteger) getSelectedIndex{
    return self.tabBarController.selectedIndex;
}

-(void) setSelectedIndex:(int)selectedIndex{
    [self.tabBarController setSelectedIndex:selectedIndex];
}

-(NSString *) getCurrentPageName{
    return self.currentPageName;
}


@end
