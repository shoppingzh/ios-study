//
//  LiveView.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import "LiveView.h"
#import <LFLiveKit.h>
#import <Masonry.h>
#import "MessageTableViewCell.h"

#define REUSE_CELL_NAME @"messsageCell"

@interface LiveView() <LFLiveSessionDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *flipBtn;
@property (nonatomic, strong) UIButton *beautyBtn;
@property (nonatomic, strong) UITableView *messageTableView;

// Attributes
@property (nonatomic, strong, nonnull) NSMutableArray<Message*> *messages;

@end

@implementation LiveView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.85];
        [self addSubview:self.closeBtn];
        [self addSubview:self.flipBtn];
        [self addSubview:self.beautyBtn];
        [self addSubview:self.messageTableView];
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews{
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(self.mas_safeAreaLayoutGuideLeft).with.offset(5);
        } else {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).with.offset(5);
        }
    }];
    [self.flipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop).with.offset(5);
            make.right.equalTo(self.mas_safeAreaLayoutGuideRight).with.offset(-15);
        }else{
            make.top.equalTo(self.mas_top).with.offset(5);
            make.right.equalTo(self.mas_right).with.offset(-15);
        }
    }];
    [self.beautyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.flipBtn.mas_left).with.offset(-15);
        make.centerY.equalTo(self.flipBtn.mas_centerY);
    }];
    [self.messageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(self.mas_safeAreaLayoutGuideBottom).with.offset(-10);
        }else{
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        }
        make.height.equalTo(self.mas_height).multipliedBy(.4);
    }];
}

#pragma mark - APIs

- (void)setUrl:(NSString *)url{
    _url = url;
}

- (void)start{
    LFLiveStreamInfo *si = [LFLiveStreamInfo new];
    si.url = self.url;
    [self.liveSession startLive:si];
    self.liveSession.running = YES;
}

- (void)stop{
    [self.liveSession stopLive];
    self.liveSession.running = NO;
}

- (void)addMessages:(NSArray<Message *> *)messages{
    [self.messages addObjectsFromArray:messages];
    [self.messageTableView reloadData];
    
}

#pragma mark - getter setter

- (LFLiveSession *)liveSession{
    if(!_liveSession){
        LFLiveVideoConfiguration *videoConfig = [LFLiveVideoConfiguration defaultConfiguration];
        LFLiveAudioConfiguration *audioConfig = [LFLiveAudioConfiguration defaultConfiguration];
        // 设置参数
        _liveSession = [[LFLiveSession alloc] initWithAudioConfiguration:audioConfig videoConfiguration:videoConfig captureType:LFLiveCaptureDefaultMask];
        _liveSession.preView = self;
        _liveSession.beautyFace = YES;
        _liveSession.beautyLevel = 1;
        _liveSession.showDebugInfo = NO;
        _liveSession.captureDevicePosition = AVCaptureDevicePositionBack;
    }
    
    return _liveSession;
}

- (UIButton *)closeBtn{
    if(!_closeBtn){
        _closeBtn = [[UIButton alloc] init];
        _closeBtn.titleLabel.font = [UIFont fontWithName:@"suite" size:32];
        [_closeBtn setContentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        [_closeBtn setTitle:@"\U0000e627" forState:UIControlStateNormal];
        _closeBtn.tintColor = [UIColor whiteColor];
        [_closeBtn addTarget:self action:@selector(stopLive:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _closeBtn;
}

- (UIButton *)flipBtn{
    if(!_flipBtn){
        _flipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self setupOperationBtn:_flipBtn];
        [_flipBtn setTitle:@"\U0000e655" forState:UIControlStateNormal];
        [_flipBtn addTarget:self action:@selector(flipCamera:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _flipBtn;
}

- (UIButton *)beautyBtn{
    if(!_beautyBtn){
        _beautyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self setupOperationBtn:_beautyBtn];
        [_beautyBtn setTitle:@"\U0000e609" forState:UIControlStateNormal];
        [_beautyBtn addTarget:self action:@selector(toggleBeauty:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _beautyBtn;
}

- (UITableView *)messageTableView{
    if(!_messageTableView){
        _messageTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _messageTableView.dataSource = self;
        _messageTableView.delegate = self;
        _messageTableView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _messageTableView.allowsSelection = NO;
        _messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_messageTableView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:REUSE_CELL_NAME];
    }
    return _messageTableView;
}

- (NSMutableArray<Message *> *)messages{
    if(!_messages){
        _messages = [[NSMutableArray alloc] init];
    }
    return _messages;
}

// 操作图标按钮通用设置
- (void) setupOperationBtn:(UIButton*) btn{
    btn.titleLabel.font = [UIFont fontWithName:@"suite" size:28];
    btn.tintColor = [UIColor whiteColor];
}

#pragma mark - 事件处理

- (IBAction)stopLive:(id)sender{
    [self stop];
    if(_delegate && [_delegate respondsToSelector:@selector(liveStopped)]){
        [_delegate liveStopped];
    }
}

- (IBAction)flipCamera:(id)sender{
    AVCaptureDevicePosition pos = self.liveSession.captureDevicePosition;
    if(pos == AVCaptureDevicePositionFront){
        self.liveSession.captureDevicePosition = AVCaptureDevicePositionBack;
    }else{
        self.liveSession.captureDevicePosition = AVCaptureDevicePositionFront;
    }
}

- (IBAction)toggleBeauty:(id)sender{
    BOOL setting = !self.liveSession.beautyFace;
    self.liveSession.beautyFace = setting;
    // 设置按钮样式
    NSLog(@"美颜是否开启：%d", setting);
    if(setting){
        [self.beautyBtn setTitle:@"\U0000e609" forState:UIControlStateNormal];
    }else{
        [self.beautyBtn setTitle:@"\U0000e60b" forState:UIControlStateNormal];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageTableViewCell *cell = [self.messageTableView dequeueReusableCellWithIdentifier:REUSE_CELL_NAME forIndexPath:indexPath];
    cell.message = [self.messages objectAtIndex:indexPath.row];
    return cell;
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}

@end
