//
//  LiveView.h
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import <UIKit/UIKit.h>
#import <LFLiveKit.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@protocol LiveViewDelegate <NSObject>

- (void)liveStopped;

@end

@interface LiveView : UIView

@property (nonatomic, strong) LFLiveSession *liveSession;
@property (copy, nonatomic) NSString *url;
@property (nonatomic, weak, nullable) id<LiveViewDelegate> delegate;

- (void)start;
- (void)stop;
- (void)addMessages:(NSArray<Message*>*) messages;

@end

NS_ASSUME_NONNULL_END
