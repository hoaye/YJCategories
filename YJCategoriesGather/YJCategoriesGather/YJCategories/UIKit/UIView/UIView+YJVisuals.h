//
//  UIView+YJVisuals.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  显示效果分类

#import <UIKit/UIKit.h>

@interface UIView (YJVisuals)

/** 设置圆角和边框 */
- (void)yj_cornerRadius:(CGFloat)radius
                  color:(UIColor *)color
            borderWidth:(CGFloat)borderWidth;

/** 设置阴影 */
- (void)yj_shadowWithColor:(UIColor *)shadowColor
                    offset:(CGSize)offset
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius;

/** 从父视图动画消失 */
-(void)yj_removeFromSuperviewWithFadeDuration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

/** 动画添加呈现视图 一般用不到，比较low*/
- (void)yj_addSubview:(UIView *)subview transition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration;

/** 旋转参数设置 angle=角度 duration=时间 autoreverse=自动重复 repeatCount=重复次数 */
- (void)yj_rotateByAngle:(CGFloat)angle
                duration:(NSTimeInterval)duration
             autoreverse:(BOOL)autoreverse
             repeatCount:(CGFloat)repeatCount
          timingFunction:(CAMediaTimingFunction *)timingFunction;

/** 移动视图相关参数设置 newPoint=新位置 duration=时间 autoreverse=自动重复 repeatCount=重复次数*/
- (void)yj_moveToPoint:(CGPoint)newPoint
              duration:(NSTimeInterval)duration
           autoreverse:(BOOL)autoreverse
           repeatCount:(CGFloat)repeatCount
        timingFunction:(CAMediaTimingFunction *)timingFunction;

@end
