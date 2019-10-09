//
//  HttpUtil.h
//  afDownload
//
//  Created by xpzheng on 2019/10/9.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpUtil : NSObject

+ (void) download:(NSString*) url destination:(NSURL* (^) (NSURL *targetPath, NSURLResponse *response)) destination progress:(void(^) (NSProgress* downloadProgress)) progress completion: (void(^) (NSURLResponse *response, NSURL *filePath, NSError *error)) completion;

@end

NS_ASSUME_NONNULL_END
