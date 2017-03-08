//
//  UINavigationBar+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (YJSuperExt)

@property (nonatomic, strong) UIView *yj_overlayView; /**< 导航条颜色视图 */

/** 导航栏设置背景颜色 */
- (void)yj_setBackgroundColor:(UIColor *)backgroundColor;

/** 修改导航栏的位置 */
- (void)yj_setTranslationY:(CGFloat)translationY;

/** 设置添加视图的透明度 */
- (void)yj_setElementsAlpha:(CGFloat)alpha;

/** 重新设置初始化 */
- (void)yj_reset;


@end
