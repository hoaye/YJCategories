//
//  NSArray+YJBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YJBlock)

/** 遍历数组 index 和 object */
- (NSArray *)yj_arrayWithIndexMapBlock:(id (^)(NSUInteger index, id object))block;

/** 数组过滤器 */
- (NSArray *)yj_filterBlock:(BOOL (^)(id object))block;


@end
