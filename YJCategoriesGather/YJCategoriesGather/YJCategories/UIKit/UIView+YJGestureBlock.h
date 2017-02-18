//
//  UIView+YJGestureBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/4/27.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YJGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (YJGestureBlock)

/** 添加 Tap 手势 */
- (void)addTapGestureWithBlock:(YJGestureActionBlock)block;

/** 添加 LongPressGesture 收拾 */
- (void)addLongPressGestureWithBlock:(YJGestureActionBlock)block;

@end
