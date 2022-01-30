//
//  NSDate+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDate+YJSuperExt.h"

#define YJ_EACH_MINUTE	60
#define YJ_EACH_HOUR	3600
#define YJ_EACH_DAY	    86400
#define YJ_EACH_WEEK	604800
#define YJ_EACH_YEAR	31556926

/** 日期组成部分 */
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define YJ_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({ \
unsigned components;\
if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
}else{ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
} \
components; \
})\
_Pragma("clang diagnostic pop") \

#else
#define YJ_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({\
unsigned components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
components; \
})\
_Pragma("clang diagnostic pop") \

#endif

@implementation NSDate (YJSuperExt)

/** 当前日历 */
+ (NSCalendar *)yj_currentCalendar{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - 日期拆解
/** 年 */
- (NSInteger)yj_year{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.year;
}

- (NSInteger)yj_month{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.month;
}

/** 返回英文月份 如"January" */
+ (NSString *)yj_monthWithMonthNumber:(NSInteger)month{
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

- (NSInteger)yj_day{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.day;
}

- (NSInteger)yj_nearestHour{
    
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YJ_EACH_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =  [[NSDate yj_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}

- (NSInteger)yj_hour{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.hour;
}

- (NSInteger)yj_minute{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.minute;
}

- (NSInteger)yj_second{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.second;
}

- (NSInteger)yj_nthWeekday{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger)yj_weekday{
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekday;
}

/** "星期几" 返回 */
- (NSString *)yj_weekDayString{
    switch([self yj_weekday]) {
        case 1:
            return @"星期日";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

#pragma mark - 格式化日期
/** 使用dateStyle timeStyle格式化时间 */
- (NSString *)yj_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

/** 根据指定format返回 String 时间 */
- (NSString *)yj_stringWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *)yj_shortString{
    return [self yj_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)yj_shortDateString{
    return [self yj_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)yj_shortTimeString{
    return [self yj_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)yj_mediumString{
    return [self yj_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)yj_mediumTimeString{
    return [self yj_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *)yj_mediumDateString{
    return [self yj_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)yj_longString{
    return [self yj_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)yj_longTimeString{
    return [self yj_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *)yj_longDateString{
    return [self yj_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - 从当前日期相对日期时间

/** 增加 dYears 年的时间 */
- (NSDate *)yj_dateByAddingYears:(NSInteger)dYears{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/** 增加 dMonths 月时间 */
- (NSDate *)yj_dateByAddingMonths:(NSInteger)dMonths{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

/** 增加 days 天时间 */
- (NSDate *)yj_dateByAddingDays:(NSUInteger)days{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

/** 当前时间增加 dHours 个小时 */
- (NSDate *)yj_dateByAddingHours:(NSInteger)dHours{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YJ_EACH_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/** 当前时间增加 dMinutes 分钟 */
- (NSDate *)yj_dateByAddingMinutes:(NSInteger)dMinutes{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YJ_EACH_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 时间比较

/** 比较年月日是否相等 */
- (BOOL)yj_isEqualToDateIgnoreTime:(NSDate *)aDate{
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    return ((components1.year == components2.year) && (components1.month == components2.month) && (components1.day == components2.day));
}

/** 两个时间的差 */
- (NSDateComponents *)yj_componentsWithOffsetFromDate:(NSDate *)aDate{
    return [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate toDate:self options:0];
}

/** 是否是今天 */
- (BOOL)yj_isToday{
    return [self yj_isEqualToDateIgnoreTime:[NSDate date]];
}

/** 是否是明天 */
- (BOOL)yj_isTomorrow{
    return [self yj_isEqualToDateIgnoreTime:[[NSDate date] yj_dateByAddingDays:1]];
}

/** 是否是昨天 */
- (BOOL)yj_isYesterday{
    return [self yj_isEqualToDateIgnoreTime:[[NSDate date] yj_dateByAddingDays:-1]];
}

/** 是否是同一周 */
- (BOOL)yj_isEqualWeekWithDate:(NSDate *)aDate{
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];

    if (components1.weekOfYear != components2.weekOfYear) return NO;
    return (fabs([self timeIntervalSinceDate:aDate]) < YJ_EACH_WEEK);
}

/** 是否是本周 */
- (BOOL)yj_isThisWeek{
    return [self yj_isEqualWeekWithDate:[NSDate date]];
}

/** 是否是上一周 */
- (BOOL)yj_isNextWeek{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YJ_EACH_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self yj_isEqualWeekWithDate:newDate];
}

/** 是否是上一周 */
- (BOOL)yj_isBeforeWeek{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - YJ_EACH_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self yj_isEqualWeekWithDate:newDate];
}

/** 是否是同一个月 */
- (BOOL)yj_isEqualMonthWithDate:(NSDate *)aDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    
    return ((components1.month == components2.month) && (components1.year == components2.year));
}

/** 是否是本月 */
- (BOOL)yj_isThisMonth{
    return [self yj_isEqualMonthWithDate:[NSDate date]];
}

/** 是否是上一个月 */
- (BOOL)yj_isBeforeMonth{
    return [self yj_isEqualMonthWithDate:[[NSDate date] yj_dateByAddingMonths:-1]];
}

/** 是否是下一个月 */
- (BOOL)yj_isNextMonth{
    return [self yj_isEqualMonthWithDate:[[NSDate date] yj_dateByAddingMonths:1]];
}

/** 是否是同一年 */
- (BOOL)yj_isEqualYearWithDate:(NSDate *)aDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit  fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return (components1.year == components2.year);
}

/** 是否是今年 */
- (BOOL) jk_isThisYear{
    return [self yj_isEqualYearWithDate:[NSDate date]];
}

/** 是否是上一年 */
- (BOOL)yj_isBeforeYear{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year - 1));
}

/** 是否是下一年 */
- (BOOL)yj_isNextYear{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year + 1));
}

/** 是否早于 aDate  */
- (BOOL)yj_isEarlierThanDate:(NSDate *)aDate{
    return ([self compare:aDate] == NSOrderedAscending);
}

/** 是否晚于 aDate  */
- (BOOL)yj_isLaterThanDate:(NSDate *)aDate{
    return ([self compare:aDate] == NSOrderedDescending);
}

/** 是否是周末 */
- (BOOL)yj_isTypicallyWeekend{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitMonth fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) || (components.weekday == 7)){
        return YES;
    }
    return NO;
}

/** 是否是工作日 */
- (BOOL)yj_isTypicallyWorkday{
    return ![self yj_isTypicallyWeekend];
}

/** 时隔 几年 */
- (NSInteger)yj_dateYearAfterDate:(NSDate *)anotherDate{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendar] components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.year * -1;
}

/** 时间相隔几个月 */
- (NSInteger)yj_dateMonthsAfterDate:(NSDate *)anotherDate{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.month * -1;
}

/** 时间相隔几天 方式一*/
- (NSInteger)jk_dateDaysAfterDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate yj_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif

    return components.day * -1;
}

/** aDate 后第几天 方式二 */
- (NSInteger)yj_dateDaysCalculateAfterDate:(NSDate *)aDate{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / YJ_EACH_DAY);
}

/** aDate 后多少小时 */
- (NSInteger)yj_dateHoursAfterDate:(NSDate *)aDate{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / YJ_EACH_HOUR);
}

/** aDate 后多少分钟 */
- (NSInteger)yj_minutesAfterDate:(NSDate *)aDate{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger)(ti / YJ_EACH_MINUTE);
}

#pragma mark - 时间判断
/** 判断是否是润年 */
- (BOOL)yj_isLeapYear{
    NSUInteger year = [self yj_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

/** 一年有多少天 */
- (NSUInteger)yj_daysInThisYear{
    return [self yj_isLeapYear]?366:365;
}

/** 今天是今年的第多少天 */
- (NSUInteger)yj_dayOfThisYear{
    
    int month[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    if ([self yj_isLeapYear]) {
        month[1] = 29;
    }
    int BeforeDays = 0;
    for (NSInteger i = 0; i < [self yj_month] - 1; i++) {
        BeforeDays += month[i];
    }
    BeforeDays = BeforeDays + (int)[self yj_day];
    return BeforeDays;
}

/** 这个月有多少天 */
- (NSUInteger)yj_daysInMonth:(NSUInteger)month{
    return [NSDate yj_daysInMonth:self month:month];
}

/** date 月有多少天 */
+ (NSUInteger)yj_daysInMonth:(NSDate *)date month:(NSUInteger)month{
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date yj_isLeapYear]?29:28;
    }
    return 30;
}

/** 该月的第一天 */
- (NSDate *)yj_beginDayOfMonth{
    return [self yj_dateByAddingDays:-[self yj_day] + 1];
}

/** 该月的最后一天 */
- (NSDate *)yj_lastDayOfMonth{
    NSDate *lastDate = [self yj_beginDayOfMonth];
    return [[lastDate yj_dateByAddingMonths:1] yj_dateByAddingDays:-1];
}

/** 返回格式为 YYYY-MM-dd 的日期 */
- (NSString *)yj_dateStringFormatYMD{
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",(long)[self yj_year],(long)[self yj_month], (long)[self yj_day]];
}

/** 时间信息 */
- (NSString *)yj_timeInfo{
    return [NSDate yj_timeInfoWithDate:self];
}

/** 根据date 返回字符类型日期 */
+ (NSString *)yj_timeInfoWithDate:(NSDate *)date{
    return [self yj_timeInfoWithDateString:[self _yj_stringWithDate:date format:[self _yj_yyyyMMddHHmmssFormat]]];
}

/** 返回时间信息 */
+ (NSString *)yj_timeInfoWithDateString:(NSString *)dateString{
    NSDate *date = [self _yj_dateWithString:dateString format:[self _yj_yyyyMMddHHmmssFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval timeDistance = -[date timeIntervalSinceDate:curDate];
    
    int monthDistance = (int)([curDate yj_month] - [date yj_month]);
    int yearDistance  = (int)([curDate yj_year]  - [date yj_year]);
    int dayDistance   = (int)([curDate yj_day]   - [date yj_day]);
    
    NSTimeInterval resultTime = 1.0;
    
    if (timeDistance < YJ_EACH_HOUR) { // 1小时内显示"xx分钟前"
        resultTime = timeDistance / YJ_EACH_MINUTE; // value = 0~59.99
        if (resultTime < 1.0) { // 小于1分钟
            return @"刚刚";
        }else{ // 1分钟到59.99
            if (resultTime > 59.0f) {
                return @"59分钟前";
            }else{
                return [NSString stringWithFormat:@"%.0f分钟前", resultTime];
            }
        }
    }else if (timeDistance < YJ_EACH_HOUR * 24){ // 1小时~24小时 其中可能包括今天和昨天
        NSDate *criticalDate = [date yj_dateByAddingMinutes:-(timeDistance / 60)];
        if ([criticalDate yj_day] == [date yj_day]) { // 今天
            resultTime = resultTime / YJ_EACH_HOUR;
            resultTime = resultTime <= 0.0 ? 1.0 : resultTime;
            return [NSString stringWithFormat:@"%.0f小时前", resultTime];
        }else{ // 已经是昨天了
            return @"昨天";
        }
    }else if (timeDistance < YJ_EACH_HOUR * 24 * 2){ // 24小时到48小时, 其中可能包括昨天和前天
        NSDate *criticalDate = [curDate yj_dateByAddingMinutes:-(timeDistance / 60.0f)];
        if ([criticalDate yj_day] == [curDate yj_day] - 1) { // 昨天
            return @"昨天";
        }else{ // 已经是前天了
            return @"前天";
        }
    }

    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(yearDistance) == 0 && abs(monthDistance) <= 1)
             || (abs(yearDistance) == 1 && [curDate yj_month] == 1 && [date yj_month] == 12)) {
        int retDay = 0;
        if (yearDistance == 0) { // 同年
            if (monthDistance == 0) { // 同月
                retDay = dayDistance;
            }
        }
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self yj_daysInMonth:date month:[date yj_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate yj_day] + (totalDays - (int)[date yj_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(yearDistance) <= 1) {
            if (yearDistance == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(monthDistance)];
            }
            
            // 隔年
            int month = (int)[curDate yj_month];
            int preMonth = (int)[date yj_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(yearDistance)];
    }
    return @"1小时前";
}




#pragma mark - Private
/** 根据 dateString 和 format 返回 NSDate */
+ (NSDate *)_yj_dateWithString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    return [inputFormatter dateFromString:dateString];
}

/** 根据 date 和 format 返回字符串日期 */
+ (NSString *)_yj_stringWithDate:(NSDate *)date format:(NSString *)format{
    return [date yj_stringWithFormat:format];
}
/** 完整的 yyyy-MM-dd HH:mm:ss */
+ (NSString *)_yj_yyyyMMddHHmmssFormat{
    return @"yyyy-MM-dd HH:mm:ss";
}

// 秒数时间转换
+ (NSString *)yj_distanceTimeWithBeforeTime:(double)time {
    
    NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
    double distanceTime = now - time;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60) {
        //小于一分钟
        distanceStr = @"刚刚";
    } else if (distanceTime <60*60) {
        //时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    } else if (distanceTime <24*60*60 && [nowDay integerValue] == [lastDay integerValue]) {
        //时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    } else if (distanceTime<24*60*60*2 && [nowDay integerValue] != [lastDay integerValue]){
        
        if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        } else {
            [df setDateFormat:@"MM-dd HH:mm"];
            distanceStr = [df stringFromDate:beDate];
        }
        
    } else if (distanceTime <24*60*60*365) {
        [df setDateFormat:@"MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    } else {
        [df setDateFormat:@"yyyy-MM-dd HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
}







@end
