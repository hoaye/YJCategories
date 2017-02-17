//
//  UIDevice+YJExtention.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import "UIDevice+YJExtention.h"

@implementation UIDevice (YJExtention)

+ (NSString *)getNetWorkStates{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = @"无网络";
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
    return state;
}

@end
