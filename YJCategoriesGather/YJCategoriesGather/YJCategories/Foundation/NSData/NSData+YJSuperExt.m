//
//  NSData+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/19.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSData+YJSuperExt.h"

@implementation NSData (YJSuperExt)

/** 将APNS NSData类型token 格式化成字符串 */
- (NSString *)APNSTokenString{
    
    return [[[[self description]
              stringByReplacingOccurrencesOfString: @"<" withString: @""]
             stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
}

@end
