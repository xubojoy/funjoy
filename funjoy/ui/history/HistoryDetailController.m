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
#import "PicUrlModel.h"

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
    [self setRightSwipeGestureAndAdaptive];
    self.historyDetailArray = [NSMutableArray new];
    [self.view addSubview:self.customNavBar];
    [self.customNavBar wr_setBottomLineHidden:YES];
    
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:1];
    [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"button_arrow_white_icon"]];
    __weak typeof(self) weakSelf = self;
    self.customNavBar.onClickLeftButton = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
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
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [WRNavigationBar navBarBottom], screen_width, screen_height-[WRNavigationBar navBarBottom])];
    self.bgScrollView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    [self.view addSubview:self.bgScrollView];
}

- (void)initUI{
    if (self.historyDetailArray.count > 0) {
        HistoryDetail *historyDetail = self.historyDetailArray[0];
        
        NSLog(@"-----图片数组-----%@",historyDetail.picUrl);
        
        //        NSAttributedString * attrStr = [[NSAttributedString alloc]initWithData:[historyDetail.content dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
        TYAttributedLabel *label = [[TYAttributedLabel alloc] init];
        label.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
        [label setFrameWithOrign:CGPointMake(15, 0) Width:CGRectGetWidth(self.view.frame)-30];
        [self.bgScrollView addSubview:label];
        
        // 追加 图片Url
        if (historyDetail.picUrl.count > 0) {
            PicUrlModel *picUrlModel = historyDetail.picUrl[0];
            TYImageStorage *imageUrlStorage = [[TYImageStorage alloc]init];
            imageUrlStorage.imageURL = [NSURL URLWithString:picUrlModel.url];
            imageUrlStorage.size = CGSizeMake(CGRectGetWidth(label.frame), 343*CGRectGetWidth(label.frame)/600);
            [label appendTextStorage:imageUrlStorage];
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:historyDetail.content];
        [attributedString addAttributeFont:[UIFont systemFontOfSize:15]];
        [attributedString addAttributeTextColor:[UIColor whiteColor]];
        [label appendTextAttributedString:attributedString];
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
