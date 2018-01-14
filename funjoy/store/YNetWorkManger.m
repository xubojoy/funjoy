//
//  YNetWorkManger.m
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "YNetWorkManger.h"
static YNetWorkManger *shareManger = nil;
@implementation YNetWorkManger

+ (YNetWorkManger *)shareManger{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManger = (YNetWorkManger *)[AFHTTPSessionManager manager];
        shareManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return shareManger;
}
@end
