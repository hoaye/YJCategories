//
//  NSDate+YJStartEnd.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YJStartEnd)

#pragma mark - 时间的开始和结束
/** 某天的0点0分0秒 */
- (NSDate *)yj_dateAtStartOfDay;

/** 某天的23点59分59秒 */
- (NSDate *)yj_dateAtEndOfDay;

/** 该日期的周开始日期 */
- (NSDate *)yj_dateAtStartOfWeek;

/** 该日期的周结束日期 */
- (NSDate *)yj_dateAtEndOfWeek;

/** 该月的开始 */
- (NSDate *)yj_dateAtStartOfMonth;

/** 该月的结束 */
- (NSDate *)yj_dateAtEndOfMonth;

/** 该年的第一天 */
- (NSDate *)yj_dateAtStartOfYear;

/** 该年的最后一天 */
- (NSDate *)yj_dateAtEndOfYear;


@end
