//
//  LORequestManger.m
//  PlanB
//
//  Created by young on 15/5/6.
//  Copyright (c) 2015年 young. All rights reserved.
//

#import "LORequestManger.h"
#define serverUrl @"http://192.168.1.1:8080/jiekou"

@implementation LORequestManger



+ (void)POST:(NSString *)URL params:(NSDictionary * )params completeBlock:(void (^)(id response, NSError *))completeBlock
{
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:15];
    [manager.requestSerializer setHTTPShouldHandleCookies:NO];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    // 请求超时时间
    NSString *postStr = URL;
    if (![URL hasPrefix:@"http"]) {
        
        postStr = [NSString stringWithFormat:@"%@%@", serverUrl,URL] ;
    }
    NSMutableDictionary *dict = [params mutableCopy];
    
    [manager POST:postStr parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        completeBlock(responseDict,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock( nil,error);
    }];
}

+ (void)GET:(NSString *)URL
    completeBlock:(void (^)(id, NSError *))completeBlock
{
    // 获得请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:15];
    [manager.requestSerializer setHTTPShouldHandleCookies:NO];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    
    
    NSString *getStr = URL;
//    NSLog(@"getStr======%@",getStr);
    if (![URL hasPrefix:@"http"]) {
        
        getStr = [NSString stringWithFormat:@"%@%@", serverUrl,URL] ;
    }
    [manager GET:getStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        completeBlock(responseDict, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil,error);
    }];

    
}

+ (void)UPLOADIMAGE:(NSString *)URL
             params:(NSDictionary *)params
        uploadImage:(UIImage *)image
            completeBlock:(void (^)(id, NSError *))completeBlock
{
    // 创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:15];
    [manager.requestSerializer setHTTPShouldHandleCookies:NO];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    NSString *postStr = [NSString stringWithFormat:@"%@%@", serverUrl,URL] ;
    NSMutableDictionary *dict = [params mutableCopy];
    [manager POST:postStr parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
        [formData appendPartWithFileData:imageData name:@"img" fileName:@"head.jpg" mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress is %lld,总字节 is %lld",uploadProgress.completedUnitCount,uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        completeBlock(responseDict, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completeBlock(nil, error);
    }];


}

- (void)downloadWithSongUrl:(NSString *)songUrl
{
    NSURL *url = [NSURL URLWithString:songUrl];
//    NSMutableURLRequest *request = [NSMutableURLRequest ]
}
@end
