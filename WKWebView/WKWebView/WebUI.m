//
//  WebUI.m
//  WKWebView
//
//  Created by dascomsoft on 2019/2/12.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WebUI.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface WebUI () <WKUIDelegate, WKScriptMessageHandler>

@end

@implementation WebUI

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.UIDelegate = self;
    
    // _webView.configuration.allowsInlineMediaPlayback = YES;
    // NSLog(@"是否允许内嵌播放器播放视频：%@", _webView.configuration.allowsInlineMediaPlayback ? @"是" : @"否");
    
    [_webView.configuration.userContentController addScriptMessageHandler:self name:@"sayHello"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1.html" ofType:nil];
    NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    // NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webView loadHTMLString:html baseURL:nil];
}

- (IBAction)jsBtnPress:(id)sender {
    NSLog(@"改变网页颜色");
    [_webView evaluateJavaScript:@"changeColor()" completionHandler:nil];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name:%@, body:%@", message.name, message.body);
    if([@"sayHello" isEqualToString:message.name]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"Hello, world!" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}


@end
