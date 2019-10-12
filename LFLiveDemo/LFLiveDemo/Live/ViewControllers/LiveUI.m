//
//  LiveUI.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import "LiveUI.h"
#import <LFLiveKit.h>
#import <Masonry.h>
#import <AFNetworking.h>
#import "LiveView.h"
#import "LivePrepareView.h"


@interface LiveUI () <LivePrepareViewDelegates, LFLiveSessionDelegate, LiveViewDelegate>

@property (nonatomic, strong) LiveView *liveView;
@property (nonatomic, strong) LivePrepareView *livePrepareView;

@end

@implementation LiveUI

- (instancetype)initWithLiveUrl:(NSString *)liveUrl{
    if(self = [super init]){
        self.liveUrl = liveUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.liveView];
    [self.view addSubview:self.livePrepareView];
    
    // layout
    NSArray<UIView*> *subViews = self.view.subviews;
    if(subViews && subViews.count){
        for(UIView *subView in subViews){
            [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top);
                make.right.equalTo(self.view.mas_right);
                make.bottom.equalTo(self.view.mas_bottom);
                make.left.equalTo(self.view.mas_left);
            }];
        }
    }
    
//    for(NSUInteger i = 0;i<100;i++){
//        Message *msg = [Message new];
//        msg.name = @"老郑头";
//        msg.content = [@"那女孩对我说，说我保护她的梦，说这个世界，对她这样的不多，我渐渐杰弗里斯吉利服聚少离多雷锋精神了杰弗里斯讲道理就斐林试剂连接冯老师 两节课发大水了废旧塑料看呆了" stringByAppendingString:[NSString stringWithFormat:@"%ld", i]];
//        NSArray *messages = [[NSArray alloc] initWithObjects:msg, nil];
//        [self.liveView addMessages:messages];
//    }
    
//    __block NSUInteger count = 0;
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"执行");
//
//        Message *msg = [Message new];
//        msg.name = @"老郑头";
//        msg.content = [@"那女孩对我说，说我保护她的梦" stringByAppendingString:[NSString stringWithFormat:@"%ld", count]];
//        NSArray *messages = [[NSArray alloc] initWithObjects:msg, nil];
//        [self.liveView addMessages:messages];
//
//        count++;
//    }];
//
//    [timer fire];
}

#pragma mark - APIs

- (void)setLiveUrl:(NSString *)liveUrl{
    _liveUrl = liveUrl;
    self.liveView.url = liveUrl;
}

#pragma mark - getter setter

- (LiveView *)liveView{
    if(!_liveView){
        _liveView = [[LiveView alloc] init];
        _liveView.delegate = self;
        _liveView.url = self.liveUrl;
        _liveView.liveSession.delegate = self;
    }
    return _liveView;
}

- (LivePrepareView *)livePrepareView{
    if(!_livePrepareView){
        _livePrepareView = [[LivePrepareView alloc] init];
        _livePrepareView.delegate = self;
    }
    return _livePrepareView;
}

#pragma mark - LiveViewPrepareDelegate

- (void)willStartLive{
    [self.liveView start];
}

- (void)willClose{
    [self.liveView stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - LFLiveSessionDelegate

- (void)liveSession:(LFLiveSession *)session liveStateDidChange:(LFLiveState)state{
    switch (state) {
        case LFLivePending:
            [self.livePrepareView setTitle:@"正在开始..."];
            break;
        case LFLiveStart:
            [self liveRunning];
            break;
        case LFLiveRefresh:
            [self.livePrepareView setTitle:@"重试中..."];
            break;
        case LFLiveError:
            break;
        default:
            break;
    }
}

#pragma mark - LiveViewDelegate

- (void)liveStopped{
    [self willClose];
}

#pragma mark - 修改状态栏颜色为亮色

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)liveRunning{
    [self.livePrepareView removeFromSuperview];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://192.168.1.110:8080/suite/appLive/message_list.do" parameters:@{@"chatroom": @"145460"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"接收到的内容：%@", responseObject);
        if(responseObject[@"success"]){
            NSArray *data = responseObject[@"data"];
            if(data && data.count){
                NSMutableArray<Message*> *newMessages = [[NSMutableArray alloc] init];
                for(NSDictionary *dic in data){
                    Message *msg = [Message new];
                    msg.name = dic[@"username"];
                    msg.content = dic[@"text"];
                    [newMessages addObject:msg];
                }
                NSLog(@"新消息：%@", newMessages);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.liveView addMessages:newMessages];
                });
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@", error);
    }];
    
}

@end
