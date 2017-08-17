//
//  CATransaction+YJAnimationDuration.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "CATransaction+YJAnimationDuration.h"

@implementation CATransaction (YJAnimationDuration)

+ (void)yj_animationDuration:(NSTimeInterval)duration
                 animations:(void (^)(void))animations
                 completion:(void (^)())completion{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    
    if (completion){
        [CATransaction setCompletionBlock:completion];
    }
    
    if (animations){
        animations();
    }
    [CATransaction commit];
}


@end
