//
//  AppDelegate.m
//  ios
//
//  Created by ivy.sun on 16/2/22.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /////开启友盟统计
//    [MobClick startWithAppkey:@"56d3c2e167e58e95420002c7" reportPolicy:SEND_ON_EXIT channelId:nil];
//    [MobClick setAppVersion:@"1.0"];

    
    //友盟授权
    [UMSocialData setAppKey:@"56d3c2e167e58e95420002c7"];
   

    //设置微信AppId，设置分享url，默认使用友盟的网址
//    [UMSocialWechatHandler setWXAppId:@"56d3c23d67e58e4ebd00182a" appSecret:@"" url:@"http://www.yshow.net"];
    
    
    
    //打开新浪微博的SSO开关
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1175972848" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    //设置分享到的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"1105214128" appKey:@"VW33mL3NDql8ifLB" url:@"http://sns.whalecloud.com"];
    
    
        //设置支持没有客户端情况下使用SSO授权
    [UMSocialQQHandler setSupportWebView:YES];
    
    
    return YES;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

@end
