//
//  FJNavigationController.m
//  funjoy
//
//  Created by xubojoy on 2018/1/19.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "FJNavigationController.h"

@interface FJNavigationController ()

@end

@implementation FJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ColorUtils colorWithHexString:@"#5E5C93"];
    [self.navigationBar setHidden:YES];
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
