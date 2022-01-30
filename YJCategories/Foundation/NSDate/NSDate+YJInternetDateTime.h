//
//  NSDate+YJInternetDateTime.h
//  YJCategoriesGather
//
//  Created by hm on 2015/3/13.
//  Copyright © 2015年 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DateFormatHint) {
    DateFormatHintNone,
    DateFormatHintRFC822,
    DateFormatHintRFC3339
};

@interface NSDate (YJInternetDateTime)

// Get date from RFC3339 or RFC822 string
// - A format/specification hint can be used to speed up,
//   otherwise both will be attempted in order to get a date
+ (NSDate *)dateFromInternetDateTimeString:(NSString *)dateString
                                formatHint:(DateFormatHint)hint;

// Get date from a string using a specific date specification
+ (NSDate *)dateFromRFC3339String:(NSString *)dateString;
+ (NSDate *)dateFromRFC822String:(NSString *)dateString;


@end
