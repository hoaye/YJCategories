//
//  NSString+Hashing.h
//  YJMD5AndSoOn
//
//  Created by YJHou on 15/11/28.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

#pragma mark - 加密
/** MD5 加密 */
- (NSString *)yj_md5String;

/** SHA1 加密*/
- (NSString *)yj_sha1String;

/** SHA 256 加密 */
- (NSString *)yj_sha256String;

/** SHA 512 加密 */
- (NSString *)yj_sha512String;


#pragma mark - HMAC 加密
/** HMAC MD5 加密 */
- (NSString *)yj_hmacMD5StringWithKey:(NSString *)key;

/**
 *  计算HMAC SHA1 加密 */
- (NSString *)yj_hmacSHA1StringWithKey:(NSString *)key;

/** HMAC SHA256 加密*/
- (NSString *)yj_hmacSHA256StringWithKey:(NSString *)key;

/** HMAC SHA512 加密 */
- (NSString *)yj_hmacSHA512StringWithKey:(NSString *)key;


#pragma mark - 文件加密

/** 文件的MD5 加密*/
- (NSString *)yj_fileMD5Hash;

/** 文件的SHA1 加密 */
- (NSString *)yj_fileSHA1Hash;

/** 文件的SHA256 加密 */
- (NSString *)yj_fileSHA256Hash;

/** 文件的SHA512 加密 */
- (NSString *)yj_fileSHA512Hash;

@end
