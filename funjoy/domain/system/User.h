//
//  UserStore.h
//  Golf
//
//  Created by xubojoy on 15/3/30.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//
#define gender_female 0
#define gender_male 1

#import <Foundation/Foundation.h>
#import "JSONSerializable.h"


@interface User : NSObject<JSONSerializable, NSCopying, NSCoding>

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *userCode;
//默认为女的即0 男 1
@property (nonatomic, assign) int userGender;

@property (nonatomic, strong) NSString *avatarUrl;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *loginMobileNo;
@property (nonatomic, assign) int gameCoins;
@property (nonatomic, assign) int pointScore;

@property (nonatomic , strong) NSMutableSet *praisedArticleId;
@property (nonatomic , strong) NSMutableSet *commentArticleId;

@property (nonatomic, assign) int cartCommodityCount;
@property (nonatomic, assign) NSInteger unpayedClubOrderCount;
@property (nonatomic, assign) NSInteger unpayedCommodityOrderCount;
@property (nonatomic, assign) NSInteger unpayedCommodityAndClubOrderCount;


-(NSString *)genderTxt;
-(void) addPraisedArticle:(int)articleId;
-(void) removePraisedArticle:(int)articleId;
-(BOOL) hasAddPraisedArticle:(int)articleId;

-(void) addCommentArticle:(int)articleId;
-(void) removeCommentArticle:(int)articleId;
-(BOOL) hasAddCommentArticle:(int)articleId;

@end
