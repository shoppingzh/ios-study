//
//  HelloUI.m
//  NavigationDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "HelloUI.h"
#import "SecondUI.h"

@interface HelloUI ()

@end

@implementation HelloUI

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressSecBtn:(id)sender {
    [self.navigationController pushViewController:[[SecondUI alloc] init] animated:YES];
}

@end
