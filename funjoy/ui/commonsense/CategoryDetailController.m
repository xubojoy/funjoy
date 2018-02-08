//
//  CategoryDetailController.m
//  funjoy
//
//  Created by xubojoy on 2018/2/8.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "CategoryDetailController.h"
#import <FMDB/FMDB.h>
#import "CiModel.h"
#import "SongCiDetailController.h"
@interface CategoryDetailController ()

@end

@implementation CategoryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArrray = [NSMutableArray new];
    
    [self initHeaderView];
    [self initTableView];
    [self loadData];
}

- (void)initHeaderView{
    [self.view insertSubview:self.customNavBar aboveSubview:self.tableView];
    self.customNavBar.title = @"宋词";
    [self.customNavBar wr_setBottomLineHidden:YES];
    self.customNavBar.leftButton.hidden = YES;
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:0];
}

- (void)loadData{
    //从NSBundle目录读取
    
    NSString* dbPath = [[NSBundle mainBundle]pathForResource:@"ci.db" ofType:@""];
    FMDatabase* database = [ FMDatabase databaseWithPath: dbPath ];
    if ( ![ database open ] )
    {
        return;
    }

    // 查找表 AllTheQustions
    FMResultSet* resultSet = [ database executeQuery: @"select * from ci where value < 100" ];
//    resultSet = [database executeQuery:@"select * from table"];
    //读取table表中所有字段
//    NSMutableDictionary *dict = resultSet.columnNameToIndexMap;
//    NSLog(@"========dic= %@",resultSet);
    // 循环逐行读取数据resultSet next
    while ( [resultSet next] )
    {
        NSLog(@"========resultSet= %@",resultSet);
        // 对应字段来取数据
        NSString* value = [ resultSet stringForColumn: @"value" ];
        NSString* rhythmic = [ resultSet stringForColumn: @"rhythmic"];
        NSString* content = [ resultSet stringForColumn: @"content" ];
        NSString* author = [ resultSet stringForColumn: @"author"];
        NSLog(@"====%@==%@==%@==%@",value,rhythmic,content,author);
        CiModel *model = [[CiModel alloc] init];
        model.value = [value intValue];
        model.rhythmic = rhythmic;
        model.content = content;
        model.author = author;
        [self.dataArrray addObject:model];
        
    }
    // 读取完之后关闭数据库
    [ database close ];
    [self.tableView reloadData];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, navigation_height, screen_width, screen_height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.delaysContentTouches = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    CiModel *model = self.dataArrray[indexPath.row];
    if ([NSStringUtils isNotBlank:model.rhythmic]) {
        cell.textLabel.text = model.rhythmic;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CiModel *model = self.dataArrray[indexPath.row];
    SongCiDetailController *scvc = [[SongCiDetailController alloc] init];
    scvc.ciModel = model;
    [self.navigationController pushViewController:scvc animated:YES];
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
