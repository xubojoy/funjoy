//
//  IndexViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "CatchwordViewController.h"
#import "NextViewController.h"
#import "DMTools.h"
#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
#define DMPLCAEMENTID_BANNER @"16TLwebvAchkANUH_krQ7vOz"


#import "EveryDayModel.h"
#import "EveryDayTableViewCell.h"
#import "ContentScrollView.h"
#import "ContentView.h"
#import "rilegouleView.h"
#import "CustomView.h"
#import "ImageContentView.h"
#import "PlayViewController.h"
#import "AppDelegate.h"
#import "HPSphereView.h"
#import "GBPopMenuButtonView.h"
#import "funjoy-Swift.h"
#import "FJAlertView.h"
#import "CatchWordModel.h"
@interface SDWebImageManager  (cache)


- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url;

@end

@implementation SDWebImageManager (cache)

- (BOOL)memoryCachedImageExistsForURL:(NSURL *)url {
    NSString *key = [self cacheKeyForURL:url];
    return ([self.imageCache imageFromMemoryCacheForKey:key] != nil) ?  YES : NO;
}

@end

@interface CatchwordViewController ()<GBMenuButtonDelegate>
{
    CGSize _adSize;
    CGFloat _adX, _adY;
}
@property (nonatomic, retain) NSMutableDictionary *selectDic;

@property (nonatomic, retain) NSMutableArray *dateArray;
@property (nonatomic, retain) HPSphereView *sphereView;
@property (nonatomic, strong) GBPopMenuButtonView *popMenuButtonView;
@property (nonatomic, retain) NSArray *labelArray;
@property (nonatomic, strong) NSDictionary *yearOldCategoryDict;
@property (nonatomic, strong) CatchWordModel *catchWordModel;


@end

