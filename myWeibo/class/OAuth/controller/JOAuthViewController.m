//
//  JOAuthViewController.m
//  myWeibo
//
//  Created by zhangjie520 on 3/10/16.
//  Copyright © 2016 zhangjie520. All rights reserved.
//

#import "JOAuthViewController.h"
#import "JPublic_head.h"

#define kOAuth2Url  @"https://open.weibo.cn/oauth2/authorize?client_id=%@&redirect_uri=%@&display=mobile"

@interface JOAuthViewController ()<UIWebViewDelegate>
{
    UIWebView *_webViewl;
}

@end

@implementation JOAuthViewController

#pragma mark - 生命周期方法
- (void)loadView {
    _webViewl = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webViewl.delegate = self;
    self.view = _webViewl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *stringPath =[NSString stringWithFormat:kOAuth2Url,kAppKey,kredirectUrl];
    NSURL *url = [NSURL URLWithString:stringPath];
    //[_webViewl loadRequest:[NSURLRequest requestWithURL:url]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - webView 代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlStr = request.URL.absoluteString;
    NSLog(@"url str:%@",urlStr);
    //拦截回调的url,终止请求.
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.location != NSNotFound) {
        //截取code
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        NSLog(@"code:%@ = ",code);
        
        return NO;
    }
    
    return YES;
}

@end
