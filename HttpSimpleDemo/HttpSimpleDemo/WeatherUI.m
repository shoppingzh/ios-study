//
//  WeatherUI.m
//  HttpSimpleDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WeatherUI.h"

@interface WeatherUI ()
@property (weak, nonatomic) IBOutlet UITextView *descText;

@end

@implementation WeatherUI

- (void)viewDidLoad {
    [super viewDidLoad];
    if(_city && [_city length]){
        self.title = [_city stringByAppendingString:@"天气"];
    }
    
    [self searchWeather];
}

// 查询天气
- (void)searchWeather{
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    NSString *url = [@"https://www.apiopen.top/weatherApi?city=" stringByAppendingString:_city];
    // URL转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"#%^{}\"[]|\\<> "].invertedSet];
    NSLog(@"请求URL：%@", url);
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"data：%@", data);
        NSString *text = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            _descText.text = text;
        });
    }];
    [task resume];
}

@end
