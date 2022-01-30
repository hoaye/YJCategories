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

/** 动态旋转 degrees=度数 */
- (void)yj_rotateDegrees:(CGFloat)degrees duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformRotate(self.transform, yj_radiansForDegrees(degrees));
                     }completion:^(BOOL finished) {
                         if (completion) {
                             completion(finished);
                         }
                     }];
}

/** 缩放动画 scaleX 和 scaleY 取值 0~Max*/
- (void)yj_scaleDuration:(NSTimeInterval)duration x:(CGFloat)scaleX y:(CGFloat)scaleY completion:(void (^)(BOOL finished))completion{
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.transform = CGAffineTransformScale(self.transform, scaleX, scaleY);
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion(finished);
                         }
                     }];
}


#pragma mark - Moves
/** 动态移动到 snapBack=是否回弹 snapBackOffset=回弹幅度*/
- (void)yj_moveTostopPoint:(CGPoint)destination duration:(NSTimeInterval)duration snapBack:(BOOL)snapBack snapBackOffset:(CGFloat)snapBackOffset completion:(void (^)(BOOL finished))completion{
    
    CGFloat offsetValue = snapBackOffset;
    CGPoint stopPoint = destination;
    if (snapBack) {
        int diffx = destination.x - self.frame.origin.x;
        int diffy = destination.y - self.frame.origin.y;
        if (diffx < 0) {
            stopPoint.x -= offsetValue;
        } else if (diffx > 0) {
            stopPoint.x += offsetValue;
        }
        if (diffy < 0) {
            stopPoint.y -= offsetValue;
        } else if (diffy > 0) {
            stopPoint.y += offsetValue;
        }
    }
    
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.frame = CGRectMake(stopPoint.x, stopPoint.y, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         if (snapBack) {
                             [UIView animateWithDuration:0.1
                                                   delay:0.0
                                                 options:UIViewAnimationOptionCurveLinear
                                              animations:^{
                                                  self.frame = CGRectMake(destination.x, destination.y, self.frame.size.width, self.frame.size.height);
                                              }
                                              completion:^(BOOL finished) {
                                                  if (completion) {
                                                      completion(finished);
                                                  }
                                              }];
                         }else{
                             if (completion) {
                                 completion(finished);
                             }
                         }
                     }];        
}

// 转子动画
- (void)createCircle:(float)startAngle andEndAngle:(float)endAngle {
    
    CGFloat origin_x = self.frame.size.width * 0.5;
    CGFloat origin_y = self.frame.size.height * 0.5;
    
    for (NSInteger i = 0; i < 5; i++) {
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.frame = CGRectMake(-500, -500, 6 - i, 6 - i);
        layer.cornerRadius = (6 - i) * 0.5;
        //创建运动的轨迹动画
        CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        pathAnimation.calculationMode = kCAAnimationPaced;
        pathAnimation.fillMode = kCAFillModeForwards;
        pathAnimation.removedOnCompletion = NO;
        pathAnimation.duration = 1.5;
        pathAnimation.beginTime = i * 0.1;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        UIBezierPath *arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake(origin_x, origin_y) radius:20 startAngle:startAngle endAngle:endAngle  clockwise:YES];
        pathAnimation.path = arc.CGPath;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.animations = @[pathAnimation];
        group.duration = 2;
        group.repeatCount = INTMAX_MAX;
        //设置运转的动画
        [layer addAnimation:group forKey:@"moveTheCircleOne"];
        [self.layer addSublayer:layer];
    }
}














@end
