//
//  LivePrepareUI.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import "LivePrepareUI.h"

@interface LivePrepareUI ()

@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *openCameraBtn;
@property (weak, nonatomic) IBOutlet UIButton *openMicroBtn;

@end

@implementation LivePrepareUI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_startBtn setContentEdgeInsets:UIEdgeInsetsMake(10, 50, 10, 50)];
    _startBtn.layer.cornerRadius = 20;
    
    
}


@end
