//
//  UIControl+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIControl+YJBlock.h"
#import <objc/runtime.h>

static char const * const addControlEventsBlockKey = "addControlEventsBlockKey";

@implementation UIControl (YJBlock)

/** 添加Block 事件 */
- (void)yj_addControlBlock:(void (^)(__kindof UIControl *sender))block events:(UIControlEvents)events{
    objc_setAssociatedObject(self, addControlEventsBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(touchControlEventsBlockAction:) forControlEvents:events];
}

- (void)touchControlEventsBlockAction:(__kindof UIControl *)sender{
    void (^block)(UIControl *sender) = objc_getAssociatedObject(self, addControlEventsBlockKey);
    if (block) {
        block(sender);
    }
}




@end
