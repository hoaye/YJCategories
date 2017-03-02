//
//  NSDictionary+YJBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJBlock)

/** 遍历出字典的key-Value键值对 */
- (void)yj_keyValuesBlock:(void (^)(id key, id value))block;

- (NSArray *)jk_map:(id (^)(id key, id value))block;

@end
