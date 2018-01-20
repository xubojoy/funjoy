//
//  TodayHistoryController.m
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "TodayHistoryController.h"
#import <zhUITableViewAnimations/zhTableViewAnimations.h>
#import "HttpRequestFacade.h"
#import "HistoryStore.h"
#import "DateUtils.h"
#import "History.h"
#import "HistoryDetailController.h"
#import "HistoryCell.h"
#import "TopDateView.h"

#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT (screen_width/2)
#define NAV_HEIGHT 64
@interface TodayHistoryController ()
@property(nonatomic, strong) DateUtils *date;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) TopDateView *topDateView;
@property(nonatomic, strong) UIImageView *headerView;
@end
static NSString *cellIdentifier = @"HistoryCell";
@implementation TodayHistoryController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ColorUtils colorWithHexString:@"#5E5C93"];
    [self.navigationController.navigationBar setHidden:YES];
    self.date = [[DateUtils alloc] initWithDate:[NSDate date]];
    self.date.date = [NSDate date];
    [self loadDataWithMonth:self.date.month day:self.date.day];
    [self initUI];
}


/**
 数据请求
 @param month 月份
 @param day 日期
 */
- (void)loadDataWithMonth:(int)month day:(int)day{
    [HistoryStore getHistoryToday:^(NSArray *historyArray, NSError *error) {
        NSLog(@".>>>>>>>>>>请求书居>>>>>>>>%@",historyArray);
        if (error == nil) {
            self.historyArray = [NSMutableArray new];
            [self.historyArray addObjectsFromArray:historyArray];
        }
        [self.tableView reloadData];
    } month:[NSString stringWithFormat:@"%d",month] day:[NSString stringWithFormat:@"%d",day]];
}

/**
 初始化UI
 */
- (void)initUI{
    [self initTableView];
    [self initTopView];
    [self initHeaderView];
}

- (void)initHeaderView{
    [self.view insertSubview:self.customNavBar aboveSubview:self.tableView];
    self.customNavBar.title = @"历史上的今天";
    [self.customNavBar wr_setBottomLineHidden:NO];
    self.customNavBar.leftButton.hidden = YES;
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:0];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
    _tableView.zh_reloadAnimationType = zhTableViewAnimationTypeVallum;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.delaysContentTouches = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.backgroundColor = [ColorUtils colorWithHexString:white_text_color];
    _tableView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    [self.view addSubview:_tableView];

//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(zh_reload)];
    
}

- (void)initTopView{
    self.headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_width/2)];
    self.headerView.backgroundColor = [ColorUtils colorWithHexString:@"#5E5C93"];
    self.headerView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerView.clipsToBounds = YES;
    self.headerView.userInteractionEnabled = YES;
//    self.headerView.image = [UIImage imageNamed:@"bg.png"];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-64);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    self.topDateView = [[TopDateView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 100)];
    self.topDateView.backgroundColor = [UIColor clearColor];
    [self.headerView addSubview:self.topDateView];
    [self.topDateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.headerView.mas_bottom).mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    _stretchableTableHeaderView = [HFStretchableTableHeaderView new];
    [_stretchableTableHeaderView stretchHeaderForTableView:_tableView withView:self.headerView];
    
//    NSNumber *num = objc_getAssociatedObject(<#id  _Nonnull object#>, &associatedKey);
    
    __weak TodayHistoryController *weakSelf = self;
    self.topDateView.sellectDateBtnClick = ^(UIButton *dateBtn) {
        NSString *dateStr = nil;
        switch (dateBtn.tag) {
            case BEFORE_BTN:{
                
                NSDate *beginningOfWeek = [DateUtils getTomorrowAndYesterdayDayDate:weakSelf.date.date spaceNum:1];
                
                dateStr = [DateUtils getTomorrowAndYesterdayDay:weakSelf.date.date spaceNum:1];
                weakSelf.date.date = beginningOfWeek;
                NSLog(@">>>>>>>>>>明天>>>>>>>>%@",dateStr);
            }
                
                break;
                
            default:{
                NSDate *beginningOfWeek = [DateUtils getTomorrowAndYesterdayDayDate:weakSelf.date.date spaceNum:-1];
                
                dateStr = [DateUtils getTomorrowAndYesterdayDay:weakSelf.date.date spaceNum:-1];
                weakSelf.date.date = beginningOfWeek;
                NSLog(@">>>>>>>>>>后一天>>>>>>>>%@",dateStr);
            }
                break;
        }
        NSArray *dateArray = [dateStr componentsSeparatedByString:@"/"];
        int month = [dateArray[1] intValue];
        int day = [dateArray[2] intValue];
        [weakSelf.topDateView updateDateLabel:[NSString stringWithFormat:@"%d/%d",month,day]];
        [weakSelf loadDataWithMonth:month day:day];
    };
}

- (void)zh_reload {
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryCell *cell = [HistoryCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.history = self.historyArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell zh_presentAnimateSlideFromLeft];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.historyArray.count > 0) {
        History *history = self.historyArray[indexPath.row];
        HistoryDetailController *historyDetailVc = [[HistoryDetailController alloc] initWithE_id:history.e_id];
        historyDetailVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:historyDetailVc animated:YES];
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self.customNavBar wr_setBackgroundAlpha:alpha];
    }
    else
    {
        [self.customNavBar wr_setBackgroundAlpha:0];
    }

    [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
}
- (void)viewDidLayoutSubviews
{
    [_stretchableTableHeaderView resizeView];
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
    return @"历史上的今天";
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
