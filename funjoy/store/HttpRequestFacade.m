//
//  HttpRequestFacade.m
//  funjoy
//
//  Created by xubojoy on 2018/1/12.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import "HttpRequestFacade.h"
#import "YNetWorkManger.h"
static HttpRequestFacade *sharedInstance = nil;
@implementation HttpRequestFacade
+(HttpRequestFacade *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HttpRequestFacade alloc] init];
    });
    return sharedInstance;
}

- (void)get:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock{
    [YNetWorkManger shareManger].responseSerializer = [AFJSONResponseSerializer serializer];
    [YNetWorkManger shareManger].requestSerializer=[AFJSONRequestSerializer serializer];
    [[YNetWorkManger shareManger].requestSerializer setTimeoutInterval:15];
    [YNetWorkManger shareManger].responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    //验证证书模式
    //    [YNetWorkManger shareManger].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObjects:[self resultDataOfCerPath], nil]];
//    [YNetWorkManger shareManger].securityPolicy.validatesDomainName=YES;
//    [YNetWorkManger shareManger].securityPolicy.allowInvalidCertificates = YES;
//
//
//    [YNetWorkManger shareManger].requestSerializer.HTTPShouldHandleCookies = YES;
    NSLog(@"_________请求url__________%@",urlStr);
    [[YNetWorkManger shareManger] GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"--------返回数据----------%@",responseObject);
        completionBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))comletionBlock params:(NSDictionary *)params{
    [YNetWorkManger shareManger].responseSerializer = [AFJSONResponseSerializer serializer];
    [YNetWorkManger shareManger].requestSerializer=[AFJSONRequestSerializer serializer];
    [[YNetWorkManger shareManger].requestSerializer setTimeoutInterval:15];
    [YNetWorkManger shareManger].responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    //验证证书模式
//    [YNetWorkManger shareManger].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObjects:[self resultDataOfCerPath], nil]];
    [YNetWorkManger shareManger].securityPolicy.validatesDomainName=YES;
    [YNetWorkManger shareManger].securityPolicy.allowInvalidCertificates = YES;
    
    
    [YNetWorkManger shareManger].requestSerializer.HTTPShouldHandleCookies = YES;
    
    [[YNetWorkManger shareManger] POST:@"" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock jsonString:(NSString *)jsonString{
    [YNetWorkManger shareManger].responseSerializer = [AFJSONResponseSerializer serializer];
    [YNetWorkManger shareManger].requestSerializer=[AFJSONRequestSerializer serializer];
    [[YNetWorkManger shareManger].requestSerializer setTimeoutInterval:15];
    [YNetWorkManger shareManger].responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"text/json",@"text/javascript",@"application/json",@"text/html",@"image/jpeg",@"image/png", @"application/octet-stream",@"multipart/form-data"]];
    
    //验证证书模式
    //    [YNetWorkManger shareManger].securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[NSSet setWithObjects:[self resultDataOfCerPath], nil]];
    [YNetWorkManger shareManger].securityPolicy.validatesDomainName=YES;
    [YNetWorkManger shareManger].securityPolicy.allowInvalidCertificates = YES;
    
    
    [YNetWorkManger shareManger].requestSerializer.HTTPShouldHandleCookies = YES;
    
    [[YNetWorkManger shareManger] POST:@"" parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end

