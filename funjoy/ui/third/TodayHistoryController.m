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
@interface TodayHistoryController ()
@property(nonatomic, strong) DateUtils *date;
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) TopDateView *topDateView;
@end
static NSString *cellIdentifier = @"HistoryCell";
@implementation TodayHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [ColorUtils colorWithHexString:common_content_color];
    self.title = @"历史上的今天";
    
   
    self.date = [[DateUtils alloc] initWithDate:[NSDate date]];
    self.date.date = [NSDate date];
    [self loadDataWithMonth:self.date.month day:self.date.day];
    [self initUI];
}

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

- (void)initUI{
    [self initTopView];
    [self commonInitialization];
}

//- (void)initBgImageView{
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-tabbar_height)];
//    self.imageView.image = [UIImage imageNamed:@"bg"];
//    self.imageView.userInteractionEnabled = YES;
//    [self.view addSubview:self.imageView];
//}
- (void)initTopView{
    self.topDateView = [[TopDateView alloc] init];
    self.topDateView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.topDateView];
    [self.topDateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navigation_height);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
    }];
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

- (void)commonInitialization {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, screen_width, screen_height-120-tabbar_height) style:UITableViewStylePlain];
        _tableView.zh_reloadAnimationType = zhTableViewAnimationTypeVallum;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.delaysContentTouches = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [ColorUtils colorWithHexString:common_content_color];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topDateView.mas_bottom).mas_offset(0);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-tabbar_height);
        }];
    }
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(zh_reload)];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getPageName{
    return @"游戏";
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
