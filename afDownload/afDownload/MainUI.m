//
//  MainUI.m
//  afDownload
//
//  Created by xpzheng on 2019/10/8.
//

#import "MainUI.h"
#import "HttpUtil.h"

@interface MainUI ()

@property (weak, nonatomic) IBOutlet UITextField *sourceTf;

@end

@implementation MainUI

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)download:(id)sender {
    NSURL *destination = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    [HttpUtil download:_sourceTf.text destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [destination URLByAppendingPathComponent:response.suggestedFilename];
    } progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"当前进度：%@", downloadProgress);
    } completion:^(NSURLResponse * _Nonnull response, NSURL * _Nonnull filePath, NSError * _Nonnull error) {
        NSLog(@"filePath: %@", filePath);
        NSLog(@"response: %@", response);
        NSLog(@"error: %@", error);
    }];
    
}

@end
