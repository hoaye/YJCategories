//
//  NSDateFormatter+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDateFormatter+YJSuperExt.h"

@implementation NSDateFormatter (YJSuperExt)

/** 根据 dateString 和 format 返回 NSDate */
+ (NSDate *)yj_dateWithString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    return [inputFormatter dateFromString:dateString];
}

/** 根据 date 和 format 返回字符串日期 */
+ (NSString *)yj_stringWithDate:(NSDate *)date format:(NSString *)format{
    return [self _yj_stringWithDate:date format:format];
}

/** 
 G:公元时代，例如AD公元
 yy:年的后2位
 yyyy:完整年
 MM:月，显示为1-12
 MMM:月，显示为英文月份简写,如Jan
 MMMM:月，显示为英文月份全称，如Janualy
 dd:日，2位数表示，如02
 d:日，1-2位显示，如2
 EEE:简写星期几，如Sun
 EEEE:全写星期几，如Sunday
 aa:上下午，AM/PM
 H:时，24小时制，0-23
 K：时，12小时制，0-11
 m:分，1-2位
 mm:分，2位
 s:秒，1-2位
 ss:秒，2位
 S:毫秒
 */

+ (NSString *)yj_MMddyyyyFormat{
    return @"MMddyyyy";
}

/** yyyy-MM-dd 格式 */
+ (NSString *)yj_yyyyMMddFormat{
    return @"yyyy-MM-dd";
}

+ (NSString *)yj_HHmmssFormat{
    return @"HH:mm:ss";
}

+ (NSString *)yj_yyyyMMddHHmmssFormat{
    return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)yj_yyyyMMddHHmmssSSSFormat{
    return @"yyyy-MM-ddHH:mm:ss.SSS";
}

#pragma mark - Private
/** 根据指定format返回 String 时间 */
+ (NSString *)_yj_stringWithDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

@end
