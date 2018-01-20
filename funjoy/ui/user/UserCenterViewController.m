//
//  UserCenterViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "UserCenterViewController.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ColorUtils colorWithHexString:@"#5E5C93"];
    [self initHeaderView];
}

- (void)initHeaderView{
    [self.view addSubview:self.customNavBar];
    self.customNavBar.title = @"我";
    [self.customNavBar wr_setBottomLineHidden:NO];
    self.customNavBar.leftButton.hidden = YES;
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:0];
}


#pragma mark - YALTabBarInteracting

- (void)tabBarWillCollapse:(YALFoldingTabBar *)tabBar {
    if (debug == 1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
}

- (void)tabBarWillExpand:(YALFoldingTabBar *)tabBar {
    if (debug == 1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
}

- (void)tabBarDidCollapse:(YALFoldingTabBar *)tabBar {
    if (debug == 1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
}

- (void)tabBarDidExpand:(YALFoldingTabBar *)tabBar {
    if (debug == 1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getPageName{
    return @"我";
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
