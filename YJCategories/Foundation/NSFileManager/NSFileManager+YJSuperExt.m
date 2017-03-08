//
//  NSFileManager+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSFileManager+YJSuperExt.h"

@implementation NSFileManager (YJSuperExt)

/** DocumentsURL */
+ (NSURL *)yj_documentsURL{
    return [self yj_URLForDirectory:NSDocumentDirectory];
}

/** LibraryURL */
+ (NSURL *)yj_libraryURL{
    return [self yj_URLForDirectory:NSLibraryDirectory];
}

/** CachesURL */
+ (NSURL *)yj_cachesURL{
    return [self yj_URLForDirectory:NSCachesDirectory];
}

/** 设置path跳过备份 */
+ (BOOL)yj_addSkipBackupAttributeToFile:(NSString *)path{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}
/** 可用磁盘空间 */
+ (double)yj_availableDiskSpace{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:[self yj_documentsURL].path error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}


#pragma mark - Private
/** 文件管理的 URL */
+ (NSURL *)yj_URLForDirectory:(NSSearchPathDirectory)directory{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

@end
