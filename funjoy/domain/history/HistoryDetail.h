//
//  HistoryDetail.h
//  funjoy
//
//  Created by xubojoy on 2018/1/14.
//  Copyright © 2018年 xubojoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PicUrlModel.h"

@interface HistoryDetail : NSObject
@property (nonatomic, strong) NSString *e_id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *picNo;
@property (nonatomic, strong) NSArray *picUrl;
@end
