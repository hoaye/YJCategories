//
//  UIViewController+YJFullScreenSupport.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  本类通过修改系统控件的Frame, 以便支持满屏

#import <UIKit/UIKit.h>

@interface UIViewController (YJFullScreenSupport)

/** 显示导航栏 */
- (void)yj_showNavigationBar:(BOOL)animated;

/** 隐藏导航栏 */
- (void)yj_hideNavigationBar:(BOOL)animated;

/** 移动导航栏 */
- (void)yj_moveNavigtionBar:(CGFloat)deltaY animated:(BOOL)animated;

/** 设置导航栏起始位置 */
- (void)yj_setNavigationBarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration;


/** 显示Toolbar */
- (void)yj_showToolbar:(BOOL)animated;

/** 隐藏ToolBar */
- (void)yj_hideToolbar:(BOOL)animated;

/** 移动ToolBar */
- (void)yj_moveToolbar:(CGFloat)deltaY animated:(BOOL)animated;

/** 设置ToolBar起始位置 */
- (void)yj_setToolbarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration;


/** 显示TabBar */
- (void)yj_showTabBar:(BOOL)animated;

/** 隐藏TabBar */
- (void)yj_hideTabBar:(BOOL)animated;

/** 移动TabBar */
- (void)yj_moveTabBar:(CGFloat)deltaY animated:(BOOL)animated;

/** 设置TabBar起始位置 */
- (void)yj_setTabBarOriginY:(CGFloat)y animated:(BOOL)animated duration:(NSTimeInterval)duration;

@end
