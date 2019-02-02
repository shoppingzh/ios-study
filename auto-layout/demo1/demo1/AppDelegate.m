//
//  AppDelegate.m
//  demo1
//
//  Created by dascomsoft on 2019/2/2.
//  Copyright © 2019年 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MainUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MainUI *mainUI = [[MainUI alloc] init];
    
    self.window.rootViewController = mainUI;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
