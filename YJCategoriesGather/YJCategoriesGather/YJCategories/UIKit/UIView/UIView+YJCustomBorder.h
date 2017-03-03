//
//  UIView+YJCustomBorder.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  给视图添加自定义Border边框

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, YJExcludePointType) {
    YJExcludePointStart = 1 << 0,
    YJExcludePointEnd   = 1 << 1,
    YJExcludePointAll   = ~0UL    // 无符号长整型 0, ~表示按位取反, 即: 0xffff
};

@interface UIView (YJCustomBorder)

#pragma mark - Add Line
/** 顶部添加Border边框 无删除  */
- (void)yj_addTopBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Top 添加 边框 */
- (void)yj_addTopBorderWithColor:(UIColor *)color
                           width:(CGFloat)width
                   excludeLength:(CGFloat)length
                excludePointType:(YJExcludePointType)excludeType;

#pragma mark - Left
/** Left添加Border边框 无删除 */
- (void)yj_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Left添加Border边框 */
- (void)yj_addLeftBorderWithColor:(UIColor *)color
                            width:(CGFloat)width
                    excludeLength:(CGFloat)length
                 excludePointType:(YJExcludePointType)excludeType;

#pragma mark - Bottom
/** Bottom添加Border边框 无删除 */
- (void)yj_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Bottom添加Border边框 */
- (void)yj_addBottomBorderWithColor:(UIColor *)color
                              width:(CGFloat)width
                      excludeLength:(CGFloat)length
                   excludePointType:(YJExcludePointType)excludeType;

#pragma mark - Right
/** Right添加Border边框 无删除 */
- (void)yj_addRightBorderWithColor:(UIColor *)color width:(CGFloat)width;
/** Right添加Border边框 */
- (void)yj_addRightBorderWithColor:(UIColor *)color
                             width:(CGFloat)width
                     excludeLength:(CGFloat)length
                  excludePointType:(YJExcludePointType)excludeType;


#pragma mark - Remove
/** 移除顶部的Border */
- (void)yj_removeTopBorder;

/** 移除Left的Border */
- (void)yj_removeLeftBorder;

/** 移除Bottom的Border */
- (void)yj_removeBottomBorder;

/** 移除Right的Border */
- (void)yj_removeRightBorder;

@end
