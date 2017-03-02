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

@end
