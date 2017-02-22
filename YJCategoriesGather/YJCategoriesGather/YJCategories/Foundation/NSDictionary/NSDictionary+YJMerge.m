//
//  NSDictionary+YJMerge.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+YJMerge.h"

@implementation NSDictionary (YJMerge)

/** 合并两个NSDictionary */
+ (NSDictionary *)margeDictionaryWithDict:(NSDictionary *)dict1
                                     dict:(NSDictionary *)dict2{
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary *resultTemp = [NSMutableDictionary dictionaryWithDictionary:dict1];
    
    [resultTemp addEntriesFromDictionary:dict2];
    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if ([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] mergeDictionary: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            } else {
                [result setObject: obj forKey: key];
            }
        }else if([dict2 objectForKey:key]){
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] mergeDictionary: (NSDictionary *) obj];
                [result setObject: newVal forKey: key];
            }else{
                [result setObject: obj forKey: key];
            }
        }
    }];
    return (NSDictionary *) [result mutableCopy];
}

/** 合并入一个NSDictionary */
- (NSDictionary *)mergeDictionary:(NSDictionary *)dict{
    return [[self class] margeDictionaryWithDict:self dict:dict];
}

@end
