//
//  SecondViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "SecondViewController.h"



#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_INTER @"16TLwebvAchkAY6iOWkE6kpk"

@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CGSize adSize;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        adSize = DOMOB_AD_SIZE_300x250;
    }
    else
    {
        adSize = DOMOB_AD_SIZE_600x500;
    }
    
//    UIViewController *rootViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
//    //　初始化插屏广告，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
//    // Get your own ID from Domob website
//#warning please change the DMPUBLISHERID and the DMPLCAEMENTID_INTER
//    self.dmInterstitial = [[DMInterstitialAdController alloc] initWithPublisherId:DMPUBLISHERID
//                                                                  placementId:DMPLCAEMENTID_INTER
//                                                           rootViewController:rootViewController];
//    self.dmInterstitial.delegate = self;
//    // load advertisement
//    [self.dmInterstitial loadAd];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"小常识";
    
    self.presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.presentBtn.frame = CGRectMake(40, 64, 100, 100);
    self.presentBtn.backgroundColor = [UIColor purpleColor];
    [self.presentBtn setTitle:@"点我" forState:UIControlStateNormal];
    [self.presentBtn addTarget:self action:@selector(onPresentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.presentBtn];
    
}

- (void)onPresentBtnClicked:(id)sender
{
    // 在需要呈现插屏广告前，先通过isReady方法检查广告是否就绪
    // before present advertisement view please check if isReady
    if (self.dmInterstitial.isReady)
    {
        // present advertisement view
        [self.dmInterstitial present];
    }
    else
    {
        // 如果还没有ready，可以再调用loadAd
        // if !ready load again
        [self.dmInterstitial loadAd];
    }
}


#pragma mark -
#pragma mark DMInterstitialAdController Delegate
// 当插屏广告被成功加载后，回调该方法
// This method will be used after the ad has been loaded successfully
- (void)dmInterstitialSuccessToLoadAd:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] success to load ad.");
    self.presentBtn.hidden = NO;
}

// 当插屏广告加载失败后，回调该方法
// This method will be used after failed
- (void)dmInterstitialFailToLoadAd:(DMInterstitialAdController *)dmInterstitial withError:(NSError *)err
{
    NSLog(@"[Domob Interstitial] fail to load ad. %@", err);
}

// 当插屏广告要被呈现出来前，回调该方法
// This method will be used before being presented
- (void)dmInterstitialWillPresentScreen:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will present.");
}

// 当插屏广告被关闭后，回调该方法
// This method will be used after Interstitial view  has been closed
- (void)dmInterstitialDidDismissScreen:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] did dismiss.");
    
    // 插屏广告关闭后，加载一条新广告用于下次呈现
    //prepair for the next advertisement view
    [self.dmInterstitial loadAd];
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器。
// When will be showing a Modal View, call this method. Such as open built-in browser
- (void)dmInterstitialWillPresentModalView:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will present modal view.");
}

// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
// When presented Modal View is closed, this method will be called. Such as built-in browser is closed
- (void)dmInterstitialDidDismissModalView:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] did dismiss modal view.");
}

// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
// When the result of the user's actions (such as clicking download class advertising, you need to jump to the Store), need to leave the current application, this method will be called
- (void)dmInterstitialApplicationWillEnterBackground:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"[Domob Interstitial] will enter background.");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getPageName{
    return @"服务";
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
