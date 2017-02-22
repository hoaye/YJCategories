//
//  NSDate+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YJSuperExt)

@property (nonatomic, readonly) NSString *yj_shortString;       /**< 2017/2/22 16:26 */
@property (nonatomic, readonly) NSString *yj_shortDateString;   /**< 2017/2/22 */
@property (nonatomic, readonly) NSString *yj_shortTimeString;   /**< 16:28 */

@property (nonatomic, readonly) NSString *yj_mediumString;      /**< 2017年2月22日 16:30:00 */
@property (nonatomic, readonly) NSString *yj_mediumDateString;  /**< 2017年2月22日 */
@property (nonatomic, readonly) NSString *yj_mediumTimeString;  /** 16:46:59 */

@property (nonatomic, readonly) NSString *yj_longString;        /** 2017年2月22日 GMT+8 16:48:38 */
@property (nonatomic, readonly) NSString *yj_longDateString;    /** 2017年2月22日 */
@property (nonatomic, readonly) NSString *yj_longTimeString;    /** GMT+8 16:54:03 */

/** 当前日历 */
+ (NSCalendar *)yj_currentCalendar;

// 日期分解
/** 年、月、日、时、分、秒、周 */
- (NSInteger)yj_year;
- (NSInteger)yj_month;
- (NSInteger)yj_day;
- (NSInteger)yj_nearestHour; // 最接近的一个整点
- (NSInteger)yj_hour;
- (NSInteger)yj_minute;
- (NSInteger)yj_second;

- (NSInteger)yj_nthWeekday; // 该月第几周
- (NSInteger)yj_weekday;

/** 使用dateStyle timeStyle格式化时间 */
- (NSString *)yj_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/** 根据指定format返回 String 时间 */
- (NSString *)yj_stringWithFormat:(NSString *)format;

#pragma mark -- 从当前日期相对日期时间
/** 明天 */
+ (NSDate *)yj_dateTomorrow;
/** 昨天 */
+ (NSDate *)yj_dateYesterday;
/** 今天后几天 */
+ (NSDate *)yj_dateWithDaysFromNow:(NSInteger)days;
/** 今天前几天 */
+ (NSDate *)yj_dateWithDaysBeforeNow:(NSInteger)days;
/** 当前小时后dHours个小时 */
+ (NSDate *)yj_dateWithHoursFromNow:(NSInteger)dHours;
/** 当前小时前dHours个小时 */
+ (NSDate *)yj_dateWithHoursBeforeNow:(NSInteger)dHours;
/** 当前分钟后dMinutes个分钟 */
+ (NSDate *)yj_dateWithMinutesFromNow:(NSInteger)dMinutes;
/** 当前分钟前dMinutes个分钟 */
+ (NSDate *)yj_dateWithMinutesBeforeNow:(NSInteger)dMinutes;





@end
