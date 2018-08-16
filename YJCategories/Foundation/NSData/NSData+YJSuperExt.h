//
//  NSData+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (YJSuperExt)

/** 将APNS NSData类型token 格式化成字符串 */
- (NSString *)APNSTokenString;

// 创建密匙
- (NSData *)yj_ctreatAKeyData;

@end
