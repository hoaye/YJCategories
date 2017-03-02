//
//  NSDictionary+YJMerge.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJMerge)

/** 合并两个NSDictionary */
+ (NSDictionary *)margeDictionaryWithDict:(NSDictionary *)dict1
                                     dict:(NSDictionary *)dict2;

/** 合并入一个NSDictionary */
- (NSDictionary *)mergeDictionary:(NSDictionary *)dict;

/** 遍历字典的key-Value键值对并 Return处理结果数组 */
- (NSArray *)yj_keyValuesMapBlock:(id (^)(id key, id value))block;

/** 字典选择器 */
- (NSDictionary *)yj_dictionaryPickWithKeys:(NSArray *)keys;

/** 字典忽略器 */
- (NSDictionary *)yj_dictionaryOmitWithKeys:(NSArray *)keys;

@end
