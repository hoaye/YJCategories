//
//  UIBarButtonItem+YJBadge.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YJBadge)

@property (nonatomic, copy) NSString *badgeValue; /**< 显示数值 */

@property (nonatomic, strong) UILabel  *yj_badgeLabel; /**< 角标 */
@property (nonatomic, assign) CGFloat   yj_badgeOriginX; /**< 原坐标x */
@property (nonatomic, assign) CGFloat   yj_badgeOriginY; /**< 原坐标y */
@property (nonatomic, strong) UIColor  *yj_badgeBgColor; /**< 背景色 */
@property (nonatomic, strong) UIColor  *yj_badgeTextColor; /**< 字体色 */
@property (nonatomic, strong) UIFont   *yj_badgeFont; /**< 字体 */
@property (nonatomic, assign) CGFloat   yj_badgePadding; /**< Padding */
@property (nonatomic, assign) CGFloat   yj_badgeMinHeight; /**< MinHeight */

@property (nonatomic, assign) BOOL      yj_hideBadgeWhenZero; /**< 为0时隐藏 */
@property (nonatomic, assign) BOOL      yj_animateBadgeEnable; /**< 当数值变化时是否动画 */

@end
