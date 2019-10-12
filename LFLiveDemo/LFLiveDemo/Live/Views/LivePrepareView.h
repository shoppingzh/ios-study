//
//  LivePrepareView.h
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 代理
@protocol LivePrepareViewDelegates <NSObject>

@required
- (void) willStartLive;
- (void) willClose;

@end


@interface LivePrepareView : UIView

@property (nonatomic, weak, nullable) id<LivePrepareViewDelegates> delegate;
@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
