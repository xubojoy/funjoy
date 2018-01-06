//
//  LORequestManger.h
//  PlanB
//
//  Created by young on 15/5/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/**
 *  base网络请求
 */

@interface LORequestManger : NSObject

+ (void)POST:(NSString *)URL params:(NSDictionary * )params completeBlock:(void (^)(id response, NSError *err))completeBlock;


+ (void)GET:(NSString *)URL completeBlock:(void (^)(id response, NSError *err))completeBlock;

+ (void)UPLOADIMAGE:(NSString *)URL
             params:(NSDictionary *)params
        uploadImage:(UIImage *)image
            completeBlock:(void (^)(id response, NSError *err))completeBlock;
@end
