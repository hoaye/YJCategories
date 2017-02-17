//
//  NSDictionary+YJExtention.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJExtention)

/** 转换为 NSString */
- (NSString *)convertToJSONString;

/** 转换为 NSData */
- (NSData *)convertToJSONData;

@end
