//
//  NSString+YJContains.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJContains.h"

@implementation NSString (YJContains)

/** 是否包含空格 */
- (BOOL)yj_isContainBlank{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

/** 是否包含中文 */
- (BOOL)yj_isContainChinese{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

/** 是否包含字符 string */
- (BOOL)yj_containsString:(NSString *)string{
    NSRange rang = [self rangeOfString:string];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

/** 是否包含字符集合 set */
- (BOOL)yj_containsCharacterSet:(NSCharacterSet *)set{
    NSRange rang = [self rangeOfCharacterFromSet:set];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}


@end
