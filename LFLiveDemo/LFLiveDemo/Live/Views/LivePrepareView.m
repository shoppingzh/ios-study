//
//  LivePrepareView.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import "LivePrepareView.h"
#import <Masonry.h>
#import <AVKit/AVKit.h>

@interface LivePrepareView()

@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *openCameraBtn;
@property (nonatomic, strong) UIButton *openMicroBtn;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation LivePrepareView

- (instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.9];
        [self addSubview:self.startBtn];
        [self addSubview:self.openCameraBtn];
        [self addSubview:self.openMicroBtn];
        [self addSubview:self.closeBtn];
        [self addSubview:self.tipsLabel];
        [self layoutViews];
        
        // 检查摄像头与麦克风的权限
        [self checkAuth];
    }
    
    return self;
}

- (void) layoutViews{
    [self.startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).with.offset(-60);
    }];
    [self.openCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.startBtn.mas_bottom).with.offset(60);
    }];
    [self.openMicroBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.openCameraBtn.mas_bottom).with.offset(20);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.mas_safeAreaLayoutGuideLeft).with.offset(5);
        } else {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).with.offset(5);
        }
    }];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom).with.offset(-20);
        }else{
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
        }
    }];
}

#pragma mark - getter setter

- (UIButton *)startBtn{
    if(!_startBtn){
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setTitle:@"开启直播" forState:UIControlStateNormal];
        [_startBtn setBackgroundColor:[UIColor colorWithRed:0 green:.59375 blue:.9335 alpha:1]];
        _startBtn.tintColor = [UIColor whiteColor];
        [_startBtn setContentEdgeInsets:UIEdgeInsetsMake(10, 50, 10, 50)];
        _startBtn.layer.cornerRadius = 20;
        
        [_startBtn addTarget:self action:@selector(pressStartLiveBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIButton *)openCameraBtn{
    if(!_openCameraBtn){
        _openCameraBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_openCameraBtn setTitle:@"开启摄像头权限" forState:UIControlStateNormal];
        [self setupMiniButton:_openCameraBtn];
        [_openCameraBtn addTarget:self action:@selector(authCamera:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openCameraBtn;
}

- (UIButton *)openMicroBtn{
    if(!_openMicroBtn){
        _openMicroBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_openMicroBtn setTitle:@"打开麦克风权限" forState:UIControlStateNormal];
        [self setupMiniButton:_openMicroBtn];
        [_openMicroBtn addTarget:self action:@selector(authMicro:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _openMicroBtn;
}

- (UIButton *)closeBtn{
    if(!_closeBtn){
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        UIFont *font = [UIFont fontWithName:@"suite" size:32];
        _closeBtn.titleLabel.font = font;
        [_closeBtn setTitle:@"\U0000e627" forState:UIControlStateNormal];
        _closeBtn.tintColor = [UIColor whiteColor];
        // 为了更好触碰，增加一个内边距
        [_closeBtn setContentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [_closeBtn addTarget:self action:@selector(pressCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UILabel *)tipsLabel{
    if(!_tipsLabel){
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.font = [UIFont fontWithName:@"suite" size:12];
        _tipsLabel.textColor = [UIColor grayColor];
        _tipsLabel.text = @"\U0000e66a 第一次启动等待的时间较长，请您耐心等待";
    }
    
    return _tipsLabel;
}

#pragma mark - APIs

- (void)setTitle:(NSString *)title{
    _title = title;
    [self.startBtn setTitle:title forState:UIControlStateNormal];
}

#pragma mark - 检查权限

- (void) checkAuth{
    AVAuthorizationStatus videoStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(videoStatus == AVAuthorizationStatusAuthorized){
        [self.openCameraBtn setEnabled:NO];
        [self.openCameraBtn setTitle:@"\U0000e60a 开启摄像头权限" forState:UIControlStateNormal];
    }else{
        [self.openCameraBtn setEnabled:YES];
        [self.openCameraBtn setTitle:@"开启摄像头权限" forState:UIControlStateNormal];
    }
    AVAuthorizationStatus audioStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if(audioStatus == AVAuthorizationStatusAuthorized){
        [self.openMicroBtn setEnabled:NO];
        [self.openMicroBtn setTitle:@"\U0000e60a 开启麦克风权限" forState:UIControlStateNormal];
    }else{
        [self.openMicroBtn setEnabled:YES];
        [self.openMicroBtn setTitle:@"开启麦克风权限" forState:UIControlStateNormal];
    }
    
    if(videoStatus != AVAuthorizationStatusAuthorized || audioStatus != AVAuthorizationStatusAuthorized){
        [self.startBtn setEnabled:NO];
        self.startBtn.alpha = .5;
    }else{
        [self.startBtn setEnabled:YES];
        self.startBtn.alpha = 1;
    }
}

// 小按钮统一设置样式
- (void) setupMiniButton:(UIButton*) btn{
    btn.titleLabel.font = [UIFont fontWithName:@"suite" size:16];
}


#pragma mark - 事件处理

- (IBAction)authCamera:(id)sender{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(status == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self checkAuth];
            });
        }];
    }else if(status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied){
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
}

- (IBAction)authMicro:(id)sender{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if(status == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self checkAuth];
            });
        }];
    }else if(status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied){
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
    }
}

- (IBAction)pressStartLiveBtn:(id)sender{
    if(_delegate && [_delegate respondsToSelector:@selector(willStartLive)]){
        [_delegate willStartLive];
    }
}

- (IBAction)pressCloseBtn:(id)sender{
    if(_delegate && [_delegate respondsToSelector:@selector(willClose)]){
        [_delegate willClose];
    }
}


@end
