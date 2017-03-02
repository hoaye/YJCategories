//
//  NSDictionary+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+YJBlock.h"

@implementation NSDictionary (YJBlock)

/** 遍历字典的key-Value键值对并 Return处理结果数组 */
- (NSArray *)yj_keyValuesMapBlock:(id (^)(id key, id value))block{
    
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = block(key, obj);
        if (object) {
            [array addObject:object];
        }
    }];
    return array;
}

@end
