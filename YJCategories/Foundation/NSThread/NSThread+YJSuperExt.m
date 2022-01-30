//
//  NSThread+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by hyj on 2020/8/17.
//  Copyright © 2020 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import "NSThread+YJSuperExt.h"

@implementation NSThread (YJSuperExt)

+ (BOOL)yj_isMainQueue {
    static const void* mainQueueKey = @"mainQueue";
    static void* mainQueueContext = @"mainQueue";
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_set_specific(dispatch_get_main_queue(), mainQueueKey, mainQueueContext, nil);
    });
    return dispatch_get_specific(mainQueueKey) == mainQueueContext;
}

@end
