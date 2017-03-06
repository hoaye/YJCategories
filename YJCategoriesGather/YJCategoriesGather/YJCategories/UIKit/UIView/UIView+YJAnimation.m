//
//  UIView+YJAnimation.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJAnimation.h"

float yj_radiansForDegrees(int degrees) {
    return degrees * M_PI / 180.0f;
}

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

#pragma mark - Effects
/** 脉冲式 动画 */
- (void)yj_pulseDuration:(NSTimeInterval)duration continuously:(BOOL)continuously{
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
- (void)yj_changeAlpha:(float)newAlpha duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = newAlpha;
                     }completion:completion];
}

#pragma mark - Transitions
/** 旋转变小消失 */
- (void)yj_rotateRemoveDuration:(NSTimeInterval)duration{
    self.tag = 20;
    [NSTimer scheduledTimerWithTimeInterval:duration/50 target:self selector:@selector(yj_drainTimer:) userInfo:nil repeats:YES];
}
- (void)yj_drainTimer:(NSTimer *)timer{
    CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(self.transform, 0.9, 0.9),0.314);
    self.transform = trans;
    self.alpha = self.alpha * 0.98;
    self.tag = self.tag - 1;
    if (self.tag <= 0) {
        [timer invalidate];
        [self removeFromSuperview];
    }
}


#pragma mark - Transforms
/** 是否顺时针不停旋转 */
- (void)yj_rotateClockwise:(BOOL)clockwise duration:(NSTimeInterval)duration{
    
    CGFloat angleValue = 0.0;
    if (clockwise) {
        angleValue = yj_radiansForDegrees(90);
    }else{
        angleValue = yj_radiansForDegrees(270);
    }
    [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        self.transform = CGAffineTransformRotate(self.transform, angleValue);
    } completion:^(BOOL finished) {
        [self yj_rotateClockwise:clockwise duration:duration];
    }];
}

















@end
