//
//  NSTimer+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSTimer+YJBlock.h"

@implementation NSTimer (YJBlock)

/** 定时器Block执行 scheduled*/
+ (NSTimer *)yj_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats{
    void (^block)() = [inBlock copy];
    NSTimer *ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(_yj_ExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

/** 定时器Block执行 timer */
+ (NSTimer *)yj_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats{
    void (^block)() = [inBlock copy];
    NSTimer *ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(_yj_ExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

#pragma mark - Private
+ (void)_yj_ExecuteSimpleBlock:(NSTimer *)inTimer{
    if([inTimer userInfo]){
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
