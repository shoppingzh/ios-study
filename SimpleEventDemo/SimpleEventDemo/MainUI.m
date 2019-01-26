//
//  MainUI.m
//  SimpleEventDemo
//
//  Created by dascomsoft on 2019/1/26.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "MainUI.h"

@interface MainUI ()

@property (weak, nonatomic) IBOutlet UILabel *label;

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

- (IBAction)click:(id)sender {
    NSString *text = self.label.text;
    if([@"Hello, world!" isEqualToString:text]){
        self.label.text = @"你好，世界！";
    } else{
        self.label.text = @"Hello, world!";
    }
    
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
