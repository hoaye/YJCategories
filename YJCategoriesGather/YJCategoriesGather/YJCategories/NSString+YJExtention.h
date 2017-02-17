//
//  NSString+YJExtention.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJExtention)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string;

@end
