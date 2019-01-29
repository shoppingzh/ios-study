//
//  WebViewUI.m
//  TabBarDemo
//
//  Created by dascomsoft on 2019/1/29.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WebViewUI.h"

@interface WebViewUI ()

@end

@implementation WebViewUI

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.littlezheng.com"]];
    [self.webView loadRequest:req];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
