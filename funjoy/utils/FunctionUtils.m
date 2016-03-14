//
//  FunctionUtils.m
//  styler
//
//  Created by 冯聪智 on 14-9-19.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "FunctionUtils.h"

@implementation FunctionUtils


+(void)setTimeout:(void (^)())block delayTime:(float)delayTime{
    [self performSelector:@selector(runBlock:) withObject:block afterDelay:delayTime];
}


+(void) runBlock:(void (^)())block{
    block();
}

+ (NSString *)getChineseNum:(int)num{
    switch (num) {
        case 1:
            return @"一";
            break;
        case 2:
            return @"二";
            break;
        case 3:
            return @"三";
            break;
        case 4:
            return @"四";
            break;
            
        default:
            break;
    }
    return @"";
}

+ (NSString *)getChineseNumByBool:(int)num{
    if (num == 0) {
        return @"双";
    }
    return @"单";
}

@end
