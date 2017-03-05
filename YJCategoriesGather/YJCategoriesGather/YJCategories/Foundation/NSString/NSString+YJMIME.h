//
//  NSString+YJMIME.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJMIME)

/** 根据文件url后缀 返回对应的MIMEType */
- (NSString *)yj_MIMEType;

/** 根据扩展返回 MIMEType */
+ (NSString *)yj_MIMETypeForExtension:(NSString *)extension;

/** 常见MIME集合 */
+ (NSDictionary *)yj_MIMEDict;

@end
