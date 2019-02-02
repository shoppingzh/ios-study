//
//  MainUI.m
//  HttpSimpleDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "MainUI.h"
#import "WeatherUI.h"

@interface MainUI ()
@property (weak, nonatomic) IBOutlet UITextField *cityInput;

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"天气查询";
    
}

- (IBAction)pressSearchBtn:(id)sender {
    if(!_cityInput.text || ![_cityInput.text length]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入城市！" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction: [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    WeatherUI *weatherUI = [[WeatherUI alloc] init];
    weatherUI.city = _cityInput.text;
    [self.navigationController pushViewController:weatherUI animated:YES];
}


@end
