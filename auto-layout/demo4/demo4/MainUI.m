//
//  MainUI.m
//  demo4
//
//  Created by dascomsoft on 2019/2/2.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "MainUI.h"

@interface MainUI ()
@property (weak, nonatomic) IBOutlet UILabel *lb;
@property (assign, nonatomic) BOOL flag;

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pressBtn:(id)sender {
    if(_flag){
        _lb.text = @"Understand how the app delegate manages your app's high-level behavior.";
    } else{
        _lb.text = @"UIKit apps are always in one of five states, which are shown in Figure 1. Apps start off not running. When the user explicitly launches the app, the app moves briefly to the inactive state before entering the active state. (An active app appears onscreen and is known as a foreground app.) Quitting an active app moves it offscreen and into the background state, where it stays until the system suspends it a short time later. At its discretion, the system may quietly terminate a suspended app, returning it to the not running state.";
    }
    _flag = !_flag;
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
