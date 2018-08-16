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


+ (NSString *)yj_homePath {
    return NSHomeDirectory();
}

+ (NSString *)yj_tmpPath {
    return NSTemporaryDirectory();
}

#pragma mark - Private
/** 文件管理的 URL */
+ (NSURL *)yj_URLForDirectory:(NSSearchPathDirectory)directory{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

- (BOOL)yj_isFileExists:(NSString *)filePath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    
    return result;
}

- (BOOL)yj_isFile:(NSString *)filePath timeout:(NSTimeInterval)timeout {
    
    if ([[NSFileManager defaultManager] yj_isFileExists:filePath]) {
        NSError *error = nil;
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
        if (error) {
            return YES;
        }
        if ([attributes isKindOfClass:[NSDictionary class]] && attributes) {
            //  NSLog(@"%@", attributes);
            NSString *createDate = [attributes objectForKey:@"NSFileModificationDate"];
            createDate = [NSString stringWithFormat:@"%@", createDate];
            if (createDate.length >= 19) {
                createDate = [createDate substringToIndex:19];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                
                NSDate *sinceDate = [formatter dateFromString:createDate];
                NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:sinceDate];
                return interval <= 0;
            }
        }
    }
    return YES;
}



@end
