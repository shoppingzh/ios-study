//
//  OldWebUI.m
//  WebViewTargetDemo
//
//  Created by xpzheng on 2019/9/7.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "OldWebUI.h"

@interface OldWebUI ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation OldWebUI

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
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
