//
//  UIView+YJBadge.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJBadge.h"
#import <objc/runtime.h>

static char const *const kUIViewBadegeLabelKey             = "kUIViewBadegeLabelKey";
static char const *const kUIViewBadegeOriginXKey           = "kUIViewBadegeOriginXKey";
static char const *const kUIViewBadegeOriginYKey           = "kUIViewBadegeOriginYKey";
static char const *const kUIViewBadegeValueKey             = "kUIViewBadegeValueKey";
static char const *const kUIViewBadegeBgColorKey           = "kUIViewBadegeBgColorKey";
static char const *const kUIViewBadegeTextColorKey         = "kUIViewBadegeTextColorKey";
static char const *const kUIViewBadegeTextFontKey          = "kUIViewBadegeTextFontKey";
static char const *const kUIViewBadegeXPaddingKey          = "kUIViewBadegeXPaddingKey";
static char const *const kUIViewBadegeYPaddingKey          = "kUIViewBadegeYPaddingKey";
static char const *const kUIViewBadegeMinHeightKey         = "kUIViewBadegeMinHeightKey";
static char const *const kUIViewBadegeHideBadgeWhenZeroKey = "kUIViewBadegeHideBadgeWhenZeroKey";
static char const *const kUIViewBadegeAnimateBadgeKey      = "kUIViewBadegeAnimateBadgeKey";

@implementation UIView (YJBadge)

// 初始化设置
- (void)yj_badgeInitial{
    
    // 初始配置
    self.yj_badgeBgColor = [UIColor redColor];
    self.yj_badgeTextColor = [UIColor whiteColor];
    self.yj_badgeFont = [UIFont systemFontOfSize:12.0f];
    self.yj_badgeXPadding = 6.0f;
    self.yj_badgeYPadding = 6.0f;
    self.yj_badgeMinHeight = 8.0f;
    self.yj_badgeOriginX = self.frame.size.width - self.yj_badgeLabel.frame.size.width * 0.5;
    self.yj_badgeOriginY = -4.0f;
    self.yj_hideBadgeWhenZero = YES;
    self.yj_animateBadgeEnable = YES;
    self.clipsToBounds = NO;
}

