//
//  AppDelegate.m
//  PdfDemo
//
//  Created by 满 陈 on 2017/5/25.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "AppDelegate.h"
#import <objc/runtime.h>
#import "QLViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    unsigned int count;// 记录属性个数
    Ivar *properties = class_copyIvarList([NSURL class], &count);
    // 生成一个属性名称组成的数组
    NSMutableArray *propertyNameArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        Ivar property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = ivar_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [propertyNameArray addObject:name];
    }
    NSLog(@"排序前的属性列表 = %@",propertyNameArray);
    
    NSComparator cmptr = ^(NSString *obj1, NSString *obj2){
        return [obj1 compare:obj2 options:NSLiteralSearch];
    };
    NSArray *afterSort = [propertyNameArray sortedArrayUsingComparator:cmptr];
    NSLog(@"排序后的属性列表 = %@",afterSort);
    
    free(properties);
    
    
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
