//
//  IndexViewController.h
//  funjoy
//
//  Created by xubojoy on 16/3/11.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMAdView.h"
@interface IndexViewController : UIViewController<DMAdViewDelegate,UIWebViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@property (nonatomic, strong) DMAdView *dmAdView;
@end
