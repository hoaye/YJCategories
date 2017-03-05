//
//  NSString+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJSuperExt.h"

@implementation NSString (YJSuperExt)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string{
    if (string) {
        return string;
    }else{
        NSString * blankString = @"";
        return blankString;
    }
}

#pragma mark - remove
/** 移除字符串中的所有空白 */
- (NSString *)yj_removeBlank{
    if (self == nil || [self isEqual:[NSNull null]]) {
        return nil;
    }
    return [self stringByReplacingOccurrencesOfString:@"\\s+" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [self length])];
}

/** 清除html标签 */
- (NSString *)yj_stringByStrippingHTML{
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

/** 清除js脚本 */
- (NSString *)yj_stringByRemovingScriptsAndStrippingHTML{
    NSMutableString *mString = [self mutableCopy];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult *match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString yj_stringByStrippingHTML];
}

/** 将字符串Url里面的参数解析出来 */
- (NSDictionary *)yj_parameterDictionary{
    
    NSString *parameterString = nil;
    if (self) {
        parameterString = [self yj_removeBlank];
    }else{
        return nil;
    }
    
    NSURL *urlPath = [NSURL URLWithString:parameterString];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray * parameters = [urlPath.query componentsSeparatedByString:@"&"];

    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

/** 翻转字符串 abc -> cba*/
- (NSString *)yj_reverseString{
    NSMutableString* reverseString = [[NSMutableString alloc] init];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex --;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reverseString appendString:[self substringWithRange:subStrRange]];
    }
    return reverseString;
}



@end
