//
//  HomeUI.m
//  TabBarNavigationDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "HomeUI.h"

@interface HomeUI () <UIWebViewDelegate>

@end

@implementation HomeUI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlInput.placeholder = @"请输入网址，如：www.baidu.com";
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressVisitBtn:(id)sender {
    NSString *url = self.urlInput.text;
    if(!url || ![url length]){
        return;
    }
    if(![url hasPrefix:@"http"]){
        url = [@"http://" stringByAppendingString:url];
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:req];
}

#pragma mark -web view事件

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"即将加载");
    // 显示加载
    UIActivityIndicatorView *indicator =  [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.backgroundColor = [UIColor blackColor];
    indicator.alpha = 0.7;
    indicator.center = CGPointMake(self.webView.frame.size.width / 2, self.webView.frame.size.height /2);
    [indicator startAnimating];
    [self.webView addSubview:indicator];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self removeIndicatorFromWebView];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self removeIndicatorFromWebView];
}

-(void)removeIndicatorFromWebView{
    for(UIView *v in self.webView.subviews){
        if([v isKindOfClass:[UIActivityIndicatorView class]]){
            NSLog(@"找到了");
            [v removeFromSuperview];
        }
    }
}

@end
