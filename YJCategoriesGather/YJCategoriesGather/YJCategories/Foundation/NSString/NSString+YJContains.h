//
//  NSString+YJContains.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJContains)

/** 是否包含空格 */
- (BOOL)yj_isContainBlank;

/** 是否包含中文 */
- (BOOL)yj_isContainChinese;

/** 是否包含字符 string */
- (BOOL)yj_containsString:(NSString *)string;

/** Unicode编码的字符串转成NSString */
- (NSString *)yj_makeUnicodeToString;

/** 是否包含字符集合 set */
- (BOOL)yj_containsCharacterSet:(NSCharacterSet *)set;

/** 字符数量 */
- (int)yj_wordsCount;

@end
