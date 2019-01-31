//
//  ProfileUI.m
//  TabBarNavigationDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "ProfileUI.h"
#import "HappyUI.h"

@interface ProfileUI ()

@end

@implementation ProfileUI

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    
}

- (IBAction)pressOpenBtn:(id)sender {
    HappyUI *happyUI = [[HappyUI alloc] init];
    happyUI.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:happyUI animated:YES];
}

@end
