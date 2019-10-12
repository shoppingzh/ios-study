//
//  LiveUI.h
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LiveUI : UIViewController

- (instancetype) initWithLiveUrl:(NSString *) liveUrl;

@property (nonatomic, copy, nonnull) NSString *liveUrl;

@end

NS_ASSUME_NONNULL_END