@implementation CatchwordViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    debugMethod();
    // 确定广告尺寸及位置
    //Set the size and origin
    _adX = 0;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
        if (!([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)) {
            
            _adY = 64;
            
        }else{
            
        }
        
    }
    else
    {
        _adY = 64;
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // 创建广告视图，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    // Creat advertisement view please get your own ID from domob website
#warning please change the DMPUBLISHERID and the DMPLCAEMENTID_BANNER
//    self.dmAdView = [[DMAdView alloc] initWithPublisherId:DMPUBLISHERID
//                                              placementId:DMPLCAEMENTID_BANNER];
//
//    // 设置广告视图的位置 宽与高设置为0即可 该广告视图默认是横竖屏自适应 但需要在旋转时调用orientationChanged 方法
//    // Set the frame of advertisement view
//    self.dmAdView.frame = CGRectMake(_adX, _adY, FLEXIBLE_SIZE.width,40);
//    self.dmAdView.delegate = self;
//    self.dmAdView.rootViewController = self; // set RootViewController
//    [self.view addSubview:self.dmAdView];
//    [self.dmAdView loadAd]; // start load advertisement
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // 检查评价提醒，此处使用的是测试ID，请登陆多盟官网（www.domob.cn）获取新的ID
    // Check for rate please get your own ID from Domob website
#warning please change the DMPUBLISHERID
//    DMTools *_dmTools = [[DMTools alloc] initWithPublisherId:DMPUBLISHERID];
//    [_dmTools checkRateInfo];
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.labelArray = @[
                        @{
                            @"name":@"吃藕",
                            @"content":@"吃藕，网络流行词，是指“丑”的意思，谐音拼音“chou”，源于百度贴吧。某网友发贴问一个游戏中的人物是不是很丑不小心把\"丑\"打成了\"吃藕\"。从此，以\"吃藕\"表示\"丑\"的用法，在网上流行起来。\n发展经过\n可是\"吃藕\"为什么能表示\"丑\"呢？这就是我们汉语拼音的奇妙之处了。声母为zh、ch、sh、r、z、c、s，的韵母为i的音节，在与零声母字组词快速链接时，就会出现合为一字的现象，如\"吃藕\"和\"丑\"，\"师恩\"和\"深\"。"
                            },
                        @{
                            @"name":@"我好方",
                            @"content":@""
                            },
                        @{
                            @"name":@"狗带",
                            @"content":@""
                            },
                        @{
                            @"name":@"吃土",
                            @"content":@""
                            },
                        @{
                            @"name":@"巨巨",
                            @"content":@""
                            },
                        @{
                            @"name":@"666",
                            @"content":@""
                            },
                        @{
                            @"name":@"一波",
                            @"content":@""
                            },
                        @{
                            @"name":@"红红火火恍恍惚惚",
                            @"content":@""
                            },@{
                            @"name":@"扩列",
                            @"content":@""
                            },@{
                            @"name":@"实力",
                            @"content":@""
                            },@{
                            @"name":@"糊",
                            @"content":@""
                            },@{
                            @"name":@"滑稽",
                            @"content":@""
                            },@{
                            @"name":@"欧洲人",
                            @"content":@""
                            },@{
                            @"name":@"尼奏凯",
                            @"content":@""
                            },@{
                            @"name":@"洗模杯",
                            @"content":@""
                            },@{
                            @"name":@"打铁",
                            @"content":@""
                            },@{
                            @"name":@"布吉岛",
                            @"content":@""
                            },@{
                            @"name":@"PYQ",
                            @"content":@""
                            },@{
                            @"name":@"发糖",
                            @"content":@""
                            },@{
                            @"name":@"原谅色",
                            @"content":@""
                            },@{
                            @"name":@"落地成盒",
                            @"content":@""
                            },@{
                            @"name":@"扣字",
                            @"content":@""
                            },@{
                            @"name":@"CQY",
                            @"content":@""
                            },@{
                            @"name":@"毒药",
                            @"content":@""
                            },@{
                            @"name":@"共药",
                            @"content":@""
                            },@{
                            @"name":@"共掉线",
                            @"content":@""
                            },@{
                            @"name":@"亦可赛艇",
                            @"content":@""
                            },@{
                            @"name":@"DD",
                            @"content":@""
                            },@{
                            @"name":@"互卖",
                            @"content":@""
                            },@{
                            @"name":@"开黑",
                            @"content":@""
                            },@{
                            @"name":@"萌新",
                            @"content":@""
                            },@{
                            @"name":@"挽",
                            @"content":@""
                            },@{
                            @"name":@"233333",
                            @"content":@""
                            },@{
                            @"name":@"本命",
                            @"content":@""
                            },@{
                            @"name":@"黑界",
                            @"content":@""
                            },@{
                            @"name":@"实力挽尊",
                            @"content":@""
                            },@{
                            @"name":@"欧气",
                            @"content":@""
                            },@{
                            @"name":@"巨巨",
                            @"content":@""
                            },@{
                            @"name":@"同控",
                            @"content":@""
                            },@{
                            @"name":@"语C",
                            @"content":@""
                            },@{
                            @"name":@"小确肥",
                            @"content":@""
                            },@{
                            @"name":@"战五渣",
                            @"content":@""
                            },@{
                            @"name":@"喊麦",
                            @"content":@""
                            },@{
                            @"name":@"扩同好",
                            @"content":@""
                            },@{
                            @"name":@"面基",
                            @"content":@""
                            },@{
                            @"name":@"290",
                            @"content":@""
                            },@{
                            @"name":@"可攻可受",
                            @"content":@""
                            },@{
                            @"name":@"中二",
                            @"content":@""
                            },@{
                            @"name":@"种草",
                            @"content":@""
                            },
                        ];
    [self initHeaderView];
    [self initPopMenuButtonView];
    [self initData];
    
//    [self jsonSelection];
   
}

- (void)initData{
    if (self.labelArray.count > 0) {
        self.dateArray = [CatchWordModel mj_objectArrayWithKeyValuesArray:self.labelArray];
        [self initLabelCloudView];
    }
}

/**
 初始化导航
 */
- (void)initHeaderView{
    [self.view addSubview:self.customNavBar];
    self.customNavBar.title = @"流行语";
    [self.customNavBar wr_setBottomLineHidden:NO];
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:1];
}

/**
 初始化弹出按钮
 */
- (void)initPopMenuButtonView{
    self.popMenuButtonView = [[GBPopMenuButtonView alloc] initWithItems:@[@"camera",@"draw",@"dropbox",@"gallery"] size:CGSizeMake(50, 50) type:GBMenuButtonTypeLineRight isMove:YES];
    self.popMenuButtonView.delegate = self;
    self.popMenuButtonView.frame = CGRectMake(15, [WRNavigationBar navBarBottom]+general_margin, 50, 50);
    [self.view addSubview:self.popMenuButtonView];
    
}

