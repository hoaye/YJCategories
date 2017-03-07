//
//  UIControl+YJBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (YJBlock)

/** 添加Block 事件 */
- (void)yj_addControlBlock:(void (^)(__kindof UIControl *sender))block events:(UIControlEvents)events;

@end
