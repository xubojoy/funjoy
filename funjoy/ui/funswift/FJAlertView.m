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
    self.contentView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
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
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:font_15_size];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(general_space);
    }];
    
//    UIView *downLine = [[UIView alloc] init];
//    downLine.backgroundColor = [ColorUtils colorWithHexString:splite_line_color];
//    [self.contentView addSubview:downLine];
//    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(5);
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.height.mas_equalTo(splite_line_height);
//    }];
    
    self.contentBgScrollView = [[UIScrollView alloc] init];
    self.contentBgScrollView.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    self.contentBgScrollView.scrollEnabled = YES;
    self.contentBgScrollView.showsVerticalScrollIndicator = YES;
    [self.contentView addSubview:self.contentBgScrollView];
    [self.contentBgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-5);
    }];
    self.contentBgScrollView.contentSize = CGSizeMake(screen_width-2*general_margin, 80);
//    内容
    _messageLabel = [[TYAttributedLabel alloc] init];
    [_messageLabel setFrameWithOrign:CGPointMake(10, 0) Width:screen_width-2*general_margin-20];
    _messageLabel.backgroundColor = [ColorUtils colorWithHexString:common_purple_color];
    [self.contentBgScrollView addSubview:_messageLabel];

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
    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_message];
//    [attributedString addAttributeFont:[UIFont fontWithName:@"HelveticaNeue" size:font_14_size]];
//    [attributedString addAttributeTextColor:[ColorUtils colorWithHexString:white_text_color]];
//    if ([_message containsString:@"发展经过:"] || [_message containsString:@"发展经历:"] || [_message containsString:@"出处"]) {
//
//        [attributedString addAttributeTextColor:[ColorUtils colorWithHexString:green_common_color] range:NSMakeRange(0, 3)];
//    }
//    [_messageLabel appendTextAttributedString:attributedString];
    [self createTextContainer];
    
    _messageLabel.textContainer = _textContainer;
    
    
    [_messageLabel sizeToFit];
    CGSize messageLabelSize = [_messageLabel getSizeWithWidth:((screen_width-2*general_margin)-20)];
    self.contentBgScrollView.contentSize = CGSizeMake((screen_width-2*general_margin),messageLabelSize.height);
    
    if (messageLabelSize.height > screen_height/2) {
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(400);
        }];
    }else{
        [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(messageLabelSize.height+40+splite_line_height);
        }];
    }
    [self.closeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_bottom).mas_offset(15);
    }];
}

- (void)createTextContainer
{
    // 属性文本生成器
    TYTextContainer *textContainer = [[TYTextContainer alloc]init];
    textContainer.textColor = [ColorUtils colorWithHexString:white_text_color];
    textContainer.text = _message;
    
    // 整体设置属性
    textContainer.linesSpacing = 2;
    textContainer.paragraphSpacing = 5;
    
    NSArray *array = @[@"发展经过:",@"发展经历:",@"出处：",@"简介：",@"词语来源：",@"引申含义：",@"由来：",@"演变：",@"发展：",@"起源：",@"引用示例：",@"APP推荐：",@"造句：",@"引用示例："];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([_message containsString:obj]) {
            // 文字样式
            TYTextStorage *textStorage = [[TYTextStorage alloc]init];
            textStorage.range = [_message rangeOfString:obj];
            textStorage.font = [UIFont systemFontOfSize:font_14_size];
            textStorage.textColor = [ColorUtils colorWithHexString:green_common_color];
            [textContainer addTextStorage:textStorage];
        }
    }];
    
//    // 文字样式
//    TYTextStorage *textStorage1 = [[TYTextStorage alloc]init];
//    textStorage1.range = [_message rangeOfString:@"注解:"];
//    textStorage1.font = [UIFont systemFontOfSize:17];
//    textStorage1.textColor = RGB(209, 162, 74, 1);
//    [textContainer addTextStorage:textStorage1];
//
//    // 下划线文字
//    TYLinkTextStorage *linkTextStorage = [[TYLinkTextStorage alloc]init];
//    linkTextStorage.range = [_message rangeOfString:@"《蒹葭》"];
//    linkTextStorage.linkData = @"点击了 《蒹葭》";
//    [textContainer addTextStorage:linkTextStorage];
//
//    TYLinkTextStorage *linkTextStorage1 = [[TYLinkTextStorage alloc]init];
//    linkTextStorage1.range = [_message rangeOfString:@"《诗经·国风·秦风》"];
//    linkTextStorage1.linkData = @"点击了 《诗经·国风·秦风》";
//    [textContainer addTextStorage:linkTextStorage1];
//
//    // url图片
//    TYImageStorage *imageUrlStorage = [[TYImageStorage alloc]init];
//    imageUrlStorage.range = [_message rangeOfString:@"<img>"];
//    imageUrlStorage.imageURL = [NSURL URLWithString:@"http://imgbdb2.bendibao.com/beijing/201310/21/2013102114858726.jpg"];
//    imageUrlStorage.size = CGSizeMake(kAttrLabelWidth, 343*kAttrLabelWidth/600);
//    [textContainer addTextStorage:imageUrlStorage];
//
//    // image图片
//    TYImageStorage *imageStorage = [[TYImageStorage alloc]init];
//    imageStorage.range = [_message rangeOfString:@"[haha]"];
//    imageStorage.imageName = @"haha";
//    imageStorage.size = CGSizeMake(15, 15);
//    [textContainer addTextStorage:imageStorage];
//
   
    
    // 生成 NSAttributedString
    //_attString = [textContainer createAttributedString];
    
    // 或者 生成 TYTextContainer
    _textContainer = [textContainer createTextContainerWithTextWidth:((screen_width-2*general_margin)-20)];
    
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
