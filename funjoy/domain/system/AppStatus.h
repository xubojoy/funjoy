//
//  AppStatus.h
//  styler
//
//  Created by System Administrator on 13-5-13.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import "User.h"
#import <Foundation/Foundation.h>
#import "AppActiveScene.h"
#import "Reachability.h"
@interface AppStatus : NSObject<NSCoding>

@property (nonatomic, strong) NSString *currentLocation;
@property NetworkStatus networkStatus;
@property (nonatomic, strong) NSString *deviceToken;
@property double lastLat;//纬度
@property double lastLng;//经度
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *apiUrl;
@property (nonatomic, retain) NSString *searcherUrl;
@property (nonatomic, retain) NSString *cmsUrl;
@property (nonatomic, strong) NSString *wxpubUrl;
@property (nonatomic, retain) NSString *env;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gameBlockIds;

@property (nonatomic, strong) NSMutableArray *hasPostCommentArticles;
@property (nonatomic, strong) NSMutableArray *categorysTitleArray;

@property (nonatomic , strong) NSMutableSet *commentArticleIds;
@property (nonatomic , strong) NSMutableSet *praisedArticleIds;

@property (nonatomic, assign) int loginZanCount;
@property (nonatomic, assign) int unLoginZanCount;

@property (nonatomic, strong) NSMutableArray *payingCommodityOrders;
@property (nonatomic, strong) NSMutableArray *paidCommodityOrders;

@property (nonatomic, strong) NSMutableArray *payingClubOrders;
@property (nonatomic, strong) NSMutableArray *paidClubOrders;

@property (nonatomic, strong) NSString *umengAppKey;
@property (nonatomic, strong) NSString *paymentUrl;
@property (nonatomic, strong) NSString *umengPushAppKey;

@property (nonatomic, strong) NSDate *saveDate;

@property (nonatomic, assign) int didIndexPathRow;



-(BOOL) isConnetInternet;
-(float) iosVersion;
-(NSString *) appVersion;
-(BOOL) logined;

+(void) saveAppStatus;

-(void) removeGolfUA;
-(void) setGolfUA;

+ (AppStatus *) sharedInstance;

+ (NSString *) savedPath;

-(NSString *) ua;
-(void) initBaseData;

-(float) getLastLat;
-(float) getLastLng;

-(void) addUnLoginPraisedArticle:(int)articleId;
-(void) removeUnLoginPraisedArticle:(int)articleId;
-(BOOL) hasAddUnLoginPraisedArticle:(int)articleId;

-(void) addUnLoginCommentArticle:(int)articleId;
-(void) removeUnLoginCommentArticle:(int)articleId;
-(BOOL) hasAddUnLoginCommentArticle:(int)articleId;


@end
