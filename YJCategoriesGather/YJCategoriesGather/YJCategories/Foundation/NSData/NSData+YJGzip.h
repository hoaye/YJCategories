//
//  NSData+YJGzip.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (YJGzip)

/** GZIP压缩  level 压缩级别*/
- (NSData *)gzippedDataWithCompressionLevel:(float)level;

/** 默认压缩级别为-1 */
- (NSData *)gzippedDataLevelDefault;

/** 解压数据 */
- (NSData *)gunzippedData;

/** 是否是压缩的数据 */
- (BOOL)isGzippedData;

@end
