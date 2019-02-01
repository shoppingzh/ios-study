//
//  WeatherUI.h
//  HttpSimpleDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherUI : UIViewController

@property NSString *city;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *temLb;
@property (weak, nonatomic) IBOutlet UILabel *maxTemLb;
@property (weak, nonatomic) IBOutlet UILabel *minTemLb;
@property (weak, nonatomic) IBOutlet UILabel *wingLb;
@property (weak, nonatomic) IBOutlet UILabel *sickLb;

@end
