//
//  TopDateView.h
//  funjoy
//
//  Created by xubojoy on 2018/1/15.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateUtils.h"

typedef enum : NSUInteger {
    BEFORE_BTN,
    AFTER_BTN,
} SelectDateBtnTag;

typedef void(^SellectDateBtnClick)(UIButton *dateBtn);

@interface TopDateView : UIView

@property (nonatomic, strong) DateUtils *dateUtils;
@property (nonatomic, copy) SellectDateBtnClick sellectDateBtnClick;

@end
