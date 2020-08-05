//
//  AppDelegate.h
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

