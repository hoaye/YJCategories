//
//  NSDictionary+YJBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+YJBlock.h"

@implementation NSDictionary (YJBlock)

/** 遍历出字典的key-Value键值对 */
- (void)yj_keyValuesBlock:(void (^)(id key, id value))block{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (NSArray *)jk_map:(id (^)(id key, id value))block {
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
