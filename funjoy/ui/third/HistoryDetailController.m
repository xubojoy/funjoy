//
//  HistoryDetailController.m
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "HistoryDetailController.h"
#import "HistoryStore.h"
#import "HistoryDetail.h"
#import <TYAttributedLabel/TYAttributedLabel.h>
@interface HistoryDetailController ()
@property(nonatomic, strong) NSMutableArray *historyDetailArray;
@end

@implementation HistoryDetailController
- (instancetype)initWithE_id:(int)e_id{
    self = [super init];
    if (self) {
        self.e_id = e_id;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.historyDetailArray = [NSMutableArray new];
    [self initScrollView];
    [self loadDetailData];
}

- (void)loadDetailData{
    [HistoryStore getHistoryDetailById:^(NSArray *detailArray, NSError *error) {
        if (detailArray != nil) {
            [self.historyDetailArray addObjectsFromArray:detailArray];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initUI];
        });
    } e_id:self.e_id];
}

- (void)initScrollView{
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-tabbar_height)];
    [self.view addSubview:self.bgScrollView];
}

- (void)initUI{
    if (self.historyDetailArray.count > 0) {
        HistoryDetail *historyDetail = self.historyDetailArray[0];
//        NSAttributedString * attrStr = [[NSAttributedString alloc]initWithData:[historyDetail.content dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
        TYAttributedLabel *label = [[TYAttributedLabel alloc] init];
        [label setFrameWithOrign:CGPointMake(15, 0) Width:CGRectGetWidth(self.view.frame)-30];
        [self.bgScrollView addSubview:label];
//        [label setAttributedText:attrStr];
        label.text = historyDetail.content;
        [label setFont:[UIFont systemFontOfSize:14]];
        [label sizeToFit];
        CGSize labelSize = [label getSizeWithWidth:self.view.bounds.size.width-30];
        NSLog(@"----------%f------%f",labelSize.height,labelSize.width);
        self.bgScrollView.contentSize = CGSizeMake(screen_width, labelSize.height);
    }
    
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
