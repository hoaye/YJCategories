//
//  UIView+YJAnimation.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJAnimation)

/** 动画添加子视图 */
- (void)yj_addSubviewWithFadeAnimation:(UIView *)subview
                              duration:(NSTimeInterval)duration
                            completion:(void (^)(BOOL finished))completion;

#pragma mark - Effects
/** 脉冲式 动画 */
- (void)yj_pulseDuration:(NSTimeInterval)duration continuously:(BOOL)continuously;

/** 改变alpaca */
- (void)yj_changeAlpha:(float)newAlpha duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

#pragma mark - Transitions
/** 旋转变小消失 */
- (void)yj_rotateRemoveDuration:(NSTimeInterval)duration;

#pragma mark - Transforms
/** 是否顺时针不停旋转 */
- (void)yj_rotateClockwise:(BOOL)clockwise duration:(NSTimeInterval)duration;

/** 动态旋转 degrees=度数 */
- (void)yj_rotateDegrees:(CGFloat)degrees duration:(NSTimeInterval)duration completion:(void (^)(BOOL finished))completion;

/** 缩放动画 scaleX 和 scaleY 取值 0~Max*/
- (void)yj_scaleDuration:(NSTimeInterval)duration x:(CGFloat)scaleX y:(CGFloat)scaleY completion:(void (^)(BOOL finished))completion;

#pragma mark - Moves

/** 动态移动到 snapBack=是否回弹 snapBackOffset=回弹幅度*/
- (void)yj_moveTostopPoint:(CGPoint)destination duration:(NSTimeInterval)duration snapBack:(BOOL)snapBack snapBackOffset:(CGFloat)snapBackOffset completion:(void (^)(BOOL finished))completion;


@end
