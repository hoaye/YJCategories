//
//  NSTimer+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSTimer+YJSuperExt.h"

@implementation NSTimer (YJSuperExt)

/** 暂停NSTimer */
- (void)yj_pauseTimer{
    if (![self isValid]) { return; }
    [self setFireDate:[NSDate distantFuture]];
}

/** 开始NSTimer */
- (void)yj_resumeTimer{
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate date]];
}

/** 延迟开始NSTimer */
- (void)yj_resumeTimerAfterTimeInterval:(NSTimeInterval)interval{
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
