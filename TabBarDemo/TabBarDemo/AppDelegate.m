//
//  AppDelegate.m
//  TabBarDemo
//
//  Created by dascomsoft on 2019/1/29.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeUI.h"
#import "WebViewUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tbVc = [[UITabBarController alloc] init];
    
    // tab 1
    HomeUI *homeUI = [[HomeUI alloc] initWithNibName:@"HomeUI" bundle:nil];
    homeUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"主页" image:[UIImage imageNamed:@"home"] tag:0];
    
    // tab 2
    WebViewUI *wvUI = [[WebViewUI alloc]init];
    wvUI.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"浏览器" image:[UIImage imageNamed:@"ex"] tag:1];
    
    tbVc.viewControllers = @[homeUI, wvUI];
    
    // tab bar栏样式修改
    UITabBar *tb =  tbVc.tabBar;
    tb.tintColor = [UIColor purpleColor];
    
    self.window.rootViewController = tbVc;
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
