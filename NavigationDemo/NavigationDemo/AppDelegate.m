//
//  AppDelegate.m
//  NavigationDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "HelloUI.h"
#import "SecondUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *nav = [[UINavigationController alloc] init];
    
    HelloUI *helloUI = [[HelloUI alloc] init];
    helloUI.title = @"首页";
    
    nav.viewControllers = @[helloUI];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
