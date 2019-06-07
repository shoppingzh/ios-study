//
//  MainUI.m
//  ShakeDemo
//
//  Created by dascomsoft on 2019/6/7.
//

#import "MainUI.h"

@interface MainUI ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion began");
    _label.text = @"开始摇动";
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion ended");
    _label.text = @"结束摇动";
    // 随机颜色
    
    UIColor *bg = [UIColor colorWithRed:randFloat() green:randFloat() blue:randFloat() alpha:1];
    [self.view setBackgroundColor:bg];
}

float randFloat(){
    return (float)(arc4random()%100) / 100;
}



- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"motion cancelled");
    _label.text = @"摇动取消";
}

@end
