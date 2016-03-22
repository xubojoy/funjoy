//
//  NextViewController.m
//  funjoy
//
//  Created by xubojoy on 16/3/14.
//  Copyright © 2016年 xubojoy. All rights reserved.
//

#import "NextViewController.h"
#import "ForthViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.fd_prefersNavigationBarHidden = YES;
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(40, 40, 100, 100);
//    btn.backgroundColor = [UIColor purpleColor];
//    [btn setTitle:@"点我" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClcik) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    [self loadWebView];
}

-(void)loadWebView{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64)];
    NSURL *nsurl =[NSURL URLWithString:@"http://www.html5tricks.com/demo/css3-dialog-with-animation/index.html"];
    NSURLRequest *request =[NSURLRequest requestWithURL:nsurl];
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView setBackgroundColor:[UIColor clearColor]];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)inRequest   navigationType:(UIWebViewNavigationType)inType
{
    NSLog(@">>>>> to:%@", inRequest.URL);
    return YES;
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@">>>> web load error:%@", webView.request.URL);
}


//- (void)btnClcik{
//    ForthViewController *nvc = [[ForthViewController alloc] init];
//    [self.navigationController pushViewController:nvc animated:YES];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getPageName{
    return @"下页面";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
