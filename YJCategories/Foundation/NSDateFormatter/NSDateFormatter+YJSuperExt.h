//
//  NSDateFormatter+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (YJSuperExt)

/** 根据 dateString 和 format 返回 NSDate */
+ (NSDate *)yj_dateWithString:(NSString *)dateString format:(NSString *)format;

/** 根据 date 和 format 返回字符串日期 */
+ (NSString *)yj_stringWithDate:(NSDate *)date format:(NSString *)format;

#pragma mark - 日期格式部分
/** yyyy-MM-dd 格式 */
+ (NSString *)yj_yyyyMMddFormat;
/** HH:mm:ss 格式 */
+ (NSString *)yj_HHmmssFormat;
/** 完整的 yyyy-MM-dd HH:mm:ss */
+ (NSString *)yj_yyyyMMddHHmmssFormat;
/** 月日年 格式 */
+ (NSString *)yj_MMddyyyyFormat;
/** 带毫秒的完整的时间格式 */
+ (NSString *)yj_yyyyMMddHHmmssSSSFormat;

@end
