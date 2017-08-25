//
//  UIScreen+YJFrame.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/8/25.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIScreen+YJFrame.h"

@implementation UIScreen (YJFrame)

+ (CGSize)yj_size{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)yj_width{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)yj_height{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)yj_orientationSize{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? yj_SizeSWAP([UIScreen yj_size]) : [UIScreen yj_size];
}

+ (CGFloat)yj_orientationWidth{
    return [UIScreen yj_orientationSize].width;
}

+ (CGFloat)yj_orientationHeight{
    return [UIScreen yj_orientationSize].height;
}

+ (CGSize)yj_DPISize{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}

/**
 *  交换高度与宽度
 */
static inline CGSize yj_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
