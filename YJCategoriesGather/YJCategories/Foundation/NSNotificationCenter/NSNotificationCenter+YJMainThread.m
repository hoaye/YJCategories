//
//  NSNotificationCenter+YJMainThread.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSNotificationCenter+YJMainThread.h"

@implementation NSNotificationCenter (YJMainThread)

/** 在主线程中发送一条通知 */
- (void)postNotificationOnMainThread:(NSNotification *)notification{
    
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

/** 在主线程中发送一条通知 携带对象 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(id)anObject{
    
    NSNotification *notification = [NSNotification notificationWithName:name object:anObject];
    [self postNotificationOnMainThread:notification];
}

/** 在主线程中发送一条通知 携带对象和用户信息 */
- (void)postNotificationOnMainThreadWithName:(NSString *)name
                                     object:(id)anObject
                                   userInfo:(NSDictionary *)userInfo{
    
    NSNotification *notification = [NSNotification notificationWithName:name object:anObject userInfo:userInfo];
    [self postNotificationOnMainThread:notification];
}


@end
