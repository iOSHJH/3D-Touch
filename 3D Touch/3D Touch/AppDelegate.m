//
//  AppDelegate.m
//  3D Touch
//
//  Created by WONG on 2017/1/5.
//  Copyright © 2017年 yunshi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self creatUIApplicationShortcutItems];

    return YES;
}

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

/***  3D Touch：点击快捷菜单调用*/
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    if (shortcutItem)
    {
        if (shortcutItem.userInfo)
        {
            NSLog(@"%@",shortcutItem.userInfo[@"url"]);
        }
    }
    
    if (completionHandler)
    {
        completionHandler(YES);
    }
}

-(void)creatUIApplicationShortcutItems
{
    //创建快捷item的icon 即UIApplicationShortcutItemIconFile
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"money"];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"gouwuche"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"wode"];
    
    //创建快捷item的userinfo 即UIApplicationShortcutItemUserInfo
    NSDictionary *info1 = @{@"url":@"money"};
    NSDictionary *info2 = @{@"url":@"gouWuche"};
    NSDictionary *info3 = @{@"url":@"wode"};
    
    //创建ShortcutItem
    UIMutableApplicationShortcutItem *item1 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.moneyPage" localizedTitle:@"资产" localizedSubtitle:@"这是资产" icon:icon1 userInfo:info1];
    UIMutableApplicationShortcutItem *item2 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.shopPage" localizedTitle:@"购物车" localizedSubtitle:@"这是购物车" icon:icon2 userInfo:info2];
    UIMutableApplicationShortcutItem *item3 = [[UIMutableApplicationShortcutItem alloc]initWithType:@"3dtouch.mypage" localizedTitle:@"我的" localizedSubtitle:@"这是我的" icon:icon3 userInfo:info3];
    
    //把原有的shortcutItems拿出来，把动态的放进去
    NSArray *items = @[item1, item2, item3];
    NSArray *existingItems = [UIApplication sharedApplication].shortcutItems;
    NSArray *updatedItems = [existingItems arrayByAddingObjectsFromArray:items];
    
    //
    [UIApplication sharedApplication].shortcutItems = updatedItems;
}


@end
