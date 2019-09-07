//
//  AppDelegate.m
//  WebViewTargetDemo
//
//  Created by xpzheng on 2019/9/7.
//  Copyright © 2019 xpzheng. All rights reserved.
//

#import "AppDelegate.h"
#import "WebUI.h"
#import "OldWebUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabUI = [[UITabBarController alloc] init];
    WebUI *webUI = [[WebUI alloc] init];
    OldWebUI *oldWebUI = [[OldWebUI alloc] init];
    webUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"WkWebView" image:nil tag:0];
    oldWebUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"UIWebView" image:nil tag:1];
    tabUI.viewControllers = @[webUI, oldWebUI];
    
    
    self.window.rootViewController = tabUI;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
