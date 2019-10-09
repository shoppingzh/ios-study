//
//  LocationFinder.h
//  locationFindDemo
//
//  Created by xpzheng on 2019/9/27.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LocationFindResult){
    // 成功
    LocationFindSuccess = 0,
    // 未知错误
    LocationFindUnknownError = 1,
    // 没有定位权限
    LocationFindNoPermissionError = 2,
    // 位置解析错误
    LocationFindParseError = 3
};

@interface LocationFinder : NSObject

- (void) find:(void(^)(LocationFindResult error, Location *location)) completion;

@end


NS_ASSUME_NONNULL_END
