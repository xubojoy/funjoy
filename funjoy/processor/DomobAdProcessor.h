//
//  DomobAdProcessor.h
//  funjoy
//
//  Created by xubojoy on 16/3/14.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMSplashAdController.h"
#import "DMRTSplashAdController.h"
@interface DomobAdProcessor : NSObject<DMSplashAdControllerDelegate>
@property (nonatomic, strong) DMSplashAdController *splashAd;
- (void)initDomobAd:(UIWindow *)nav;

@end
