//
//  UIBarButtonItem+YJBadge.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YJBadge)

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


// Badge value to be display
@property (nonatomic) NSString *jk_badgeValue;
// Badge background color
@property (nonatomic) UIColor *jk_badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *jk_badgeTextColor;
// Badge font
@property (nonatomic) UIFont *jk_badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat jk_badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat jk_badgeMinSize;
// In case of numbers, remove the badge when reaching zero
@property BOOL jk_shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL jk_shouldAnimateBadge;

@end
