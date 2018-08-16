//
//  NSFileManager+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (YJSuperExt)

/** DocumentsURL */
+ (NSURL *)yj_documentsURL;

/** LibraryURL */
+ (NSURL *)yj_libraryURL;

/** CachesURL */
+ (NSURL *)yj_cachesURL;

/** 设置path跳过备份 */
+ (BOOL)yj_addSkipBackupAttributeToFile:(NSString *)path;

/** 可用磁盘空间 */
+ (double)yj_availableDiskSpace;

/** 获取应用沙盒根路径 */
+ (NSString *)yj_homePath;

/** 获取Tmp目录路径 */
+ (NSString *)yj_tmpPath;

/**
 file is Exists

 @param filePath filePath
 @return file exists or not
 */
- (BOOL)yj_isFileExists:(NSString *)filePath;

/**
 判断文件是否超时

 @param filePath filePath
 @param timeout timeout
 @return timeout or not
 */
- (BOOL)yj_isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout;

@end
