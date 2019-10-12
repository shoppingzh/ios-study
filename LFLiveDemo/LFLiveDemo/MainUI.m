//
//  MainUI.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/11.
//

#import "MainUI.h"
#import "LiveUI.h"

@interface MainUI ()

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)live:(id)sender {
    LiveUI *liveUI = [[LiveUI alloc] initWithLiveUrl:@"rtmp://218.17.142.4/oflaDemo/145459"];
    [self presentViewController:liveUI animated:YES completion:^{
        
    }];
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
