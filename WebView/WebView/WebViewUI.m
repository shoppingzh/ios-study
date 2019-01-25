//
//  WebViewUI.m
//  WebView
//
//  Created by dascomsoft on 2019/1/25.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WebViewUI.h"

@interface WebViewUI () <UIWebViewDelegate>

@end

@implementation WebViewUI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    self.webView.allowsInlineMediaPlayback = YES;
    self.webView.delegate = self;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - WebView回调

// 开始加载页面前：该回调决定是否加载
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString* url  = request.URL.absoluteString;
    NSLog(@"即将要访问的URL为：%@", url);
    
    // 如果请求URL中没有包含"baidu"字符串，则不访问并提示
    if(![url containsString:@"baidu"]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"请求URL中不包含baidu字符串，不允许访问！" preferredStyle:UIAlertActionStyleDefault];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];

        [self.webView goBack];
        return NO;
    }
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
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
