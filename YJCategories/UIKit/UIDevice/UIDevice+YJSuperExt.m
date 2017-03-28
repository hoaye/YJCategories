//
//  UIDevice+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIDevice+YJSuperExt.h"
#import <resolv.h>
#import <arpa/inet.h>

@implementation UIDevice (YJSuperExt)

+ (NSString *)getNetWorkStates{
    
    NSString *state = nil;
    if ([UIApplication resolveClassMethod:@selector(sharedApplication)]) {
        UIApplication *app = [UIApplication sharedApplication];
        NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
        int netType = 0;
        // 获取到网络返回码
        for (id child in children) {
            if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
                netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];  // 获取到状态栏
                
                switch (netType) {
                    case 0:
                        state = @"无网络";// 无网模式
                        break;
                    case 1:
                        state = @"2G";
                        break;
                    case 2:
                        state = @"3G";
                        break;
                    case 3:
                        state = @"4G";
                        break;
                    case 5:{
                        state = @"WIFI";
                    }
                        break;
                    default:
                        break;
                }
            }
        }
    }
    return state;
}

/** 获取手机的DNS地址 */
+ (NSArray *)getAllDNSServers{
    
    NSMutableArray *addresses = [NSMutableArray array];
    res_state res = malloc(sizeof(struct __res_state));
    int result = res_ninit(res);
    
    if (result == 0){
        for (int i = 0; i < res->nscount; i++){
            NSString *s = [NSString stringWithUTF8String:inet_ntoa(res->nsaddr_list[i].sin_addr)];
            [addresses addObject:s];
        }
    }
    return addresses;
}

+ (NSString *)fileSizeWithOrginalSize:(CGFloat)orginalSize{
    
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;
    
    if (orginalSize < 10.0f){
        return @"0B";
    }else if (orginalSize < KB){
        return @"< 1KB";
    }else if (orginalSize < MB){
        return [NSString stringWithFormat:@"%.1fK",((CGFloat)orginalSize)/KB];
    }else if (orginalSize < GB){
        return [NSString stringWithFormat:@"%.1fM",((CGFloat)orginalSize)/MB];
    }else{
        return [NSString stringWithFormat:@"%.1fG",((CGFloat)orginalSize)/GB];
    }
}

/** 获取设备UUID */
+ (NSString *)yj_UUID{
    if([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0){
        return  [[NSUUID UUID] UUIDString];
    }else{
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        return (__bridge_transfer NSString *)uuid;
    }
}

@end
