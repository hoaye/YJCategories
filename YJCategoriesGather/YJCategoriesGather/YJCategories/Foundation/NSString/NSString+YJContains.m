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
    if ([self containsString:@"\\s+"]) {
        return YES;
    }
    return NO;
}

@end
