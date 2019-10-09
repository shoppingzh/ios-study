//
//  ViewController.m
//  RuiShuSDKDemo
//
//  Created by xpzheng on 2019/9/16.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <MSecNetworking/MSecNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)sendRequest:(id)sender {
    [MSecClient Hook: NSURLSession.class];
    [MSecClient Hook: NSURLConnection.class];
    
//    NSString *url = @"http://dascom.free.idcfengye.com/test";
    NSString *url = @"http://61.139.70.227/suite/android/version.do";
    MSecClient *client = [MSecClient getClient:url];
    NSLog(@"请求头：%@", [client getRequestHeader]);
    
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manage GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"响应：%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
