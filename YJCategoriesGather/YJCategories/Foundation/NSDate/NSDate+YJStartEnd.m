//
//  NSDate+YJStartEnd.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDate+YJStartEnd.h"

/** 日期组成部分 */
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define YJ_NSDATE_UTILITIES_COMPONENT_FLAGS_FOR_STARTEND \
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
#define YJ_NSDATE_UTILITIES_COMPONENT_FLAGS_FOR_STARTEND \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({\
unsigned components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
components; \
})\
_Pragma("clang diagnostic pop") \

#endif

@implementation NSDate (YJStartEnd)

/** 当前日历 */
+ (NSCalendar *)yj_currentCalendarForStartEnd{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - 时间的开始和结束
/** 某天的0点0分0秒 */
- (NSDate *)yj_dateAtStartOfDay{
    NSDateComponents *components = [[NSDate yj_currentCalendarForStartEnd] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS_FOR_STARTEND fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate yj_currentCalendarForStartEnd] dateFromComponents:components];
    
    /** 方式二
     NSCalendar *calendar = [NSCalendar currentCalendar];
     #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
     NSDateComponents *components;
     if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
     components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
     }else{
     #pragma clang diagnostic push
     #pragma clang diagnostic ignored "-Wdeprecated-declarations"
     components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
     #pragma clang diagnostic pop
     }
     #else
     NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
     #endif
     
     return [calendar dateFromComponents:components];
     */
}

/** 某天的23点59分59秒 */
- (NSDate *)yj_dateAtEndOfDay{
    NSDateComponents *components = [[NSDate yj_currentCalendarForStartEnd] components:YJ_NSDATE_UTILITIES_COMPONENT_FLAGS_FOR_STARTEND fromDate:self];
    
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [[NSDate yj_currentCalendarForStartEnd] dateFromComponents:components];
    
    /** 方式二
     NSCalendar *calendar = [NSCalendar currentCalendar];
     
     NSDateComponents *components = [[NSDateComponents alloc] init];
     [components setDay:1];
     
     return [[calendar dateByAddingComponents:components toDate:[self yj_beginningOfDay] options:0] dateByAddingTimeInterval:-1];
     */
}

/** 该日期的周开始日期 */
- (NSDate *)yj_dateAtStartOfWeek{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate yj_currentCalendarForStartEnd] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday|NSCalendarUnitDay fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate yj_currentCalendarForStartEnd] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate yj_currentCalendarForStartEnd] components:NSYearCalendarUnit | NSMonthCalendarUnit |NSWeekdayCalendarUnit| NSDayCalendarUnit fromDate:self];
#endif
    
    NSUInteger offset = ([components weekday] == [[NSDate yj_currentCalendarForStartEnd] firstWeekday]) ? 6 : [components weekday] - 2;
    [components setDay:[components day] - offset];
    
    return [[NSDate yj_currentCalendarForStartEnd] dateFromComponents:components];
}

/** 该日期的周结束日期 */
- (NSDate *)yj_dateAtEndOfWeek{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfMonth:1];
    return [[[NSDate yj_currentCalendarForStartEnd] dateByAddingComponents:components toDate:[self yj_dateAtStartOfWeek] options:0] dateByAddingTimeInterval:-1];
}

/** 该月的开始 */
- (NSDate *)yj_dateAtStartOfMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth  fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
#endif
    return [calendar dateFromComponents:components];
}

/** 该月的结束 */
- (NSDate *)yj_dateAtEndOfMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:1];
    return [[calendar dateByAddingComponents:components toDate:[self yj_dateAtStartOfMonth] options:0] dateByAddingTimeInterval:-1];
}

/** 该年的第一天 */
- (NSDate *)yj_dateAtStartOfYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [calendar components:NSCalendarUnitYear   fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [calendar components:NSYearCalendarUnit  fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [calendar components:NSYearCalendarUnit  fromDate:self];
#endif
    return [calendar dateFromComponents:components];
}

/** 该年的最后一天 */
- (NSDate *)yj_dateAtEndOfYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:1];
    
    return [[calendar dateByAddingComponents:components toDate:[self yj_dateAtStartOfYear] options:0] dateByAddingTimeInterval:-1];
}


@end
