//
//  NextViewController.h
//  funjoy
//
//  Created by xubojoy on 16/3/14.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController<UIWebViewDelegate,UIScrollViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@end
