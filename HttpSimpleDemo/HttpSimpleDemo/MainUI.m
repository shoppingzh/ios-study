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
    WeatherUI *weatherUI = [[WeatherUI alloc] init];
    weatherUI.city = _cityInput.text;
    [self.navigationController pushViewController:weatherUI animated:YES];
}


@end
