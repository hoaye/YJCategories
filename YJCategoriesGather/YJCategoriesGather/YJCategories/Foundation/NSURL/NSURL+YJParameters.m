//
//  NSURL+YJParameters.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/19.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSURL+YJParameters.h"

@implementation NSURL (YJParameters)

/** url参数转字典 */
- (NSDictionary *)dictParameters{
    
    NSMutableDictionary *parametersDictionary = [NSMutableDictionary dictionary];
    
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    for (NSString *queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary;
}

/** 根据参数名 取参数值 */
- (NSString *)valueForParameter:(NSString *)parameter{
    return [[self dictParameters] objectForKey:parameter];
}

@end