/**
 初始化标签云
 */
- (void)initLabelCloudView{
    _sphereView = [[HPSphereView alloc] initWithFrame:CGRectMake(30, self.popMenuButtonView.bottomY+general_space, screen_width-60, screen_width-60)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < self.dateArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.catchWordModel = self.dateArray[i];
        [btn setTitle:[NSString stringWithFormat:@"%@", self.catchWordModel.name] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:24.];
        CGSize btnSize = [NSStringUtils boundingALLRectWithSize:self.catchWordModel.name Font:[UIFont systemFontOfSize:font_24_size] Size:CGSizeMake(screen_width, 0)];
        btn.frame = CGRectMake(0, 0, btnSize.width, 20);
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setCloudTags:array];
    _sphereView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_sphereView];
    [self.view bringSubviewToFront:self.popMenuButtonView];
}

#pragma mark 点击标签事件------------
- (void)buttonPressed:(UIButton *)sender{
    NSLog(@"点击了-------%@",sender.currentTitle);
//    NSString *str = @"可见方法名里面并没有体现参数的位置，所以是否是同一个方法取决于方法名是否相同，和参数没关系。要找到方法首先要先确定是那个类。isa和super_class是找到实现函数的关键映射，决定找到存放在哪个类的方法实现。（isa用于自省确定所属类，super_class确定继承关系）。实例对象的isa指针指向类，类的isa指针指向其元类（metaClass）。对象就是一个含isa指针的结构体。类存储实例对象的方法列表，元类存储类的方法列表，元类也是类对象。当创建实例对象时，分配的内存包含一个objc_object数据结构，然后是类到父类直到根类NSObject的实例变量的数据。NSObject类的alloc和allocWithZone:方法使用函数class_createInstance来创建objc_object数据结构。向一个Objective-C对象发送消息时，运行时库会根据实例对象的isa指针找到这个实例对象所属的类。Runtime库会在类的方法列表由super_class指针找到父类的方法列表直至根类NSObject中去寻找与消息对应的selector指向的方法。找到后即运行这个方法。";
//
//    FJAlertView *alert = [[FJAlertView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) title:sender.currentTitle message:str buttonTitle:nil];
//    [alert show];
    
    for (CatchWordModel *catchWordModel in self.dateArray) {
        if ([sender.currentTitle isEqualToString:catchWordModel.name]) {
            FJAlertView *alert = [[FJAlertView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) title:sender.currentTitle message:catchWordModel.content buttonTitle:nil];
            [alert show];
        }
    }
}

#pragma mark GBMenuButtonDelegate--------
- (void)menuButtonSelectedAtIdex:(NSInteger)index{
    [self.popMenuButtonView hideItems];
    NSLog(@"点击了-------%ld",(long)index);
    
}




#pragma mark ---------- 数据解析 -----------

//懒加载
- (NSMutableDictionary *)selectDic{
    
    if (!_selectDic) {
        
        _selectDic = [[NSMutableDictionary alloc]init];
        
    }
    return _selectDic;
}

- (NSMutableArray *)dateArray{
    
    if (!_dateArray) {
        _dateArray = [[NSMutableArray alloc]init];
    }
    return _dateArray;
}


- (void)jsonSelection{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    
    NSDate *date = [NSDate date];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSString *url = [NSString stringWithFormat:kEveryDay,dateString];
    
    [LORequestManger GET:url completeBlock:^(id response, NSError *err) {
        if (response != nil) {
            NSDictionary *Dic = (NSDictionary *)response;
            
            NSArray *array = Dic[@"dailyList"];
            
            for (NSDictionary *dic in array) {
                
                NSMutableArray *selectArray = [NSMutableArray array];
                
                NSArray *arr = dic[@"videoList"];
                
                for (NSDictionary *dic1 in arr) {
                    NSLog(@">>>>>>>>>>>>%@",dic1);
                    EveryDayModel *model = [[EveryDayModel alloc]init];
                    
                    [model setValuesForKeysWithDictionary:dic1];
                    
                    model.collectionCount = dic1[@"consumption"][@"collectionCount"];
                    model.replyCount = dic1[@"consumption"][@"replyCount"];
                    model.shareCount = dic1[@"consumption"][@"shareCount"];
                    
                    [selectArray addObject:model];
                }
                NSString *date = [[dic[@"date"] stringValue] substringToIndex:10];
                
                [self.selectDic setValue:selectArray forKey:date];
            }
            
            NSComparisonResult (^priceBlock)(NSString *, NSString *) = ^(NSString *string1, NSString *string2){
                
                NSInteger number1 = [string1 integerValue];
                NSInteger number2 = [string2 integerValue];
                
                if (number1 > number2) {
                    return NSOrderedAscending;
                }else if(number1 < number2){
                    return NSOrderedDescending;
                }else{
                    return NSOrderedSame;
                }
                
            };
            
            self.dateArray = [[[self.selectDic allKeys] sortedArrayUsingComparator:priceBlock]mutableCopy];
            
            NSLog(@"%ld",[self.dateArray count]);
            
            [self.tableView reloadData];
        }
    }];
    
}


