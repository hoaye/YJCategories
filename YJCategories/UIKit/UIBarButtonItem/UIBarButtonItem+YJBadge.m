//
//  UIBarButtonItem+YJBadge.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIBarButtonItem+YJBadge.h"
#import <objc/runtime.h>

static char const *const kUIBarButtonItemBadegeLabelKey             = "kUIBarButtonItemBadegeLabelKey";
static char const *const kUIBarButtonItemBadegeOriginXKey           = "kUIBarButtonItemBadegeOriginXKey";
static char const *const kUIBarButtonItemBadegeOriginYKey           = "kUIBarButtonItemBadegeOriginYKey";
static char const *const kUIBarButtonItemBadegeValueKey             = "kUIBarButtonItemBadegeValueKey";
static char const *const kUIBarButtonItemBadegeBgColorKey           = "kUIBarButtonItemBadegeBgColorKey";
static char const *const kUIBarButtonItemBadegeTextColorKey         = "kUIBarButtonItemBadegeTextColorKey";
static char const *const kUIBarButtonItemBadegeTextFontKey          = "kUIBarButtonItemBadegeTextFontKey";
static char const *const kUIBarButtonItemBadegeXPaddingKey           = "kUIBarButtonItemBadegeXPaddingKey";
static char const *const kUIBarButtonItemBadegeYPaddingKey           = "kUIBarButtonItemBadegeYPaddingKey";
static char const *const kUIBarButtonItemBadegeMinHeightKey         = "kUIBarButtonItemBadegeMinHeightKey";
static char const *const kUIBarButtonItemBadegeHideBadgeWhenZeroKey = "kUIBarButtonItemBadegeHideBadgeWhenZeroKey";
static char const *const kUIBarButtonItemBadegeAnimateBadgeKey      = "kUIBarButtonItemBadegeAnimateBadgeKey";

@implementation UIBarButtonItem (YJBadge)

// 初始化设置
- (void)yj_badgeInitial{

    UIView *superView = nil;
    CGFloat defaultOriginX = 0.0f;
    if (self.customView) {
        superView = self.customView;
        defaultOriginX = superView.frame.size.width - self.yj_badgeLabel.frame.size.width * 0.5;
        superView.clipsToBounds = NO; // 防止动画收缩时裁剪
    }else if ([self respondsToSelector:@selector(view)] && [(id)self view]){
        superView = [(id)self view];
        defaultOriginX = superView.frame.size.width - self.yj_badgeLabel.frame.size.width;
    }
    [superView addSubview:self.yj_badgeLabel];
    
    // 初始配置
    self.yj_badgeBgColor = [UIColor redColor];
    self.yj_badgeTextColor = [UIColor whiteColor];
    self.yj_badgeFont = [UIFont systemFontOfSize:12.0f];
    self.yj_badgeXPadding = 6.0f;
    self.yj_badgeYPadding = 6.0f;
    self.yj_badgeMinHeight = 8.0f;
    self.yj_badgeOriginX = defaultOriginX;
    self.yj_badgeOriginY = -4.0f;
    self.yj_hideBadgeWhenZero = YES;
    self.yj_animateBadgeEnable = YES;
}

#pragma mark - Lazy
// 显示badge
- (void)setYj_badgeLabel:(UILabel *)yj_badgeLabel{
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeLabelKey, yj_badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)yj_badgeLabel{
    
    UILabel *badgeLabel = objc_getAssociatedObject(self, kUIBarButtonItemBadegeLabelKey);
    if (!badgeLabel) {
        badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.yj_badgeOriginX, self.yj_badgeOriginY, 20, 20)];
        [self setYj_badgeLabel:badgeLabel];
        [self yj_badgeInitial];
        [self.customView addSubview:badgeLabel];
        badgeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return badgeLabel;
}

// 起始X
- (void)setYj_badgeOriginX:(CGFloat)yj_badgeOriginX{
    NSNumber *badgeOriginX = [NSNumber numberWithDouble:yj_badgeOriginX];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeOriginXKey, badgeOriginX, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeOriginX{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIBarButtonItemBadegeOriginXKey);
    return badgeOriginX.floatValue;
}

