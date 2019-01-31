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
    NSLog(@"tab bar view : %@", tbVc.view);
    
    
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


@end
