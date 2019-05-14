//
//  AppDelegate.m
//  qrCodeScan
//
//  Created by dascomsoft on 2019/2/20.
//  Copyright © 2019 Littlezheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MainUI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MainUI *mainUI = [[MainUI alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainUI];
    self.window.rootViewController = nav;
    
    return YES;
}


@end