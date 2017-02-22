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

@implementation NSDate (YJSuperExt)

/** 当前日历 */
+ (NSCalendar *)currentCalendar{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

@end
