//
//  YNetWorkManger.h
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YNetWorkManger : AFHTTPSessionManager

+ (YNetWorkManger *)shareManger;

@end
