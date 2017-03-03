//
//  NSArray+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YJSuperExt)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)yj_objectSafeAtIndex:(NSUInteger)index;

@end

#pragma mark - NSMutableArray
@interface NSMutableArray (YJSuperExt)

/** 安全添加对象到数组，防止非对象的崩溃 */
- (void)yj_addSafeObject:(id)obj;

@end
