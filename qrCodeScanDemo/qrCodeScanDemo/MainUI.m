//
//  MainUI.m
//  qrCodeScanDemo
//
//  Created by dascomsoft on 2019/2/21.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "MainUI.h"
#import "QrCodeScanUI.h"

@interface MainUI ()

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)scan:(id)sender {
    QrCodeScanUI *scanUI = [[QrCodeScanUI alloc] init];
    scanUI.isOpenInterestRect = YES;
    scanUI.libraryType = SLT_Native;
    scanUI.scanCodeType = SCT_QRCode;
    
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 44;
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 3;
    style.photoframeAngleW = 18;
    style.photoframeAngleH = 18;
    style.isNeedShowRetangle = NO;
    
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //qq里面的线条图片
    UIImage *imgLine = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
    style.animationImage = imgLine;
    
    style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    scanUI.style = style;
    
    [self.navigationController pushViewController:scanUI animated:YES];
}
@end
