//
//  CommonSenseCell.m
//  funjoy
//
//  Created by xubojoy on 2018/1/16.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "CommonSenseCell.h"

@implementation CommonSenseCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(((screen_width/4)-80)/2);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.layer.masksToBounds = YES;
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont systemFontOfSize:font_13_size];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"健康常识";
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.iconImageView.mas_bottom).mas_offset(0);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(screen_width/4, 20));
    }];
}

@end
