//
//  WebUI.h
//  WebViewProgressDemo
//
//  Created by dascomsoft on 2019/2/12.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebUI : UIViewController
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end
