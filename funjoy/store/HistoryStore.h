//
//  HistoryStore.h
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryStore : NSObject
+ (void)getHistoryToday:(void(^)(NSArray *historyArray, NSError *error))completionBlock month:(NSString *)month day:(NSString *)day;

+ (void)getHistoryDetailById:(void(^)(NSArray *detailArray, NSError *error))completionBlock e_id:(int)e_id;
@end
