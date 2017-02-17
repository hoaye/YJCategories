//
//  NSArray+YJExtention.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YJExtention)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)objectSafeAtIndex:(NSUInteger)index;

@end
