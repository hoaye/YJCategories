//
//  UIControl+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIControl+YJBlock.h"
#import <objc/runtime.h>

static char const * const addTouchDownBlockKey = "addTouchDownBlockKey";

@implementation UIControl (YJBlock)

/** 点下Block */
- (void)yj_addTouchDownBlock:(void (^)(__kindof UIControl *sender))block{
    objc_setAssociatedObject(self, addTouchDownBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(touchDownBlockAction:) forControlEvents:UIControlEventTouchDown];
}

- (void)touchDownBlockAction:(__kindof UIControl *)sender{
    void (^block)(UIControl *sender) = objc_getAssociatedObject(self, addTouchDownBlockKey);
    if (block) {
        block(sender);
    }
}




@end
