//
//  HomeUI.m
//  TabBarDemo
//
//  Created by dascomsoft on 2019/1/29.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "HomeUI.h"

@interface HomeUI ()
@property (weak, nonatomic) IBOutlet UILabel *tipsLb;

@end

@implementation HomeUI

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"HomeUI加载");
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)pressOpenBtn:(id)sender {
    self.tipsLb.text = @"新年快乐！";
    self.tipsLb.textAlignment = NSTextAlignmentCenter;
    
    self.openBtn.enabled = NO;
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
