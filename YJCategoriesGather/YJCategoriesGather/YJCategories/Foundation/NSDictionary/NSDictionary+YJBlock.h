//
//  NSDictionary+YJBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJBlock)

/** 遍历字典的key-Value键值对并 Return处理结果数组 */
- (NSArray *)yj_keyValuesMapBlock:(id (^)(id key, id value))block;


@end
