//
//  UIDevice+YJExtention.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (YJExtention)

/** 根据状态栏获取_网络状态 */
+ (NSString *)getNetWorkStates;

/** 获取手机当前的DNS地址 */
+ (NSArray *)getAllDNSServers;

/** 文件大小的计算转换为KB/MB/GB */
+ (NSString *)fileSizeWithOrginalSize:(CGFloat)orginalSize;

@end
