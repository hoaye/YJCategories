//
//  UIView+YJCornerRadius.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/7/31.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJCornerRadius)

/**
 设置圆角

 @param rectCorner 圆角类型
 @param cornerRadius 圆角度数
 */
- (void)yj_setCornerWithRectCorner:(UIRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius;

@end
