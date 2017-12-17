//
//  NSArray+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (YJSuperExt)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)yj_objectSafeAtIndex:(NSUInteger)index;

/** 移除对象 */
- (NSArray *)yj_removeObject:(id)object;

/** 移除第一个对象 */
- (NSArray *)yj_removeFirstObject;

/** 移除最后一个对象 */
- (NSArray *)yj_removeLastObject;

/**
 逆序数组元素

 @return 已经逆序的数组
 */
- (NSArray *)yj_reverseObject;

@end

