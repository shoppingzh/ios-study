//
//  WebUI.m
//  WebViewTargetDemo
//
//  Created by xpzheng on 2019/9/7.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "WebUI.h"
#import <WebKit/WebKit.h>

@interface WebUI () <WKNavigationDelegate, WKUIDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation WebUI

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Web ui load");
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
    
    if(!navigationAction.targetFrame.isMainFrame){
        [self.webView loadRequest:navigationAction.request];
    }
    NSLog(@"create new webview");
    
    return nil;
    
}



@end
