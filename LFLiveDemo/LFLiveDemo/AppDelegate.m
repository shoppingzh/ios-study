//
//  AppDelegate.m
//  LFLiveDemo
//
//  Created by xpzheng on 2019/10/10.
//

#import "AppDelegate.h"
#import "MainUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[MainUI alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
