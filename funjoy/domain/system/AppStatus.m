//
//  AppStatus.m
//  styler
//
//  Created by System Administrator on 13-5-13.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import "AppStatus.h"

@implementation AppStatus

-(NSString *) ua{
    NSMutableString *ua = [[NSMutableString alloc] init];
    [ua appendFormat:@"golf_ios,%@", [[UIDevice currentDevice] systemVersion]];
    [ua appendFormat:@";%@,%d*%d",[[UIDevice currentDevice] model],  (int)[[UIScreen mainScreen] bounds].size.width,  (int)[[UIScreen mainScreen]bounds].size.height];
    
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    [ua appendFormat:@";%@,%@", @"golf",  [dicInfo objectForKey:@"CFBundleShortVersionString"]];
    [ua appendFormat:@";%@", [OpenUDID value]];
    [ua appendFormat:@";%@", self.deviceToken==nil?@"unknow":self.deviceToken];
//    [ua appendFormat:@";%f,%f", self.lastLng, self.lastLat];
//    NSLog(@">>>>>>>>>>>>>>>>>%@",ua);
    return ua;
}

//是否登录
-(BOOL) logined{
    if(self.user != nil && self.user.accessToken != nil && (NSNull *)self.user.accessToken != [NSNull null])
        return YES;
    return NO;
}

-(BOOL)isConnetInternet{
    if (self.networkStatus == AFNetworkReachabilityStatusNotReachable) {
        return NO;
    }
    return YES;
}

-(float)iosVersion{
   return [[[UIDevice currentDevice] systemVersion] floatValue];
}

-(NSString *)appVersion{
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    return [dicInfo objectForKey:@"CFBundleShortVersionString"];
}

-(float) getLastLat{
    if (_lastLat == 0) {
        return 39.921787;
    }
    return _lastLat;
}
-(float) getLastLng{
    if (_lastLng == 0) {
        return 116.487922;
    }
    return _lastLng;
}

-(void) addUnLoginPraisedArticle:(int)articleId{
    if(self.praisedArticleIds == nil){
        self.praisedArticleIds = [[NSMutableSet alloc] init];
    }
    NSMutableSet *articleIds = [[NSMutableSet alloc] initWithSet:self.praisedArticleIds];
    [articleIds addObject:@(articleId)];
    self.praisedArticleIds = articleIds;
}

-(void) removeUnLoginPraisedArticle:(int)articleId{
    
    NSMutableSet *articleIds = [[NSMutableSet alloc] init];
    for (NSNumber *praisedId in self.praisedArticleIds) {
        if([praisedId intValue] != articleId){
            [articleIds addObject:praisedId];
        }
    }
    self.praisedArticleIds = articleIds;
}

-(BOOL) hasAddUnLoginPraisedArticle:(int)articleId{
    if(self.praisedArticleIds != nil){
        for (NSNumber *praisedId in self.praisedArticleIds) {
            if([praisedId intValue] == articleId){
                return YES;
            }
        }
    }
    return NO;
}


-(void) addUnLoginCommentArticle:(int)articleId{
    if(self.commentArticleIds == nil){
        self.commentArticleIds = [[NSMutableSet alloc] init];
    }
    NSMutableSet *articleIds = [[NSMutableSet alloc] initWithSet:self.commentArticleIds];
    [articleIds addObject:@(articleId)];
    self.commentArticleIds = articleIds;
}

-(void) removeUnLoginCommentArticle:(int)articleId{
    
    NSMutableSet *articleIds = [[NSMutableSet alloc] init];
    for (NSNumber *praisedId in self.commentArticleIds) {
        if([praisedId intValue] != articleId){
            [articleIds addObject:praisedId];
        }
    }
    self.commentArticleIds = articleIds;
}

-(BOOL) hasAddUnLoginCommentArticle:(int)articleId{
    if(self.commentArticleIds != nil){
        for (NSNumber *praisedId in self.commentArticleIds) {
            if([praisedId intValue] == articleId){
                return YES;
            }
        }
    }
    return NO;
}



-(void) removeGolfUA{
    NSDictionary *registeredDefaults = [[NSUserDefaults standardUserDefaults] volatileDomainForName:NSRegistrationDomain];
    if ([registeredDefaults objectForKey:@"UserAgent"] != nil) {
        NSLog(@">>>>>>> before remove styler ua:%@", [registeredDefaults objectForKey:@"UserAgent"]);
        NSMutableDictionary *mutableCopy = [NSMutableDictionary dictionaryWithDictionary:registeredDefaults];
        [mutableCopy removeObjectForKey:@"UserAgent"];
        [[NSUserDefaults standardUserDefaults] setVolatileDomain:[mutableCopy copy] forName:NSRegistrationDomain];
    }
}

