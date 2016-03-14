//
//  UserStore.h
//  Golf
//
//  Created by xubojoy on 15/3/30.
//  Copyright (c) 2015年 xubojoy. All rights reserved.
//
#import "User.h"
@implementation User

-(NSString *)genderTxt{
    if(self.userGender == gender_male){
        return @"男";
    }
    return @"女";
}

-(void) addPraisedArticle:(int)articleId{
    if(self.praisedArticleId == nil){
        self.praisedArticleId = [[NSMutableSet alloc] init];
    }
    NSMutableSet *articleIds = [[NSMutableSet alloc] initWithSet:self.praisedArticleId];
    [articleIds addObject:@(articleId)];
    self.praisedArticleId = articleIds;
}

-(void) removePraisedArticle:(int)articleId{
    
    NSMutableSet *articleIds = [[NSMutableSet alloc] init];
    for (NSNumber *praisedId in self.praisedArticleId) {
        if([praisedId intValue] != articleId){
            [articleIds addObject:praisedId];
        }
    }
    self.praisedArticleId = articleIds;
}

-(BOOL) hasAddPraisedArticle:(int)articleId{
    if(self.praisedArticleId != nil){
        for (NSNumber *praisedId in self.praisedArticleId) {
            if([praisedId intValue] == articleId){
                return YES;
            }
        }
    }
    return NO;
}

-(void) addCommentArticle:(int)articleId{
    if(self.commentArticleId == nil){
        self.commentArticleId = [[NSMutableSet alloc] init];
    }
    NSMutableSet *articleIds = [[NSMutableSet alloc] initWithSet:self.commentArticleId];
    [articleIds addObject:@(articleId)];
    self.commentArticleId = articleIds;
}

-(void) removeCommentArticle:(int)articleId{
    
    NSMutableSet *articleIds = [[NSMutableSet alloc] init];
    for (NSNumber *praisedId in self.commentArticleId) {
        if([praisedId intValue] != articleId){
            [articleIds addObject:praisedId];
        }
    }
    self.commentArticleId = articleIds;
}

-(BOOL) hasAddCommentArticle:(int)articleId{
    if(self.commentArticleId != nil){
        for (NSNumber *praisedId in self.commentArticleId) {
            if([praisedId intValue] == articleId){
                return YES;
            }
        }
    }
    return NO;
}

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.userGender forKey:@"gender"];
    [aCoder encodeObject:self.avatarUrl forKey:@"avatarUrl"];
    [aCoder encodeObject:self.accessToken forKey:@"accessToken"];
    [aCoder encodeObject:self.loginMobileNo forKey:@"loginMobileNo"];
    [aCoder encodeObject:self.userCode forKey:@"userCode"];
    [aCoder encodeInt:self.gameCoins forKey:@"gameCoins"];
    [aCoder encodeInt:self.pointScore forKey:@"pointScore"];
    [aCoder encodeInt:self.cartCommodityCount forKey:@"cartCommodityCount"];
    [aCoder encodeInteger:self.unpayedClubOrderCount forKey:@"unpayedClubOrderCount"];
    [aCoder encodeInteger:self.unpayedCommodityOrderCount forKey:@"unpayedCommodityOrderCount"];
    [aCoder encodeInteger:self.unpayedCommodityAndClubOrderCount forKey:@"unpayedCommodityAndClubOrderCount"];
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if(self){
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.userGender = [aDecoder decodeIntForKey:@"gender"];
        self.avatarUrl = [aDecoder decodeObjectForKey:@"avatarUrl"];
        self.accessToken = [aDecoder decodeObjectForKey:@"accessToken"];
        self.loginMobileNo = [aDecoder decodeObjectForKey:@"loginMobileNo"];
        self.userCode = [aDecoder decodeObjectForKey:@"userCode"];
        self.gameCoins = [aDecoder decodeIntForKey:@"gameCoins"];
        self.pointScore = [aDecoder decodeIntForKey:@"pointScore"];
        self.cartCommodityCount = [aDecoder decodeIntForKey:@"cartCommodityCount"];
        self.unpayedClubOrderCount = [aDecoder decodeIntegerForKey:@"unpayedClubOrderCount"];
        self.unpayedCommodityOrderCount = [aDecoder decodeIntegerForKey:@"unpayedCommodityOrderCount"];
        self.unpayedCommodityAndClubOrderCount = [aDecoder decodeIntegerForKey:@"unpayedCommodityAndClubOrderCount"];
    }
    
    return self;
}

- (void) readFromJSONDictionary:(NSDictionary *)jsonDict{
    [self setId:[jsonDict objectForKey:@"id"]];
    [self setName:[jsonDict objectForKey:@"name"]];
    [self setUserGender:[[jsonDict objectForKey:@"userGender"] intValue]];
    [self setAccessToken:[jsonDict objectForKey:@"accessToken"]];
    [self setLoginMobileNo:[jsonDict objectForKey:@"loginMobileNo"]];
    [self setUserCode:[jsonDict objectForKey:@"userCode"]];
    [self setAvatarUrl:[jsonDict objectForKey:@"avatarUrl"]];
    [self setGameCoins:[[jsonDict objectForKey:@"gameCoins"] intValue]];
    [self setPointScore:[[jsonDict objectForKey:@"pointScore"] intValue]];
    [self setCartCommodityCount:[[jsonDict objectForKey:@"cartCommodityCount"] intValue]];
    [self setUnpayedClubOrderCount:[[jsonDict objectForKey:@"unpayedClubOrderCount"] integerValue]];
    [self setUnpayedCommodityOrderCount:[[jsonDict objectForKey:@"unpayedCommodityOrderCount"] integerValue]];
    [self setUnpayedCommodityAndClubOrderCount:[[jsonDict objectForKey:@"unpayedCommodityAndClubOrderCount"] integerValue]];
}

-(User *) copyWithZone:(NSZone *)zone{
    User *user = [[User allocWithZone:zone] init];
    
    user.id = self.id;
    user.name = self.name;
    user.userGender = self.userGender;
    user.accessToken = self.accessToken;
    user.loginMobileNo = self.loginMobileNo;
    user.userCode = self.userCode;
    user.avatarUrl = self.avatarUrl;
    user.gameCoins = self.gameCoins;
    user.pointScore = self.pointScore;
    user.cartCommodityCount = self.cartCommodityCount;
    user.unpayedClubOrderCount = self.unpayedClubOrderCount;
    user.unpayedCommodityOrderCount = self.unpayedCommodityOrderCount;
    user.unpayedCommodityAndClubOrderCount = self.unpayedCommodityAndClubOrderCount;
    return user;
}


-(NSString *) description{
    return [NSString stringWithFormat:@"id:%@, name:%@, accessToken:%@, moblieNo:%@", self.id, self.name, self.accessToken, self.loginMobileNo];
}

@end
