//
//  SecondViewController.h
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMInterstitialAdController.h"
#import <FoldingTabBar/YALFoldingTabBar.h>
@interface CommonSenseController : BaseViewController<DMInterstitialAdControllerDelegate,YALTabBarDelegate>
@property (nonatomic, strong) DMInterstitialAdController *dmInterstitial;
@property (nonatomic, strong) UIButton *presentBtn;
@end
