//
//  NSString+URL.m
//  ios
//
//  Created by ivy.sun on 16/2/26.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)
- (NSString *)URLEncodedString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[] ",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
}


@end
