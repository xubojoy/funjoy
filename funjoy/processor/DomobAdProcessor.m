//
//  DomobAdProcessor.m
//  funjoy
//
//  Created by xubojoy on 16/3/14.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "DomobAdProcessor.h"
#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_SPLASH @"16TLwebvAchkAY6iOVhpfHPs"

@implementation DomobAdProcessor

- (void)initDomobAd:(UIWindow *)window{
    // 设置适合的背景图片
    // Set background image
    NSString *defaultImgName = @"Default";
    CGFloat offset = 0.0f;
    CGSize adSize;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        adSize = DOMOB_AD_SIZE_768x576;
        defaultImgName = @"Default-Portrait";
        offset = 374.0f;
    } else {
        adSize = DOMOB_AD_SIZE_320x400;
        if ([UIScreen mainScreen].bounds.size.height > 480.0f) {
            defaultImgName = @"Default-568h";
            offset = 233.0f;
        } else {
            offset = 168.0f;
        }
    }
    
    BOOL isCacheSplash = YES;
    // 选择测试缓存开屏还是实时开屏，NO为实时开屏。
    // Choose NO or YES for RealTimeSplashView or SplashView
    // 初始化开屏广告控制器，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    // Get your ID from Domob website
#warning please change the DMPUBLISHERID and the DMPLCAEMENTID_SPLASH
    NSString* testPubID = DMPUBLISHERID;
    NSString* testSplashPlacementID = DMPLCAEMENTID_SPLASH;
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:defaultImgName]];
    if (isCacheSplash) {
        self.splashAd = [[DMSplashAdController alloc] initWithPublisherId:testPubID
                                                          placementId:testSplashPlacementID
                                                               window:window
                                                           background:bgColor
                                                            animation:YES];
        _splashAd.delegate = self;
        if (_splashAd.isReady)
        {
            [_splashAd present];
            
        }
    } else {
        DMRTSplashAdController* rtsplashAd = nil;
        rtsplashAd = [[DMRTSplashAdController alloc] initWithPublisherId:testPubID
                                                             placementId:testSplashPlacementID
                                                                    size:adSize
                                                                  offset:233.5f
                                                                  window:window
                                                              background:bgColor
                                                               animation:YES];
        
        
        rtsplashAd.delegate = self;
        [rtsplashAd present];
    }
}

#pragma mark -
#pragma makr Domob Splash Ad Delegate
//成功加开屏广告后调用
//This method will be used after load splash advertisement successfully
- (void)dmSplashAdSuccessToLoadAd:(DMSplashAdController *)dmSplashAd
{
    NSLog(@"[Domob Splash] success to load ad.");
}

// 当开屏广告加载失败后，回调该方法
// This method will be used after load splash advertisement faild
- (void)dmSplashAdFailToLoadAd:(DMSplashAdController *)dmSplashAd withError:(NSError *)err
{
    NSLog(@"[Domob Splash] fail to load ad.");
}

// 当插屏广告要被呈现出来前，回调该方法
// This method will be used before the splashView will show
- (void)dmSplashAdWillPresentScreen:(DMSplashAdController *)dmSplashAd
{
    NSLog(@"[Domob Splash] will appear on screen.");
}

// 当插屏广告被关闭后，回调该方法
// This method will be used after the splashView dismiss
- (void)dmSplashAdDidDismissScreen:(DMSplashAdController *)dmSplashAd
{
    NSLog(@"[Domob Splash] did disappear on screen.");
}


@end
