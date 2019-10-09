//
//  HttpUtil.m
//  afDownload
//
//  Created by xpzheng on 2019/10/9.
//

#import "HttpUtil.h"

@implementation HttpUtil


+ (void)download:(NSString *)url destination:(NSURL * _Nonnull (^)(NSURL * _Nonnull, NSURLResponse * _Nonnull))destination progress:(void (^)(NSProgress * _Nonnull))progress completion:(void (^)(NSURLResponse * _Nonnull, NSURL * _Nonnull, NSError * _Nonnull))completion{
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return destination(targetPath, response);
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        completion(response, filePath, error);
    }];
    [task resume];
    
}

@end
