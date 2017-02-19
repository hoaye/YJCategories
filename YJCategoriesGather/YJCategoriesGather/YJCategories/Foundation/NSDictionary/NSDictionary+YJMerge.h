//
//  NSDictionary+YJMerge.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/19.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJMerge)

/** 合并两个NSDictionary */
+ (NSDictionary *)margeDictionaryWithDict:(NSDictionary *)dict1
                                     dict:(NSDictionary *)dict2;

/** 合并入一个NSDictionary */
- (NSDictionary *)mergeDictionary:(NSDictionary *)dict;

@end
