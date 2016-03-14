//
//  NSStringUtils.m
//  styler
//
//  Created by wangwanggy820 on 14-9-4.
//  Copyright (c) 2014年 mlzj. All rights reserved.
//

#import "NSStringUtils.h"

@implementation NSStringUtils

+(BOOL) isBlank:(NSString *) str{
    if (str == nil || [str isEqualToString:@""] || [str isEqual:[NSNull null]] || [str isKindOfClass:[NSNull class]] ) {
        return YES;
    }
    return NO;
}

+(BOOL) isSpecialBlank:(NSString *)str{
    if (str == nil || [str isEqual:[NSNull null]] || [str isKindOfClass:[NSNull class]] ) {
        return YES;
    }
    return NO;
}

+(BOOL) ispecialNotBlank:(NSString *) str{
    return ![NSStringUtils isSpecialBlank:str];
}

+(BOOL) isNotBlank:(NSString *) str{
    return ![NSStringUtils isBlank:str];
}

+ (NSString *)stringFromInt:(int)num{
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
    return nil;
}

//判断内容是否全部为空格  yes 全部为空格  no 不是
+ (BOOL) isEmpty:(NSString *) str {
    
    if (!str) {
        return true;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}


@end
