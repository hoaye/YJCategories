//
//  UIView+YJConstraints.m
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJConstraints.h"

@implementation UIView (YJConstraints)

/** 左约束 */
- (NSLayoutConstraint *)leftConstraint{
    return [self constraintForAttribute:NSLayoutAttributeLeft];
}

/** 右边约束 */
- (NSLayoutConstraint *)rightConstraint{
    return [self constraintForAttribute:NSLayoutAttributeRight];
}

/** 顶部约束 */
- (NSLayoutConstraint *)topConstraint{
    return [self constraintForAttribute:NSLayoutAttributeTop];
}

/** 底部约束 */
- (NSLayoutConstraint *)bottomConstraint{
    return [self constraintForAttribute:NSLayoutAttributeBottom];
}

/** leading 约束 */
- (NSLayoutConstraint *)leadingConstraint{
    return [self constraintForAttribute:NSLayoutAttributeLeading];
}

/** 尾部约束 */
- (NSLayoutConstraint *)trailingConstraint{
    return [self constraintForAttribute:NSLayoutAttributeTrailing];
}

/** 宽度约束 */
- (NSLayoutConstraint *)widthConstraint{
    return [self constraintForAttribute:NSLayoutAttributeWidth];
}

/** 高度约束 */
- (NSLayoutConstraint *)heightConstraint{
    return [self constraintForAttribute:NSLayoutAttributeHeight];
}

/** 水平中心点约束 */
- (NSLayoutConstraint *)centerXConstraint{
    return [self constraintForAttribute:NSLayoutAttributeCenterX];
}

/** 竖直中心点约束 */
- (NSLayoutConstraint *)centerYConstraint{
    return [self constraintForAttribute:NSLayoutAttributeCenterY];
}

/** baseLine 约束 */
- (NSLayoutConstraint *)baseLineConstraint{
    return [self constraintForAttribute:NSLayoutAttributeBaseline];
}

/** 根据选择属性 返回 View 的约束 */
- (NSLayoutConstraint *)constraintForAttribute:(NSLayoutAttribute)attribute{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

@end
