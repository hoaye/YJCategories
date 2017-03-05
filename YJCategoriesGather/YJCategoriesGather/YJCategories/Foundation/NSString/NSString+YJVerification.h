//
//  NSString+YJVerification.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  字符串验证类

#import <Foundation/Foundation.h>

@interface NSString (YJVerification)

/** 验证正则 regex */
- (BOOL)yj_isValidateByRegex:(NSString *)regex;

/** 手机运营商 */
- (NSString *)yj_mobileNumberAscription;

/** 手机号分服务商验证 */
- (BOOL)yj_isMobileNumberClassification;

/** 手机号有效性 */
- (BOOL)yj_isMobileNumber;

@end
