//
//  AppDelegate.m
//  ios
//
//  Created by ivy.sun on 16/2/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MobClick startWithAppkey:@"56d3c23d67e58e4ebd00182a" reportPolicy:BATCH   channelId:@"MYMAC"];
    return YES;
}

@end
