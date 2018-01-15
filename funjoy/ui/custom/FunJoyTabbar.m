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
#import "TodayHistoryController.h"
#import "UserCenterViewController.h"
@implementation FunJoyTabbar
-(id)init{
    self = [super init];
    if (self) {
        UIViewController *firstViewController = [[IndexViewController alloc] init];
        UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:firstViewController];
        firstNavigationController.delegate = self;
        firstNavigationController.title = @"流行语";
        
        UIViewController *secondViewController = [[SecondViewController alloc] init];
        UINavigationController *secondNavigationController = [[UINavigationController alloc]
                                                        initWithRootViewController:secondViewController];
        secondNavigationController.delegate = self;
        secondNavigationController.title = @"小常识";
        
        UIViewController *thirdViewController = [[TodayHistoryController alloc] init];
        UINavigationController *thirdNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:thirdViewController];
        thirdNavigationController.delegate = self;
        thirdNavigationController.title = @"今天";
        
        UIViewController *userViewController = [[UserCenterViewController alloc] init];
        UINavigationController *userNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:userViewController];
        userNavigationController.delegate = self;
        userNavigationController.title = @"我";
        
        self.tabBarController = [[RDVTabBarController alloc] init];
        [self.tabBarController setViewControllers:@[firstNavigationController, secondNavigationController,
                                               thirdNavigationController,userNavigationController]];
        self.tabBarController.delegate = self;
        
        UIView *upLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, splite_line_height)];
        upLineView.backgroundColor = [ColorUtils colorWithHexString:splite_line_color];
        [self.tabBarController.tabBar addSubview:upLineView];
        
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
    //记录页面访问日志
//    if (self.currentPageName != nil) {
//        NSLog(@">>>>>> 转出:%@", self.currentPageName);
//    }
//    self.currentPageName = [viewController getPageName];
//    NSLog(@">>>>>> 转入:%@", self.currentPageName);

    [((UINavigationController *)viewController) popToRootViewControllerAnimated:NO];
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController isKindOfClass:NSClassFromString(@"IndexViewController")]
        ||[viewController isKindOfClass:NSClassFromString(@"SecondViewController")]
        ||[viewController isKindOfClass:NSClassFromString(@"TodayHistoryController")] || [viewController isKindOfClass:NSClassFromString(@"UserCenterViewController")]) {
        [self.tabBarController setTabBarHidden:NO animated:YES];
        
    }else{
        [self.tabBarController setTabBarHidden:YES animated:YES];
    }
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
