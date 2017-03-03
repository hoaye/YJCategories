//
//  UIView+YJAnimation.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJAnimation.h"

@implementation UIView (YJAnimation)

/** 动画添加子视图 */
- (void)yj_addSubviewWithFadeAnimation:(UIView *)subview
                              duration:(NSTimeInterval)duration
                            completion:(void (^)(BOOL finished))completion{
    
    CGFloat finalAlpha = subview.alpha;
    
    subview.alpha = 0.0;
    [self addSubview:subview];
    [UIView animateWithDuration:duration animations:^{
        subview.alpha = finalAlpha;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(finished);
        }
    }];
}

/** 脉冲式 动画 */
- (void)yj_pulseDuration:(float)duration continuously:(BOOL)continuously{
    [UIView animateWithDuration:duration * 0.5 delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         // Fade out, but not completely
                         self.alpha = 0.3;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:duration * 0.5 delay:0.0
                                             options:UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              self.alpha = 1.0;
                                          }
                                          completion:^(BOOL finished) {
                                              if (continuously) {
                                                  [self yj_pulseDuration:duration continuously:continuously];
                                              }
                                          }];
                     }];
}

/** 改变alpaca */
- (void)yj_changeAlpha:(float)newAlpha duration:(float)duration completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = newAlpha;
                     }completion:completion];
}

@end
