//
//  UIScreen+YJFrame.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/8/25.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (YJFrame)

+ (CGSize)yj_size;

+ (CGFloat)yj_width;
+ (CGFloat)yj_height;

+ (CGSize)yj_orientationSize;
+ (CGFloat)yj_orientationWidth;
+ (CGFloat)yj_orientationHeight;
+ (CGSize)yj_DPISize;

@end
