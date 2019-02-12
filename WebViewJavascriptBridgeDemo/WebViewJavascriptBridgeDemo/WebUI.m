//
//  WebUI.m
//  JavaScriptCoreDemo
//
//  Created by dascomsoft on 2019/2/12.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WebUI.h"
#import "WebViewJavascriptBridge.h"

@interface WebUI ()

@property (nonatomic, strong) WebViewJavascriptBridge *bridge;
@property (weak, nonatomic) IBOutlet UITextField *colorInput;

@end

@implementation WebUI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBridge];
    [self loadHtml];
    
    _colorInput.placeholder = @"输入颜色值";
    
    [_bridge registerHandler:@"sayHello" handler:^(id data, WVJBResponseCallback responseCallback){
        NSLog(@"js调用oc");
        NSString *name;
        if([data isKindOfClass:[NSDictionary class]]){
            NSDictionary *dicData =  data;
            name = [dicData valueForKey:@"name"];
            
        }
        [self alert: [@"Hello, " stringByAppendingString:name]];
    }];
    [_bridge registerHandler:@"backgroundColorChanged" handler:^(id data, WVJBResponseCallback responseCallback) {
        [self alert:[@"背景颜色更改为：" stringByAppendingString:data]];
    }];
}

- (void)alert:(NSString*) msg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)initBridge{
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
}

- (void)loadHtml{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
    NSString *html = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:html baseURL:nil];
}

- (IBAction)jsBtnPress:(id)sender {
    NSString *color = _colorInput.text;
    if(!color || ![color length]){
        [self alert:@"请输入颜色值！"];
        return;
    }
    
    [_bridge callHandler:@"changeColor" data:color];
}

@end
