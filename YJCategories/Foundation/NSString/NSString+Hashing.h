//
//  NSString+Hashing.h
//  YJMD5AndSoOn
//
//  Created by YJHou on 15/11/28.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSString *)MD5Hash;

@end
