//
//  AppDelegate.m
//  WKWebView
//
//  Created by dascomsoft on 2019/2/12.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "WebUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[WebUI alloc] init];
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
