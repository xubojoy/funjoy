//
//  SecondViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "CommonSenseController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "CommonSenseCell.h"
#import "funjoy-Swift.h"
#import "CategoryDetailController.h"
#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_INTER @"16TLwebvAchkAY6iOWkE6kpk"

#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT*2)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT (screen_width/2)
#define SCROLL_DOWN_LIMIT 70
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface CommonSenseController ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) SDCycleScrollView *bannerCycleScrollView;
@property(nonatomic, strong) UICollectionView *categoryCollectionView;

@end
static NSString *commonSenseIdentifier = @"CommonSenseCell";
@implementation CommonSenseController
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
    self.view.backgroundColor = [ColorUtils colorWithHexString:@"#5E5C93"];
    self.navigationController.fd_prefersNavigationBarHidden = YES;
//    self.title = @"小常识";
    [self initCollectionView];
    [self initBannerView];
    
}

- (void)initCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(screen_width/4, screen_width/4);
    
    self.categoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 300) collectionViewLayout:layout];
    self.categoryCollectionView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    self.categoryCollectionView.delegate = self;
    self.categoryCollectionView.dataSource = self;
    self.categoryCollectionView.scrollEnabled = YES;
    [self.view addSubview:self.categoryCollectionView];
    [self.categoryCollectionView registerClass:[CommonSenseCell class] forCellWithReuseIdentifier:commonSenseIdentifier];
    self.categoryCollectionView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT-64, 0, 0, 0);
    [self.categoryCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
}

- (void)initBannerView{
    
    NSArray *imageUrlArray = @[
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_30.jpg",
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_27.png",
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_26.jpg",
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_25.jpg",
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_23.jpg",
                                      @"https://www.ulpay.com/static_resources/images/banner/m_banner_31.jpg"
                                      ];
    self.bannerCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -IMAGE_HEIGHT, screen_width, IMAGE_HEIGHT) delegate:self placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    self.bannerCycleScrollView.imageURLStringsGroup = imageUrlArray;
    self.bannerCycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self.categoryCollectionView addSubview:self.bannerCycleScrollView];
}

- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    [image drawInRect:CGRectMake (0, 0, newSize.width*2, newSize.height*2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CommonSenseCell *cell = (CommonSenseCell *)[collectionView dequeueReusableCellWithReuseIdentifier:commonSenseIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(screen_width/4, screen_width/4);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    http://baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=%E9%93%B6%E9%AD%82&bk_length=600
//    FJWebViewController *fjwebvc = [[FJWebViewController alloc] init];
//    fjwebvc.htmlStr = @"https://www.baidu.com";
//    [self.navigationController pushViewController:fjwebvc animated:YES];
//    CommonWebController *commvc = [[CommonWebController alloc] init];
//    [self.navigationController pushViewController:commvc animated:YES];
    
    CategoryDetailController *commvc = [[CategoryDetailController alloc] init];
    [self.navigationController pushViewController:commvc animated:YES];
}



#pragma mark SDCycleScrollViewDelegate-----
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        CGFloat offsetY = scrollView.contentOffset.y;
    
    //    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    //    {
    //        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
    //        [self wr_setNavBarBackgroundAlpha:alpha];
    //    }
    //    else
    //    {
    //        [self wr_setNavBarBackgroundAlpha:0];
    //    }
    
    //限制下拉的距离
        if(offsetY < LIMIT_OFFSET_Y) {
            [scrollView setContentOffset:CGPointMake(0, LIMIT_OFFSET_Y)];
        }
    
    // 改变图片框的大小 (上滑的时候不改变)
    // 这里不能使用offsetY，因为当（offsetY < LIMIT_OFFSET_Y）的时候，y = LIMIT_OFFSET_Y 不等于 offsetY
    CGFloat newOffsetY = scrollView.contentOffset.y;
    if (newOffsetY < -IMAGE_HEIGHT)
    {
//        self.bannerCycleScrollView.frame = CGRectMake(0, newOffsetY, screen_width, -newOffsetY);
        [self.bannerCycleScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(newOffsetY);
            make.size.mas_equalTo(CGSizeMake(screen_width, -newOffsetY));
        }];
    }
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
