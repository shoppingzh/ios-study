//
//  AppDelegate.m
//  JavaScriptCoreDemo
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
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _window.rootViewController = [[WebUI alloc] init];
    [_window makeKeyAndVisible];
    return YES;
}


@end
