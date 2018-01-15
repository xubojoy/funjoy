//
//  TopDateView.m
//  funjoy
//
//  Created by xubojoy on 2018/1/15.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "TopDateView.h"

@implementation TopDateView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.dateUtils = [[DateUtils alloc] initWithDate:[NSDate date]];
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    UILabel *dayLabel = [[UILabel alloc] init];
    dayLabel.textColor = [ColorUtils colorWithHexString:@"#c6c6c6"];
    dayLabel.backgroundColor = [ColorUtils colorWithHexString:@"#505052"];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.font = [UIFont systemFontOfSize:font_24_size];
    [self addSubview:dayLabel];
    [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    dayLabel.text = [NSString stringWithFormat:@"%d/%d",self.dateUtils.month,self.dateUtils.day];
    dayLabel.layer.cornerRadius = 50;
    dayLabel.layer.masksToBounds = YES;
    dayLabel.layer.borderWidth = splite_line_height;
    dayLabel.layer.borderColor = [ColorUtils colorWithHexString:@"#6B6B6C"].CGColor;
    
    UIButton *beforeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beforeBtn.backgroundColor = [UIColor clearColor];
    [beforeBtn setTitle:@"前一天" forState:UIControlStateNormal];
    [beforeBtn setTitleColor:[ColorUtils colorWithHexString:@"#c6c6c6"] forState:UIControlStateNormal];
    [beforeBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [beforeBtn addTarget:self action:@selector(sellectDateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    beforeBtn.tag = BEFORE_BTN;
    [self addSubview:beforeBtn];
    [beforeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(dayLabel.mas_left).mas_offset(-20);
        make.centerY.mas_equalTo(dayLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    UIButton *afterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    afterBtn.backgroundColor = [UIColor clearColor];
    [afterBtn setTitle:@"后一天" forState:UIControlStateNormal];
    [afterBtn setTitleColor:[ColorUtils colorWithHexString:@"#c6c6c6"] forState:UIControlStateNormal];
    [afterBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [afterBtn addTarget:self action:@selector(sellectDateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    afterBtn.tag = AFTER_BTN;
    [self addSubview:afterBtn];
    [afterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(dayLabel.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(dayLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    UIView *downLine = [[UIView alloc] init];
    downLine.backgroundColor = [ColorUtils colorWithHexString:splite_vertical_line_color];
    [self addSubview:downLine];
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-splite_line_height);
        make.height.mas_equalTo(splite_line_height);
    }];
}

- (void)sellectDateBtnClick:(UIButton *)sender{
    NSLog(@"--------sender.tag--------%ld",(long)sender.tag);
    if (self.sellectDateBtnClick) {
        self.sellectDateBtnClick(sender);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
