//
//  UIControl+YJBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (YJBlock)

/** 点下Block */
- (void)yj_addTouchDownBlock:(void (^)(__kindof UIControl *sender))block;

@end
