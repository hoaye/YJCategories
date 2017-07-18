//
//  UITextField+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/7/18.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YJSuperExt)

/** 传入 0~9 返回 YES 否则 返回 NO */
- (BOOL)yj_validateArabicNumber:(NSString *)numberString;

/** 是否是纯数字 */
- (BOOL)yj_isPureNumandCharacters:(NSString *)string;

@end