// 起始Y

- (void)setYj_badgeOriginY:(CGFloat)yj_badgeOriginY{
    NSNumber *badgeOriginY = [NSNumber numberWithDouble:yj_badgeOriginY];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeOriginYKey, badgeOriginY, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeOriginY{
    NSNumber *badgeOriginX = objc_getAssociatedObject(self, kUIBarButtonItemBadegeOriginYKey);
    return badgeOriginX.floatValue;
}

// 数值
- (void)setBadgeValue:(NSString *)badgeValue{
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeValueKey, badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self yj_updateBadgeValueAnimated:YES];
    [self yj_refreshBadge];
}

- (NSString *)badgeValue{
    return objc_getAssociatedObject(self, kUIBarButtonItemBadegeValueKey);
}

// 背景色
- (void)setYj_badgeBgColor:(UIColor *)yj_badgeBgColor{
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeBgColorKey, yj_badgeBgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIColor *)yj_badgeBgColor{
    return objc_getAssociatedObject(self, kUIBarButtonItemBadegeBgColorKey);
}

// 字体颜色
- (void)setYj_badgeTextColor:(UIColor *)yj_badgeTextColor{
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeTextColorKey, yj_badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIColor *)yj_badgeTextColor{
    return objc_getAssociatedObject(self, kUIBarButtonItemBadegeTextColorKey);
}

// 字体
- (void)setYj_badgeFont:(UIFont *)yj_badgeFont{
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeTextFontKey, yj_badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (UIFont *)yj_badgeFont{
    return objc_getAssociatedObject(self, kUIBarButtonItemBadegeTextFontKey);
}

// Xpadding
- (void)setYj_badgeXPadding:(CGFloat)yj_badgeXPadding{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeXPadding];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeXPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeXPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIBarButtonItemBadegeXPaddingKey);
    return paddingNumber.floatValue;
}

// Ypadding
- (void)setYj_badgeYPadding:(CGFloat)yj_badgeYPadding{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeYPadding];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeYPaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeYPadding{
    NSNumber *paddingNumber = objc_getAssociatedObject(self, kUIBarButtonItemBadegeYPaddingKey);
    return paddingNumber.floatValue;
}

// 最小高度
- (void)setYj_badgeMinHeight:(CGFloat)yj_badgeMinHeight{
    NSNumber *number = [NSNumber numberWithDouble:yj_badgeMinHeight];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeMinHeightKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self _yj_updateBadgeFrame];
    }
}

- (CGFloat)yj_badgeMinHeight{
    NSNumber *minHeight = objc_getAssociatedObject(self, kUIBarButtonItemBadegeMinHeightKey);
    return minHeight.floatValue;
}

// 自动消失
- (void)setYj_hideBadgeWhenZero:(BOOL)yj_hideBadgeWhenZero{
    NSNumber *number = [NSNumber numberWithBool:yj_hideBadgeWhenZero];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeHideBadgeWhenZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (BOOL)yj_hideBadgeWhenZero{
    NSNumber *number = objc_getAssociatedObject(self, kUIBarButtonItemBadegeHideBadgeWhenZeroKey);
    return number.boolValue;
}

/** 动画 */
- (void)setYj_animateBadgeEnable:(BOOL)yj_animateBadgeEnable{
    NSNumber *number = [NSNumber numberWithBool:yj_animateBadgeEnable];
    objc_setAssociatedObject(self, kUIBarButtonItemBadegeAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.yj_badgeLabel) {
        [self yj_refreshBadge];
    }
}

- (BOOL)yj_animateBadgeEnable{
    NSNumber *number = objc_getAssociatedObject(self, kUIBarButtonItemBadegeAnimateBadgeKey);
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
    
    if (!self.badgeValue || [self.badgeValue isEqualToString:@""] || ([self.badgeValue isEqualToString:@"0"] && self.yj_hideBadgeWhenZero)) {
        self.yj_badgeLabel.hidden = YES;
    } else {
        self.yj_badgeLabel.hidden = NO;
        [self yj_updateBadgeValueAnimated:YES];
    }
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