#pragma mark - Lazy
// 显示badge
- (void)setYj_badgeLabel:(UILabel *)yj_badgeLabel{
    objc_setAssociatedObject(self, kUIViewBadegeLabelKey, yj_badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)yj_badgeLabel{
    UILabel *badgeLabel = objc_getAssociatedObject(self, kUIViewBadegeLabelKey);
    return badgeLabel;
}

// 起始X
- (void)setYj_badgeOriginX:(CGFloat)yj_badgeOriginX{
    NSNumber *badgeOriginX = [NSNumber numberWithDouble:yj_badgeOriginX];
    objc_setAssociatedObject(self, kUIViewBadegeOriginXKey, badgeOriginX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeOriginX{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIViewBadegeOriginXKey);
    return badgeOriginX.floatValue;
}

// 起始Y

- (void)setYj_badgeOriginY:(CGFloat)yj_badgeOriginY{
    NSNumber *badgeOriginY = [NSNumber numberWithDouble:yj_badgeOriginY];
    objc_setAssociatedObject(self, kUIViewBadegeOriginYKey, badgeOriginY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeOriginY{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIViewBadegeOriginYKey);
    return badgeOriginX.floatValue;
}

// 数值
- (void)setBadgeValue:(NSString *)badgeValue{
    objc_setAssociatedObject(self, kUIViewBadegeValueKey, badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.yj_hideBadgeWhenZero)) {
        [self yj_removeBadge];
    } else if (!self.yj_badgeLabel) {
        self.yj_badgeLabel                      = [[UILabel alloc] initWithFrame:CGRectMake(self.yj_badgeOriginX, self.yj_badgeOriginY, 20, 20)];
        self.yj_badgeLabel.textColor            = self.yj_badgeTextColor;
        self.yj_badgeLabel.backgroundColor      = self.yj_badgeBgColor;
        self.yj_badgeLabel.font                 = self.yj_badgeFont;
        self.yj_badgeLabel.textAlignment        = NSTextAlignmentCenter;
        [self yj_badgeInitial];
        [self addSubview:self.yj_badgeLabel];
        [self yj_updateBadgeValueAnimated:NO];
    } else {
        [self yj_updateBadgeValueAnimated:YES];
    }
}

- (NSString *)badgeValue{
    return objc_getAssociatedObject(self, kUIViewBadegeValueKey);
}

// 背景色
- (void)setYj_badgeBgColor:(UIColor *)yj_badgeBgColor{
    objc_setAssociatedObject(self, kUIViewBadegeBgColorKey, yj_badgeBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIColor *)yj_badgeBgColor{
    return objc_getAssociatedObject(self, kUIViewBadegeBgColorKey);
}

// 字体颜色
- (void)setYj_badgeTextColor:(UIColor *)yj_badgeTextColor{
    objc_setAssociatedObject(self, kUIViewBadegeTextColorKey, yj_badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIColor *)yj_badgeTextColor{
    return objc_getAssociatedObject(self, kUIViewBadegeTextColorKey);
}

// 字体
- (void)setYj_badgeFont:(UIFont *)yj_badgeFont{
    objc_setAssociatedObject(self, kUIViewBadegeTextFontKey, yj_badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIFont *)yj_badgeFont{
    return objc_getAssociatedObject(self, kUIViewBadegeTextFontKey);
}

// Xpadding
- (void)setYj_badgeXPadding:(CGFloat)yj_badgeXPadding{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeXPadding];
    objc_setAssociatedObject(self, kUIViewBadegeXPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeXPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIViewBadegeXPaddingKey);
    return paddingNumber.floatValue;
}

// Ypadding
- (void)setYj_badgeYPadding:(CGFloat)yj_badgeYPadding{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeYPadding];
    objc_setAssociatedObject(self, kUIViewBadegeYPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeYPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIViewBadegeYPaddingKey);
    return paddingNumber.floatValue;
}

// 最小高度
- (void)setYj_badgeMinHeight:(CGFloat)yj_badgeMinHeight{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeMinHeight];
    objc_setAssociatedObject(self, kUIViewBadegeMinHeightKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeMinHeight{
    NSNumber *minHeight = objc_getAssociatedObject(self, kUIViewBadegeMinHeightKey);
    return minHeight.floatValue;
}

// 自动消失
- (void)setYj_hideBadgeWhenZero:(BOOL)yj_hideBadgeWhenZero{
    NSNumber *number = [NSNumber numberWithBool:yj_hideBadgeWhenZero];
    objc_setAssociatedObject(self, kUIViewBadegeHideBadgeWhenZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (BOOL)yj_hideBadgeWhenZero{
    NSNumber *number = objc_getAssociatedObject(self, kUIViewBadegeHideBadgeWhenZeroKey);
    return number.boolValue;
}

/** 动画 */
- (void)setYj_animateBadgeEnable:(BOOL)yj_animateBadgeEnable{
    NSNumber *number = [NSNumber numberWithBool:yj_animateBadgeEnable];
    objc_setAssociatedObject(self, kUIViewBadegeAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (BOOL)yj_animateBadgeEnable{
    NSNumber *number = objc_getAssociatedObject(self, kUIViewBadegeAnimateBadgeKey);
    return number.boolValue;
}

#pragma mark - 更新Frame
- (void)_yj_updateBadgeFrame{
    
    CGSize expectedLabelSize = [self yj_badgeExpectedSize];
    CGFloat paddingX = self.yj_badgeXPadding;
    CGFloat paddingY = self.yj_badgeYPadding;
    
    CGFloat minHeight = expectedLabelSize.height;
    minHeight = (minHeight < self.yj_badgeMinHeight)?self.yj_badgeMinHeight:expectedLabelSize.height;
    
    CGFloat minWidth = expectedLabelSize.width;
    minWidth = (minWidth < minHeight)?minHeight:expectedLabelSize.width;
    self.yj_badgeLabel.layer.masksToBounds = YES;
    self.yj_badgeLabel.frame = CGRectMake(self.yj_badgeOriginX, self.yj_badgeOriginY, minWidth + paddingX, minHeight + paddingY);
    self.yj_badgeLabel.layer.cornerRadius = (minHeight + paddingY) * 0.5;
}

// 适配字体
- (CGSize)yj_badgeExpectedSize{
    UILabel *frameLabel = [self yj_duplicateLabel:self.yj_badgeLabel];
    [frameLabel sizeToFit];
    return frameLabel.frame.size;
}

/** 复制 */
- (UILabel *)yj_duplicateLabel:(UILabel *)labelToCopy{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    return duplicateLabel;
}

/** 刷新数据 */
- (void)yj_refreshBadge{
    
    self.yj_badgeLabel.textColor       = self.yj_badgeTextColor;
    self.yj_badgeLabel.backgroundColor = self.yj_badgeBgColor;
    self.yj_badgeLabel.font            = self.yj_badgeFont;
}

- (void)yj_updateBadgeValueAnimated:(BOOL)animated{
    
    if (animated && self.yj_animateBadgeEnable && ![self.yj_badgeLabel.text isEqualToString:self.badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.yj_badgeLabel.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    self.yj_badgeLabel.text = self.badgeValue;
    
    if (animated && self.yj_animateBadgeEnable) {
        [UIView animateWithDuration:0.2 animations:^{
            [self _yj_updateBadgeFrame];
        }];
    } else {
        [self _yj_updateBadgeFrame];
    }
}

/** 移除 */
- (void)yj_removeBadge{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.yj_badgeLabel.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.yj_badgeLabel removeFromSuperview];
        self.yj_badgeLabel = nil;
    }];
}

@end
