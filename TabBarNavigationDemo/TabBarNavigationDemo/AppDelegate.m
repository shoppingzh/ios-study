//
//  AppDelegate.m
//  TabBarNavigationDemo
//
//  Created by dascomsoft on 2019/1/31.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeUI.h"
#import "ProfileUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tb = [[UITabBarController alloc] init];
    
    // tab 1: home
    HomeUI *homeUI = [[HomeUI alloc] init];
    homeUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] tag:0];
    
    // tab 2: profile
    ProfileUI *pfUI = [[ProfileUI alloc] init];
    pfUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"me"] tag:1];
    UINavigationController *pfNav = [[UINavigationController alloc] initWithRootViewController:pfUI];
    pfNav.viewControllers = @[pfUI];
    
    // 设置nav bar样式
    // ..
    
    tb.viewControllers = @[homeUI, pfNav];
    
    // 设置tab bar样式
    // ...
    
    self.window.rootViewController = tb;
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