-(void) setGolfUA{
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:[self ua], @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeDouble:self.lastLat forKey:@"lastLat"];
    [aCoder encodeDouble:self.lastLng forKey:@"lastLng"];
    [aCoder encodeObject:self.cityName forKey:@"City"];
    [aCoder encodeObject:self.currentLocation forKey:@"currentLocation"];
    [aCoder encodeObject:self.deviceToken forKey:@"deviceToken"];
    [aCoder encodeObject:self.user forKey:@"user"];
    [aCoder encodeObject:self.hasPostCommentArticles forKey:@"hasPostCommentArticles"];
    [aCoder encodeObject:self.categorysTitleArray forKey:@"categorysTitleArray"];
    [aCoder encodeObject:self.payingCommodityOrders forKey:@"payingCommodityOrders"];
    [aCoder encodeObject:self.paidCommodityOrders forKey:@"paidCommodityOrders"];
    [aCoder encodeObject:self.payingClubOrders forKey:@"payingClubOrders"];
    [aCoder encodeObject:self.paidClubOrders forKey:@"paidClubOrders"];
    [aCoder encodeObject:self.saveDate forKey:@"saveDate"];
    [aCoder encodeInt:self.loginZanCount forKey:@"loginZanCount"];
    [aCoder encodeInt:self.unLoginZanCount forKey:@"unLoginZanCount"];
    [aCoder encodeInt:self.didIndexPathRow forKey:@"didIndexPathRow"];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.lastLat = [aDecoder decodeDoubleForKey:@"lastLat"];
        self.lastLng = [aDecoder decodeDoubleForKey:@"lastLng"];
        self.cityName = [aDecoder decodeObjectForKey:@"City"];
        self.currentLocation = [aDecoder decodeObjectForKey:@"currentLocation"];
        self.deviceToken = [aDecoder decodeObjectForKey:@"deviceToken"];
        self.user = [aDecoder decodeObjectForKey:@"user"];
        self.payingCommodityOrders = [aDecoder decodeObjectForKey:@"payingCommodityOrders"];
        self.paidCommodityOrders = [aDecoder decodeObjectForKey:@"paidCommodityOrders"];
        self.hasPostCommentArticles = [aDecoder decodeObjectForKey:@"hasPostCommentArticles"];
        self.categorysTitleArray = [aDecoder decodeObjectForKey:@"categorysTitleArray"];
        self.payingClubOrders = [aDecoder decodeObjectForKey:@"payingClubOrders"];
        self.paidClubOrders = [aDecoder decodeObjectForKey:@"paidClubOrders"];
        self.saveDate = [aDecoder decodeObjectForKey:@"saveDate"];
        self.loginZanCount = [aDecoder decodeIntForKey:@"loginZanCount"];
        self.unLoginZanCount = [aDecoder decodeIntForKey:@"unLoginZanCount"];
        self.didIndexPathRow = [aDecoder decodeIntForKey:@"didIndexPathRow"];
        if (self.hasPostCommentArticles == nil) {
            self.hasPostCommentArticles = [NSMutableArray new];
        }
        if (self.categorysTitleArray == nil) {
            self.categorysTitleArray = [NSMutableArray new];
        }
        if (self.payingCommodityOrders == nil) {
            self.payingCommodityOrders = [NSMutableArray new];
        }
        if (self.payingClubOrders == nil) {
            self.payingClubOrders = [NSMutableArray new];
        }
        if (self.paidClubOrders == nil) {
            self.paidClubOrders = [NSMutableArray new];
        }
        if (self.paidCommodityOrders == nil) {
            self.paidCommodityOrders = [NSMutableArray new];
        }
    }
    return self;
}

+(void) saveAppStatus{
    NSLog(@"AppStatus to be saving:%@", [AppStatus sharedInstance].description);
    [NSKeyedArchiver archiveRootObject:[AppStatus sharedInstance] toFile:[AppStatus savedPath]];
}

+(NSString *) savedPath{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    documentDirectory = [documentDirectory stringByAppendingPathComponent:@"appStatus.archive"];
//    NSLog(@"____________________%@",documentDirectory);
    return documentDirectory;
}

+(AppStatus *)sharedInstance{
    static AppStatus *sharedInstance = nil;
    if(sharedInstance == nil){
        NSString *path = [AppStatus savedPath];
        sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if(sharedInstance == nil){
            sharedInstance = [[AppStatus alloc] init];
        }
        NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
        sharedInstance.apiUrl = [dicInfo objectForKey:@"apiUrl"];
        sharedInstance.searcherUrl = [dicInfo objectForKey:@"searcherUrl"];
        sharedInstance.cmsUrl = [dicInfo objectForKey:@"cmsUrl"];
        sharedInstance.env = [dicInfo objectForKey:@"env"];
        sharedInstance.umengAppKey = [dicInfo objectForKey:@"umengAppKey"];
        sharedInstance.paymentUrl = [dicInfo objectForKey:@"paymentUrl"];
        sharedInstance.wxpubUrl = [dicInfo objectForKey:@"wxpubUrl"];
        sharedInstance.gameBlockIds = [dicInfo objectForKey:@"gameBlockIds"];
        sharedInstance.umengPushAppKey = [dicInfo objectForKey:@"umengPushAppKey"];

    }
    return sharedInstance;
}

/**
 *  初始化AppStatus 基本数据。
 */
-(void) initBaseData{
    self.hasPostCommentArticles = [NSMutableArray new];
    self.categorysTitleArray = [NSMutableArray new];
    self.payingCommodityOrders = [NSMutableArray new];
    self.paidCommodityOrders = [NSMutableArray new];
    
    self.payingClubOrders = [NSMutableArray new];
    self.paidClubOrders = [NSMutableArray new];
    
    self.user = nil;
}


-(NSString *) description{
    return [NSString stringWithFormat:@"deviceToken:%@, user:%@, lastLat:%f, lastLng:%f", self.deviceToken, self.user
            .description, self.lastLat, self.lastLng];
}

@end
