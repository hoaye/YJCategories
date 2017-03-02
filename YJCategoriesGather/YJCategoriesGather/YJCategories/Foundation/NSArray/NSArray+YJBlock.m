//
//  NSArray+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+YJBlock.h"

@implementation NSArray (YJBlock)

/** 遍历数组 index 和 object */
- (NSArray *)yj_arrayWithIndexMapBlock:(id (^)(NSUInteger index, id object))block{
    
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id objects, NSUInteger idx, BOOL *stop) {
        id object = block(idx, objects);
        if (object) {
            [array addObject:object];
        }
    }];
    return array;
}

@end
