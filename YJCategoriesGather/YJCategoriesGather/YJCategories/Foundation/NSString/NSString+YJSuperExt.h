//
//  NSString+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJSuperExt)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string;

#pragma mark - remove
/** 移除字符串中的所有空白 */
- (NSString *)yj_removeBlank;
/** 清除html标签 */
- (NSString *)yj_stringByStrippingHTML;
/** 清除js脚本 */
- (NSString *)yj_stringByRemovingScriptsAndStrippingHTML;

/** 将字符串Url里面的参数解析出来 */
- (NSDictionary *)yj_parameterDictionary;

/** 翻转字符串 abc -> cba*/
- (NSString *)yj_reverseString;



@end
