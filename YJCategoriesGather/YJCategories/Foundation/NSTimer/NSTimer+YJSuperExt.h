//
//  NSTimer+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YJSuperExt)

/** 暂停NSTimer */
- (void)yj_pauseTimer;

/** 开始NSTimer */
- (void)yj_resumeTimer;

/** 延迟开始NSTimer */
- (void)yj_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
