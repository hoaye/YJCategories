//
//  NSString+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJSuperExt.h"

@implementation NSString (YJSuperExt)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string{
    if (string) {
        return string;
    }else{
        NSString * blankString = @"";
        return blankString;
    }
}

/** 移除字符串中的所有空白 */
- (NSString *)yj_removeBlank{
    if (self == nil || [self isEqual:[NSNull null]]) {
        return nil;
    }
    return [self stringByReplacingOccurrencesOfString:@"\\s+" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [self length])];
}

/** 将字符串Url里面的参数解析出来 */
- (NSDictionary *)yj_parameterDictionary{
    
    NSString *parameterString = nil;
    // 如果没有?就是没有参数
    if ([self containsString:@"?"]) {
        NSArray *parameterStrings = [self componentsSeparatedByString:@"?"];
        if (parameterStrings.count > 1) {
            parameterString = [parameterStrings lastObject];
        }else{
            return nil;
        }
    }else{
        return nil;
    }
    
    // 如果存在参数才继续进行
    if (parameterString) {
        parameterString = [parameterString yj_removeBlank];
    }else{
        return nil;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *parameters = [parameterString componentsSeparatedByString:@"&"];
    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
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
