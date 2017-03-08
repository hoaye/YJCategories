//
//  UIView+YJShake.m
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJShake.h"

@implementation UIView (YJShake)

/** 默认参数配置Shake */
- (void)yj_shakeDefaultHorizontal{
    [self _jk_shakeWithTimes:10 direction:1 currentTimes:0 offset:5 speed:0.03 shakeDirection:YJShakeDirectionHorizontal completion:nil];
}

/** 设置水平摇晃的 次数times和幅度offset Block */
- (void)yj_shakeHorizontalWithTimes:(int)times offset:(CGFloat)offset completion:(void(^)())completion{
    [self _jk_shakeWithTimes:times direction:1 currentTimes:0 offset:offset speed:0.03 shakeDirection:YJShakeDirectionHorizontal completion:completion];
}

/** 晃动 相关参数配置 */
- (void)yj_shakeWithTimes:(int)times offset:(CGFloat)offset speed:(NSTimeInterval)speed shakeDirection:(YJShakeDirectionType)shakeDirection completion:(void (^)(void))completion{
    [self _jk_shakeWithTimes:times direction:1 currentTimes:0 offset:offset speed:speed shakeDirection:shakeDirection completion:completion];
}

#pragma mark - Private
/** shake相关配置 */
- (void)_jk_shakeWithTimes:(int)times
                 direction:(int)direction
              currentTimes:(int)currentTimes
                    offset:(CGFloat)offset
                     speed:(NSTimeInterval)speed
            shakeDirection:(YJShakeDirectionType)shakeDirection
                completion:(void (^)(void))completionHandler{
    
    [UIView animateWithDuration:speed animations:^{
        self.layer.affineTransform = (shakeDirection == YJShakeDirectionHorizontal)?CGAffineTransformMakeTranslation(offset * direction, 0) : CGAffineTransformMakeTranslation(0, offset * direction);
    } completion:^(BOOL finished) {
        if(currentTimes >= times) {
            [UIView animateWithDuration:speed animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _jk_shakeWithTimes:(times - 1)
                       direction:direction * -1
                    currentTimes:currentTimes + 1
                          offset:offset
                           speed:speed
                  shakeDirection:shakeDirection
                      completion:completionHandler];
    }];
}

@end
