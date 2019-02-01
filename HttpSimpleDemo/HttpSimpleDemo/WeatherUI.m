//
//  WeatherUI.m
//  HttpSimpleDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "WeatherUI.h"
#import "MJExtension.h"


// 预报
@interface Forecast : NSObject
@property (copy, nonatomic) NSString *date;
@property (copy, nonatomic) NSString *fengxiang;
@property (copy, nonatomic) NSString *high;
@property (copy, nonatomic) NSString *low;
@property (copy, nonatomic) NSString *type;
@end

// 天气
@interface Weather : NSObject
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *ganmao;
@property (strong, nonatomic) NSNumber *wendu;
@property (strong, nonatomic) NSArray *forecast;
@end

// 返回的数据
@interface BackData : NSObject
@property (copy, nonatomic) NSString *code;
@property (strong, nonatomic) Weather *data;
@property (copy, nonatomic) NSString *msg;
@end

@implementation Forecast

@end

@implementation BackData

@end

@implementation Weather

@end

@interface WeatherUI ()

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
    UIActivityIndicatorView *idc = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    idc.backgroundColor = [UIColor blackColor];
    [idc startAnimating];
    idc.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:idc];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 停止菊花
        dispatch_async(dispatch_get_main_queue(), ^{
            [idc removeFromSuperview];
        });
        
        NSString *text = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
        NSLog(@"json:\n %@", text);
        BackData *bd = [BackData mj_objectWithKeyValues:text];
        if(![@"200" isEqualToString:bd.code]){
            NSLog(@"查询失败，原因：%@", bd.msg);
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[@"查询失败，原因：" stringByAppendingString:bd.msg] preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction: [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self renderWeatherData:bd];
        });
        
        // NSLog(@"city=%@, ganmao=%@, wendu=%@", bd.data.city, bd.data.ganmao, bd.data.wendu);
        
    }];
    [task resume];
}

// 处理接收到的天气数据
- (void)renderWeatherData: (BackData*) bd{
    NSDictionary *tomorrow = [bd.data.forecast objectAtIndex:0];
    _typeLb.text = [tomorrow objectForKey:@"type"];
    
    _temLb.text = [bd.data.wendu stringValue];
    _maxTemLb.text = [tomorrow objectForKey:@"high"];
    _minTemLb.text=  [tomorrow objectForKey:@"low"];
    _wingLb.text = [tomorrow objectForKey:@"fengxiang"];
    _sickLb.text = bd.data.ganmao;
}


@end

