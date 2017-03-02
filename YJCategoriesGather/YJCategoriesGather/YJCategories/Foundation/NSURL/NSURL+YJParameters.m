//
//  NSURL+YJParameters.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSURL+YJParameters.h"

@implementation NSURL (YJParameters)

/** url参数转字典 */
- (NSDictionary *)yj_dictParameters{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    for (NSString *queryComponent in queryComponents) {
        NSArray *contents = [queryComponent componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}


@end
