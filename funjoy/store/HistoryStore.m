//
//  HistoryStore.m
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "HistoryStore.h"
#import "HttpRequestFacade.h"
#import "History.h"
#import "HistoryDetail.h"
@implementation HistoryStore
+ (void)getHistoryToday:(void(^)(NSArray *historyArray, NSError *error))completionBlock month:(NSString *)month day:(NSString *)day{
    NSString *url = [NSString stringWithFormat:@"http://v.juhe.cn/todayOnhistory/queryEvent.php?key=2803adb890258d20d6d2a4f591c2d815&date=%@/%@",month,day];
    [[HttpRequestFacade sharedInstance] get:url completionBlock:^(NSString *json, NSError *err) {
        if (err == nil) {
            NSDictionary *dict = (NSDictionary *)json;
            NSLog(@"_________是啥_______%@",dict[@"result"]);
            NSArray *list = dict[@"result"];
            NSMutableArray *array = [History mj_objectArrayWithKeyValuesArray:list];
            NSLog(@"_________是啥111111_______%@",array);
            completionBlock(array, nil);
        }else{
            completionBlock(nil, err);
        }
    }];
}

+ (void)getHistoryDetailById:(void(^)(NSArray *detailArray, NSError *error))completionBlock e_id:(int)e_id{
    NSString *url = [NSString stringWithFormat:@"http://v.juhe.cn/todayOnhistory/queryDetail.php?key=2803adb890258d20d6d2a4f591c2d815&e_id=%d",e_id];
    [[HttpRequestFacade sharedInstance] get:url completionBlock:^(NSString *json, NSError *err) {
        if (err == nil) {
            NSDictionary *dict = (NSDictionary *)json;
            NSLog(@"_________详情_______%@",dict[@"result"]);
            NSArray *list = dict[@"result"];
            NSMutableArray *array = [HistoryDetail mj_objectArrayWithKeyValuesArray:list];
            NSLog(@"_________详情111111_______%@",array);
            completionBlock(array, nil);
        }else{
            completionBlock(nil, err);
        }
    }];
}
@end
