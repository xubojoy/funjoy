//
//  PushRecord.h
//  styler
//
//  Created by System Administrator on 13-6-19.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//


#define push_type_system_push 1  //系统push
#define push_type_system_notice 2  //系统通知
#define push_type_user_msg   3  //用户消息
#define push_type_system_feedback 4 //系统反馈

#define push_type_order_confirmed 5  //订单确认
#define push_type_order_canceled 6   //订单取消
#define push_type_order_complete 7   //订单完成

#define push_type_user_join_game 8   //用户加入比赛
#define push_type_user_game_cancel   9  //用户比赛取消
#define push_type_user_game_over    10  // 用户比赛结束

#define push_type_order_changed 11
#define push_type_game_order_changed  12

#define push_type_order_change_schedule_time 13

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"

@interface PushRecord : NSObject<JSONSerializable,NSCopying,NSCoding>

@property int pushId;
@property int pushType;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *sn;
@property (nonatomic, copy) NSString *url;
@property int orderId;

-(BOOL) isOrderPush;
-(BOOL) isGameOrderPush;
-(BOOL) isFeedbackPush;
- (BOOL) isSystemPush;

+(PushRecord *) readFromNotification:(NSDictionary *)notifiUserInfo;
+(NSArray *) readPushRecordsFromJsonDictionayArray:(NSArray *)jsonDictArray;
@end
