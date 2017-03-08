//
//  NSString+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 匹配字符串的相似度 */
typedef NS_OPTIONS(NSUInteger, YJNSStringScoreOption) {
    YJNSStringScoreOptionNone                     = 1 << 0,
    YJNSStringScoreOptionFavorSmallerWords        = 1 << 1,
    YJNSStringScoreOptionReducedLongStringPenalty = 1 << 2
};

@interface NSString (YJSuperExt)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string;

#pragma mark - 装换Convert

/** NSString -> NSDictionary */
- (NSDictionary *)yj_convertToDictionary;

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

/** Unicode编码的字符串转成NSString */
- (NSString *)yj_makeUnicodeToString;

/** 字符数量 */
- (int)yj_wordsCount;

/** 精准分段 功能特性如下：1、分页比较准确 2、根据CGRect来计算页数 3、利用多线程加载和分页 */
- (NSArray *)yj_getPagesOfString:(NSString *)string
                            font:(UIFont*)font
                          inRect:(CGRect)rect;

/** 字符串的匹配相似度 */
- (CGFloat)yj_scoreAgainst:(NSString *)anotherString fuzziness:(NSNumber *)fuzziness options:(YJNSStringScoreOption)options;



@end