//初始化tableview
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [WRNavigationBar navBarBottom], screen_width,screen_height-tabbar_height-[WRNavigationBar navBarBottom]) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [ColorUtils colorWithHexString:backgroud_color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[EveryDayTableViewCell class] forCellReuseIdentifier:@"哈哈"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.dateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.selectDic[self.dateArray[section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EveryDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"哈哈" forIndexPath:indexPath];
    
    return cell;
}

// 头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *string = self.dateArray[section];
    
    long long int date1 = (long long int)[string intValue];
    
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"MM/dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:date2];
    
    return dateString;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

//添加每个cell出现时的3D动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(EveryDayTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    EveryDayModel *model = self.selectDic[self.dateArray[indexPath.section]][indexPath.row];
    
    if (![[SDWebImageManager sharedManager] memoryCachedImageExistsForURL:[NSURL URLWithString:model.coverForDetail]]) {
        
        CATransform3D rotation;//3D旋转
        
        rotation = CATransform3DMakeTranslation(0 ,50 ,20);
        //        rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
        //逆时针旋转
        
        rotation = CATransform3DScale(rotation, 0.9, .9, 1);
        
        rotation.m34 = 1.0/ -600;
        
        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
        cell.layer.shadowOffset = CGSizeMake(10, 10);
        cell.alpha = 0;
        
        cell.layer.transform = rotation;
        
        [UIView beginAnimations:@"rotation" context:NULL];
        //旋转时间
        [UIView setAnimationDuration:0.6];
        cell.layer.transform = CATransform3DIdentity;
        cell.alpha = 1;
        cell.layer.shadowOffset = CGSizeMake(0, 0);
        [UIView commitAnimations];
    }
    
    [cell cellOffset];
    cell.model = model;
}


#pragma mark ---------- 单元格代理方法 ----------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showImageAtIndexPath:indexPath];
}


#pragma mark --------- 设置待播放界面 ----------

