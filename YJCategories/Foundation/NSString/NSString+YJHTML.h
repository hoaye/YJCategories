//
//  NSString+YJHTML.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJHTML)

/**
 使用Unicode 编码所有HTML实体 Get a string where internal characters that need escaping for HTML are escaped

 @return 处理完的
 */
- (NSString *)yj_stringByEscapingForHTML;

/**
 使用Ascii编码所有HTML实体  Get a string where internal characters that need escaping for HTML are escaped
 * For example, '&' become '&amp;'

 @return 处理完的
 */
- (NSString *)yj_stringByEscapingForAsciiHTML;

/**
 解码HTML实体 Get a string where internal characters that are escaped for HTML are unescaped
 * For example, '&amp;' becomes '&'
 * Handles &#32; and &#x32; cases as well

 @return 处理完的
 */
- (NSString *)yj_stringByUnescapingFromHTML;

/**
  Replace newlines with <br /> tags.

 @return 处理完的
 */
- (NSString *)yj_stringWithNewLinesAsBRs;

/**
 Remove newlines and white space from string

 @return 处理完的
 */
- (NSString *)yj_stringByRemovingNewLinesAndWhitespace;

// Wrap plain URLs in <a href="..." class="linkified">...</a>
//  - Ignores URLs inside tags (any URL beginning with =")
//  - HTTP & HTTPS schemes only
//  - Only works in iOS 4+ as we use NSRegularExpression (returns self if not supported so be careful with NSMutableStrings)
//  - Expression: (?<!=")\b((http|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?)
//  - Adapted from http://regexlib.com/REDetails.aspx?regexp_id=96
- (NSString *)yj_stringByLinkifyingURLs;

/**
 DEPRECIATED - Please use NSString stringByConvertingHTMLToPlainText

 @return 处理完的 已过期
 */
- (NSString *)yj_stringByStrippingTags __attribute__((deprecated));

/**
 将html转换为纯文本 Convert HTML To Plain Text

 @return 处理完的
 */
- (NSString *)yj_stringByConvertingHTMLToPlainText;

@end
