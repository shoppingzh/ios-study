//
//  AppDelegate.m
//  View
//
//  Created by dascomsoft on 2019/1/26.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[ViewController alloc]init];
    self.window.backgroundColor = [UIColor whiteColor];
    
    CGRect r = {100, 100, 200, 200};
    UIView *v = [[UIView alloc]initWithFrame:r];
    // 背景色
    v.backgroundColor = [UIColor purpleColor];
    // 可见性
    NSLog(@"视图是否可见：%@", v.isHidden ? @"否" : @"是");
    // 透明度
    v.alpha = 0.6;
    NSLog(@"视图透明度：%f", v.alpha);
    // 是否为不透明的
    NSLog(@"是否不透明：%@", v.isOpaque ? @"是" : @"否");
    // 色调
    v.tintColor = [UIColor blueColor];
    NSLog(@"视图色调：%@", v.tintColor);
    // 是否受限与父视图边界
    v.clipsToBounds = YES;
    NSLog(@"是否受限于父视图边界：%@", v.clipsToBounds ? @"是" : @"否");
    
    // 事件相关
    // 是否响应用户事件
    NSLog(@"是否响应用户事件：%@", v.isUserInteractionEnabled ? @"是" : @"否");
    // 是否同时可响应多个触摸事件
    NSLog(@"是否同时可响应多个触摸事件：%@", v.isMultipleTouchEnabled ? @"是" : @"否");
    // 是否阻止事件冒泡
    NSLog(@"是否阻止事件冒泡：%@", v.isExclusiveTouch ? @"是" : @"否");
    
    [self.window addSubview:v];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
