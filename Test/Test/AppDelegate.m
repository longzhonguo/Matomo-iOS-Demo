//
//  AppDelegate.m
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

#import "AppDelegate.h"
#import <MatomoTracker-Swift.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    MatomoTracker *matomoTracker = [[MatomoTracker alloc] initWithSiteId:@"6" baseURL:[NSURL URLWithString:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"] userAgent:@""];
//        [matomoTracker trackWithView:@[@"DPCViewController"] url:[NSURL URLWithString:@"/trackView-DPCVC"]];
//        [matomoTracker trackWithEventWithCategory:@"事件分类1" action:@"事件行为1" name:@"name1" number:[NSNumber numberWithInt:1] url:[NSURL URLWithString:@"/trackWithEvent-1"]];
//        [matomoTracker trackWithEventWithCategory:@"事件分类2" action:@"事件行为2" name:@"name2" number:[NSNumber numberWithInt:2] url:[NSURL URLWithString:@"/trackWithEvent-2"]];
//        [matomoTracker trackSearchWithQuery:@"搜索词关键词1" category:@"事件分类1" resultCount:15 url:[NSURL URLWithString:@"/trackSearch-1"]];
//        [matomoTracker dispatch]; // applicationDidEnterBackground方法中手动调用，用来上传数据
//        matomoTracker.logger = [[DefaultLogger alloc] initWithMinLevel:LogLevelVerbose]; // 日志类型：全部
////        [matomoTracker trackCampaignWithName:@"campaign_name" keyword:@"campaign_keyword"];
//        matomoTracker.userId = @"Jared CHAN";
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Test"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
