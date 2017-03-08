//
//  UIView+YJDraggable.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  view 拖拽

#import <UIKit/UIKit.h>

@interface UIView (YJDraggable)

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture; /**< 手势 */

@property (nonatomic, assign) CGRect cagingArea; /**< 拖动区域 */

@property (nonatomic, assign)  CGRect handle; /**< 处理对象 */

@property (nonatomic, assign) BOOL shouldMoveAlongX;  /**< 水平方向 */

@property (nonatomic, assign) BOOL shouldMoveAlongY;  /**< 竖直方向 */

@property (nonatomic, copy) void (^draggingStartedBlock)(UIView *);
@property (nonatomic, copy) void (^draggingMovedBlock)(UIView *);
@property (nonatomic, copy) void (^draggingEndedBlock)(UIView *);

- (void)enableDragging;

- (void)setDraggable:(BOOL)draggable;

@end
