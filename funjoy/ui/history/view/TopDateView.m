//
//  TopDateView.m
//  funjoy
//
//  Created by xubojoy on 2018/1/15.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "TopDateView.h"
#import <objc/runtime.h>
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
    
    self.dayLabel = [[UILabel alloc] init];
    self.dayLabel.textColor = [ColorUtils colorWithHexString:green_light_color];
//    self.dayLabel.backgroundColor = [ColorUtils colorWithHexString:@"#505052"];
    self.dayLabel.backgroundColor = [UIColor clearColor];
    self.dayLabel.textAlignment = NSTextAlignmentCenter;
    self.dayLabel.font = [UIFont systemFontOfSize:font_24_size];
    [self addSubview:self.dayLabel];
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    self.dayLabel.text = [NSString stringWithFormat:@"%d/%d",self.dateUtils.month,self.dateUtils.day];
    self.dayLabel.layer.cornerRadius = 40;
    self.dayLabel.layer.masksToBounds = YES;
    self.dayLabel.layer.borderWidth = splite_line_height;
    self.dayLabel.layer.borderColor = [ColorUtils colorWithHexString:splite_line_color].CGColor;
    
    UIButton *afterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    afterBtn.backgroundColor = [UIColor clearColor];
    [afterBtn setTitle:@"后一天" forState:UIControlStateNormal];
    [afterBtn setTitleColor:[ColorUtils colorWithHexString:splite_line_color] forState:UIControlStateNormal];
    [afterBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [afterBtn addTarget:self action:@selector(sellectDateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    afterBtn.tag = AFTER_BTN;
//    [afterBtn];
    [self addSubview:afterBtn];
    [afterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.dayLabel.mas_left).mas_offset(-20);
        make.centerY.mas_equalTo(self.dayLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];

    UIButton *beforeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beforeBtn.backgroundColor = [UIColor clearColor];
    [beforeBtn setTitle:@"前一天" forState:UIControlStateNormal];
    [beforeBtn setTitleColor:[ColorUtils colorWithHexString:splite_line_color] forState:UIControlStateNormal];
    [beforeBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [beforeBtn addTarget:self action:@selector(sellectDateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    beforeBtn.tag = BEFORE_BTN;
    [self addSubview:beforeBtn];
    [beforeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dayLabel.mas_right).mas_offset(20);
        make.centerY.mas_equalTo(self.dayLabel.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 40));
    }];
    
    UIView *downLine = [[UIView alloc] init];
    downLine.backgroundColor = [ColorUtils colorWithHexString:splite_line_color];
    [self addSubview:downLine];
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-splite_line_height);
        make.height.mas_equalTo(splite_line_height);
    }];
}

- (void)sellectDateBtnClick:(UIButton *)sender{
//    NSLog(@"--------sender.tag--------%ld",(long)sender.tag);
//    NSNumber *num = [NSNumber numberWithInteger:sender.tag];
//    objc_setAssociatedObject(sender, &associatedKey, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.sellectDateBtnClick) {
        self.sellectDateBtnClick(sender);
    }
}

- (void)updateDateLabel:(NSString *)dateStr{
    self.dayLabel.text = dateStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