- (void)showImageAtIndexPath:(NSIndexPath *)indexPath{
    [[(AppDelegate*)[UIApplication sharedApplication].delegate tabbar].tabBarController setTabBarHidden:YES animated:YES];
    _array = _selectDic[_dateArray[indexPath.section]];
    _currentIndexPath = indexPath;
    
    EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    CGRect rect = [cell convertRect:cell.bounds toView:nil];
    CGFloat y = rect.origin.y;
    
    _rilegoule = [[rilegouleView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) imageArray:_array index:indexPath.row];
    _rilegoule.offsetY = y;
    _rilegoule.animationTrans = cell.picture.transform;
    _rilegoule.animationView.picture.image = cell.picture.image;
    
    _rilegoule.scrollView.delegate = self;
    
    [[self.tableView superview] addSubview:_rilegoule];
    //添加轻扫手势
    UISwipeGestureRecognizer *Swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    _rilegoule.contentView.userInteractionEnabled = YES;
    
    Swipe.direction = UISwipeGestureRecognizerDirectionUp;
    
    [_rilegoule.contentView addGestureRecognizer:Swipe];
    
    //添加点击播放手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [_rilegoule.scrollView addGestureRecognizer:tap];
    
    [_rilegoule aminmationShow];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        for (ImageContentView *subView in scrollView.subviews) {
            
            if ([subView respondsToSelector:@selector(imageOffset)] ) {
                [subView imageOffset];
            }
        }
        
        CGFloat x = _rilegoule.scrollView.contentOffset.x;
        
        CGFloat off = ABS( ((int)x % (int)kWidth) - kWidth/2) /(kWidth/2) + .2;
        
        [UIView animateWithDuration:1.0 animations:^{
            _rilegoule.playView.alpha = off;
            _rilegoule.contentView.titleLabel.alpha = off + 0.3;
            _rilegoule.contentView.littleLabel.alpha = off + 0.3;
            _rilegoule.contentView.lineView.alpha = off + 0.3;
            _rilegoule.contentView.descripLabel.alpha = off + 0.3;
            _rilegoule.contentView.collectionCustom.alpha = off + 0.3;
            _rilegoule.contentView.shareCustom.alpha = off + 0.3;
            _rilegoule.contentView.cacheCustom.alpha = off + 0.3;
            _rilegoule.contentView.replyCustom.alpha = off + 0.3;
            
        }];
        
    } else {
        
        NSArray<EveryDayTableViewCell *> *array = [self.tableView visibleCells];
        
        [array enumerateObjectsUsingBlock:^(EveryDayTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [obj cellOffset];
        }];
        
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual:_rilegoule.scrollView]) {
        
        int index = floor((_rilegoule.scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width) + 1;
        
        _rilegoule.scrollView.currentIndex = index;
        
        self.currentIndexPath = [NSIndexPath indexPathForRow:index inSection:self.currentIndexPath.section];
        
        [self.tableView scrollToRowAtIndexPath:self.currentIndexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
        
        [self.tableView setNeedsDisplay];
        EveryDayTableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.currentIndexPath];
        
        [cell cellOffset];
        
        CGRect rect = [cell convertRect:cell.bounds toView:nil];
        _rilegoule.animationTrans = cell.picture.transform;
        _rilegoule.offsetY = rect.origin.y;
        
        EveryDayModel *model = _array[index];
        
        [_rilegoule.contentView setData:model];
        
        [_rilegoule.animationView.picture setImageWithURL:[NSURL URLWithString: model.coverForDetail]];
        
    }
}

#pragma mark -------------- 平移手势触发事件 -----------

- (void)panAction:(UISwipeGestureRecognizer *)swipe{
    [[(AppDelegate*)[UIApplication sharedApplication].delegate tabbar].tabBarController setTabBarHidden:NO animated:YES];
    [_rilegoule animationDismissUsingCompeteBlock:^{
        
        _rilegoule = nil;
    }];
}

#pragma mark -------------- 点击手势触发事件 -----------

- (void)tapAction{

    PlayViewController *playVC = [[PlayViewController alloc]init];
    
    playVC.modelArray = _array;
    
    playVC.index = self.currentIndexPath.row;
    
    [self.navigationController pushViewController:playVC animated:YES];
//    [self presentViewController:playVC animated:YES completion:nil];
}

//针对Banner的横竖屏自适应方法
//method For multible orientation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    [_dmAdView orientationChanged];
}

#pragma mark -
#pragma mark DMAdView delegate

// 成功加载广告后，回调该方法
// This method will be used after load successfully
- (void)dmAdViewSuccessToLoadAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] success to load ad.");
}

// 加载广告失败后，回调该方法
// This method will be used after load failed
- (void)dmAdViewFailToLoadAd:(DMAdView *)adView withError:(NSError *)error
{
    NSLog(@"[Domob Sample] fail to load ad. %@", error);
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器
// When will be showing a Modal View, this method will be called. Such as open built-in browser
- (void)dmWillPresentModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will present modal view.");
//    NextViewController *nvc = [[NextViewController alloc] init];
//    [self.navigationController pushViewController:nvc animated:YES];
}

// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
// When presented Modal View is closed, this method will be called. Such as built-in browser is closed
- (void)dmDidDismissModalViewFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] did dismiss modal view.");
}

// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
// When the result of the user's actions (such as clicking download class advertising, you need to jump to the Store), need to leave the current application, this method will be called
- (void)dmApplicationWillEnterBackgroundFromAd:(DMAdView *)adView
{
    NSLog(@"[Domob Sample] will enter background.");
}


- (void)btnClcik{
    NextViewController *nvc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nvc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getPageName{
 return @"新闻";
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
