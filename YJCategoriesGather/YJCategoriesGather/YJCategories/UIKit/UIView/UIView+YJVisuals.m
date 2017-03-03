//
//  UIView+YJVisuals.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJVisuals.h"

// Degree -> Rad
#define degToRad(x) (M_PI * (x) / 180.0)

@implementation UIView (YJVisuals)

/** 设置圆角和边框 */
- (void)yj_cornerRadius:(CGFloat)radius
                  color:(UIColor *)color
            borderWidth:(CGFloat)borderWidth{
    
    if (radius > 0) {
        self.layer.cornerRadius = radius;
    }
    if (color) {
        self.layer.borderColor = color.CGColor;
    }
    if (borderWidth > 0) {
        self.layer.borderWidth = borderWidth;
    }
}

/** 设置阴影 */
- (void)yj_shadowWithColor:(UIColor *)shadowColor
                    offset:(CGSize)offset
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius{
    self.clipsToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}

/** 从父视图动画消失 */
-(void)yj_removeFromSuperviewWithFadeDuration:(NSTimeInterval)duration completion:(void (^ __nullable)(BOOL finished))completion{
//    [UIView beginAnimations:nil context: NULL];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration:duration];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDidStopSelector:@selector(removeFromSuperview)];
//    self.alpha = 0.0;
//    [UIView commitAnimations];
    
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(YES);
        }
        [self removeFromSuperview];
    }];
}

/** 动画添加视图 */
- (void)yj_addSubview:(UIView *)subview transition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration{
    [UIView beginAnimations:nil context: NULL];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:transition forView:self cache:YES];
    [self addSubview:subview];   // 同样可以移除
    [UIView commitAnimations];
}


/** 旋转参数设置 angle=角度 duration=时间 autoreverse=自动重复 repeatCount=重复次数 */
- (void)yj_rotateByAngle:(CGFloat)angle
                duration:(NSTimeInterval)duration
             autoreverse:(BOOL)autoreverse
             repeatCount:(CGFloat)repeatCount
          timingFunction:(CAMediaTimingFunction *)timingFunction{
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.toValue = [NSNumber numberWithFloat:degToRad(angle)];
    rotation.duration = duration;
    rotation.repeatCount = repeatCount;
    rotation.autoreverses = autoreverse;
    rotation.removedOnCompletion = NO;
    rotation.fillMode = kCAFillModeBoth;
    rotation.timingFunction = timingFunction != nil?timingFunction:[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:rotation forKey:@"rotationAnimation"];
}

/** 移动视图相关参数设置 newPoint=新位置 duration=时间 autoreverse=自动重复 repeatCount=重复次数*/
- (void)yj_moveToPoint:(CGPoint)newPoint
          duration:(NSTimeInterval)duration
       autoreverse:(BOOL)autoreverse
       repeatCount:(CGFloat)repeatCount
    timingFunction:(CAMediaTimingFunction *)timingFunction{
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position"];
    move.toValue = [NSValue valueWithCGPoint: newPoint];
    move.duration = duration;
    move.removedOnCompletion = NO;
    move.repeatCount = repeatCount;
    move.autoreverses = autoreverse;
    move.fillMode = kCAFillModeBoth;
    move.timingFunction = timingFunction != nil?timingFunction:[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:move forKey:@"positionAnimation"];
}


@end
