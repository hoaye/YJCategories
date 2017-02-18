//
//  UIView+YJConstraints.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJConstraints)

/** 左约束 */
- (NSLayoutConstraint *)leftConstraint;

/** 右边约束 */
- (NSLayoutConstraint *)rightConstraint;

/** 顶部约束 */
- (NSLayoutConstraint *)topConstraint;

/** 底部约束 */
- (NSLayoutConstraint *)bottomConstraint;

/** leading 约束 */
- (NSLayoutConstraint *)leadingConstraint;

/** 尾部约束 */
- (NSLayoutConstraint *)trailingConstraint;

/** 宽度约束 */
- (NSLayoutConstraint *)widthConstraint;

/** 高度约束 */
- (NSLayoutConstraint *)heightConstraint;

/** 水平中心点约束 */
- (NSLayoutConstraint *)centerXConstraint;

/** 竖直中心点约束 */
- (NSLayoutConstraint *)centerYConstraint;

/** baseLine 约束 */
- (NSLayoutConstraint *)baseLineConstraint;

/** 根据选择属性 返回 View 的约束 */
- (NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute;

@end
