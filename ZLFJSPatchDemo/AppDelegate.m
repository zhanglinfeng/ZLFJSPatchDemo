//
//  AppDelegate.m
//  ZLFJSPatchDemo
//
//  Created by 张林峰 on 15/9/28.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"

@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //[JSPatch startWithAppKey:@"85e0ce73a8c045c8"];// 从网络拉回js脚本执行时使用这种方式
//    [JSPatch testScriptInBundle];//测试本地js用这种方式
    [JPEngine startEngine];

    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
    if (sourcePath) {
        NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
        [JPEngine evaluateScript:script];
    }

    
    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.window addSubview:[self genView]];
//    [self.window makeKeyAndVisible];
    return YES;
}

//- (UIView *)genView
//{
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//    view.backgroundColor = [UIColor greenColor];
//    return view;
//}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
