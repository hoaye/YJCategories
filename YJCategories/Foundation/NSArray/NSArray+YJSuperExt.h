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

/**
 数组洗牌

 @return 打乱的数组
 */
- (NSArray *)yj_shuffledArray;

/**
 数组去重

 @return unique Array
 */
- (NSArray *)yj_uniqueArray;

/**
 根据关键词 对array的内容进行排序，并返回排序后的array

 @param parameters key
 @param ascending ascending
 @return result
 */
- (NSArray *)yj_arraySorting:(NSString *)parameters
                   ascending:(BOOL)ascending;

@end

