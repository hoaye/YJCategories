//
//  UINavigationBar+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UINavigationBar+YJSuperExt.h"
#import <objc/message.h>

static char const * const YJ_OVERLAY_Key = "YJOVERLAYKey";

@implementation UINavigationBar (YJSuperExt)

- (UIView *)yj_overlayView{
    return objc_getAssociatedObject(self, YJ_OVERLAY_Key);
}

- (void)setYj_overlayView:(UIView *)yj_overlayView{
    objc_setAssociatedObject(self, YJ_OVERLAY_Key, yj_overlayView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/** 导航栏设置背景颜色 */
- (void)yj_setBackgroundColor:(UIColor *)backgroundColor{
    if (!self.yj_overlayView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.yj_overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.yj_overlayView.userInteractionEnabled = NO;
        self.yj_overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.yj_overlayView atIndex:0];
    }
    self.yj_overlayView.backgroundColor = backgroundColor;
}

/** 修改导航栏的位置 */
- (void)yj_setTranslationY:(CGFloat)translationY{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

/** 设置添加视图的透明度 */
- (void)yj_setElementsAlpha:(CGFloat)alpha{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

/** 重新设置初始化 */
- (void)yj_reset{
    self.transform = CGAffineTransformMakeTranslation(0, 0);
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.yj_overlayView removeFromSuperview];
    self.yj_overlayView = nil;
}


@end
