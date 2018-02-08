//
//  SongCiDetailController.m
//  funjoy
//
//  Created by xubojoy on 2018/2/8.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "SongCiDetailController.h"

@interface SongCiDetailController ()

@end

@implementation SongCiDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initHeaderView];
    [self initContentView];
    
}

- (void)initHeaderView{
    [self.view addSubview:self.customNavBar];
    self.customNavBar.title = @"宋词";
    [self.customNavBar wr_setBottomLineHidden:NO];
//    self.customNavBar.leftButton.hidden = YES;
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:0];
}

- (void)initContentView{
    TYAttributedLabel *label = [[TYAttributedLabel alloc] init];
    label.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    [label setFrameWithOrign:CGPointMake(15, navigation_height) Width:CGRectGetWidth(self.view.frame)-30];
    [self.view addSubview:label];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_ciModel.content];
    [attributedString addAttributeFont:[UIFont systemFontOfSize:15]];
    [attributedString addAttributeTextColor:[UIColor whiteColor]];
    [label appendTextAttributedString:attributedString];
    [label sizeToFit];
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
