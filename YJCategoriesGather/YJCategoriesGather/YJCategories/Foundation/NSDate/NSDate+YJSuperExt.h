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

/** 增加 dYears 年的时间 */
- (NSDate *)yj_dateByAddingYears:(NSInteger)dYears;

/** 增加 dMonths 月时间 */
- (NSDate *)yj_dateByAddingMonths:(NSInteger)dMonths;

/** 增加几天时间 */
- (NSDate *)yj_dateByAddingDays:(NSUInteger)days;

/** 当前时间增加几个小时 */
- (NSDate *)yj_dateByAddingHours:(NSInteger)dHours;

/** 当前时间增加 dMinutes 分钟 */
- (NSDate *)yj_dateByAddingMinutes:(NSInteger)dMinutes;

#pragma mark - 时间比较
/** 比较年月日是否相等 */
- (BOOL)yj_isEqualToDateIgnoreTime:(NSDate *)aDate;

/** 两个时间的差 */
- (NSDateComponents *)yj_componentsWithOffsetFromDate:(NSDate *)aDate;

// ------ 天 --------
/** 是否是今天 */
- (BOOL)yj_isToday;

/** 是否是明天 */
- (BOOL)yj_isTomorrow;

/** 是否是昨天 */
- (BOOL)yj_isYesterday;
//------- 周 ---------
/** 是否是同一周 */
- (BOOL)yj_isEqualWeekWithDate:(NSDate *)aDate;

/** 是否是本周 */
- (BOOL)yj_isThisWeek;

/** 是否是上一周 */
- (BOOL)yj_isNextWeek;

/** 是否是上一周 */
- (BOOL)yj_isBeforeWeek;

// ------- 月 ------
/** 是否是同一个月 */
- (BOOL)yj_isEqualMonthWithDate:(NSDate *)aDate;

/** 是否是本月 */
- (BOOL)yj_isThisMonth;

/** 是否是上一个月 */
- (BOOL)yj_isBeforeMonth;

/** 是否是下一个月 */
- (BOOL)yj_isNextMonth;

// -------- 年 -----------
/** 是否是同一年 */
- (BOOL)yj_isEqualYearWithDate:(NSDate *)aDate;

/** 是否是今年 */
- (BOOL) jk_isThisYear;

/** 是否是上一年 */
- (BOOL)yj_isBeforeYear;

/** 是否是下一年 */
- (BOOL)yj_isNextYear;

// ------- 早迟比较 ---------
/** 是否早于 aDate  */
- (BOOL)yj_isEarlierThanDate:(NSDate *)aDate;

/** 是否晚于 aDate  */
- (BOOL)yj_isLaterThanDate:(NSDate *)aDate;

/** 是否是周末 */
- (BOOL)yj_isTypicallyWeekend;

/** 是否是工作日 */
- (BOOL)yj_isTypicallyWorkday;









@end
