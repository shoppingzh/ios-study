//
//  WebUI.m
//  WebViewProgressDemo
//
//  Created by dascomsoft on 2019/2/12.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WebUI.h"

@interface WebUI () <WKNavigationDelegate, WKUIDelegate>

@end

@implementation WebUI

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.navigationDelegate = self;
    _webView.allowsBackForwardNavigationGestures = YES;
    _webView.scrollView.bounces = NO;
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.littlezheng.com"]];
    [_webView loadRequest:req];
    
    // 进度监听
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == _webView){
        _progressView.progress = _webView.estimatedProgress;
        // NSLog(@"当前进度：%.2f", _webView.estimatedProgress);
    }
    
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//    NSLog(@"decidePolicyForNavigationAction");
    NSLog(@"decidePolicyForNavigationAction - 允许加载网页内容");
    
    NSLog(@"%@", navigationAction);
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//    NSLog(@"didStartProvisionalNavigation");
    NSLog(@"didStartProvisionalNavigation - 开始加载网页内容");
    
    [_progressView setHidden:NO];
    _progressView.progress = 0;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    NSLog(@"decidePolicyForNavigationResponse");
    NSLog(@"decidePolicyForNavigationResponse - 网页内容加载成功，继续");
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
//    NSLog(@"didCommitNavigation");
    NSLog(@"didCommitNavigation - 开始渲染内容到WebView中");
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
//    NSLog(@"didReceiveServerRedirectForProvisionalNavigation");
    NSLog(@"didReceiveServerRedirectForProvisionalNavigation - 服务器重定向");
}

//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
////    NSLog(@"didReceiveAuthenticationChallenge");
//    NSLog(@"didReceiveAuthenticationChallenge - 身份认证，继续");
//}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
//    NSLog(@"didFailNavigation");
    NSLog(@"didFailNavigation - 加载网页内容时发生错误");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
//    NSLog(@"didFailProvisionalNavigation");
    NSLog(@"didFailProvisionalNavigation - web视图渲染内容时发生错误，错误码：%ld", (long)error.code);
    
    [_progressView setHidden:NO];
    _progressView.tintColor = [UIColor orangeColor];
    _progressView.progress = 1;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    NSLog(@"didFinishNavigation");
    NSLog(@"didFinishNavigation - 导航结束");
    
    [_progressView setHidden:YES];
}

- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{
    NSLog(@"webViewWebContentProcessDidTerminate");
    NSLog(@"webViewWebContentProcessDidTerminate - 内容渲染完成");
}


#pragma mark - WKUIDelegate
- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo{
    
    return YES;
}


- (void)dealloc{
    // 移除监听器
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
