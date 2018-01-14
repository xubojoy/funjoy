//
//  HttpRequestFacade.h
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestFacade : NSObject
- (void)get:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock;

- (void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))comletionBlock params:(NSDictionary *)params;

- (void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock jsonString:(NSString *)jsonString;
+(HttpRequestFacade *)sharedInstance;
@end
