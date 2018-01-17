//
//  FJAlertView.m
//  funjoy
//
//  Created by xubojoy on 2018/1/17.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "FJAlertView.h"

@implementation FJAlertView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle{
    self = [super init];
    if (self) {
        self.frame = frame;
        _title = title;
        _message = message;
        _buttonTitle = buttonTitle;
        [self initUI];
    }
    return self;
}

- (void)initUI{
    //毛玻璃效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    _effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    _effectView.frame = self.bounds;
    _effectView.alpha = 0.8;
    [self addSubview:_effectView];
//    白色背景view
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.cornerRadius = 10;
    self.contentView.layer.masksToBounds = YES;
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(general_margin);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake((screen_width-2*general_margin), 80));
    }];
//    CABasicAnimation *theAnimation;
//    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    theAnimation.duration=2;
//    theAnimation.removedOnCompletion = YES;
//    theAnimation.fromValue = [NSNumber numberWithFloat:0];
//    theAnimation.toValue = [NSNumber numberWithFloat:1];
//    [self.contentView.layer addAnimation:theAnimation forKey:@"animateTransform"];
//    缩放动画  usingSpringWithDamping 弹性属性
    self.contentView.layer.affineTransform = CGAffineTransformMakeScale(0,0);
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.contentView.layer.affineTransform = CGAffineTransformMakeScale(1,1);
    } completion:^(BOOL finished) {

    }];
    
//    标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [ColorUtils colorWithHexString:green_light_color];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:font_15_size];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(general_space);
    }];
//    内容
    _messageLabel = [[TYAttributedLabel alloc] init];
    [self.contentView addSubview:_messageLabel];
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-5);
    }];
//    关闭按钮
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.closeBtn];
    [self.closeBtn setImage:[UIImage imageNamed:@"icon_del_cross"] forState:UIControlStateNormal];
    [self.closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(15);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    self.closeBtn.layer.cornerRadius = 20;
    self.closeBtn.layer.masksToBounds = YES;
    self.closeBtn.layer.borderWidth = splite_line_height;
    self.closeBtn.layer.borderColor = [ColorUtils colorWithHexString:splite_line_color].CGColor;
    
    [self updateViewFrame];
}
//更新frame
- (void)updateViewFrame{
    
    _titleLabel.text = _title;

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_message];
    [attributedString addAttributeFont:[UIFont systemFontOfSize:14]];
    [_messageLabel appendTextAttributedString:attributedString];
    [_messageLabel sizeToFit];
    CGSize messageLabelSize = [_messageLabel getSizeWithWidth:((screen_width-2*general_margin)-20)];
    NSLog(@"----------%f------%f",messageLabelSize.height,messageLabelSize.width);
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(messageLabelSize.height+35);
    }];
    
    [self.closeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(15);
    }];
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)closeBtnClick{
    self.contentView.layer.affineTransform = CGAffineTransformMakeScale(1,1);
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.contentView.layer.affineTransform = CGAffineTransformMakeScale(0,0);
        self.effectView.effect = nil;
        [self.closeBtn removeFromSuperview];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
