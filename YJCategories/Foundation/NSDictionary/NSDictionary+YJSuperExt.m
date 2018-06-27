//
//  NSDictionary+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSDictionary+YJSuperExt.h"
#import <objc/runtime.h>

@implementation NSDictionary (YJSuperExt)

/** NSDictionary->NSString */
- (NSString *)yj_convertToJSONString{
    
    NSData * data = [self yj_convertToJSONData];
    if (data) {
        __autoreleasing NSString *  string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return string;
    }
    return nil;
}

/** NSDictionary->NSData */
- (NSData *)yj_convertToJSONData{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSError *error = nil;
    NSData  *data   = nil;
    NSException *exce = nil;
    @try {
        // 这里的options参数为kNilOptions,转换为json的时候不添加\n格式化换行
        // 当该参数为NSJSONWritingPrettyPrinted时，添加\n格式化换行，方便阅读
        data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    }
    @catch (NSException *exception) {
        exce = exception;
    }
    @finally {
        
    }
    if (error || exce) {
        //        NSLog(@"%@", exce);
        return nil;
    }
    return data;
}

/** 安全设置键值对 */
- (void)setSafeValue:(id)value forKey:(NSString *)key{
    if (!value || !key) {
        return;
    }
    [self setValue:value forKey:key];
}

/** 将NSDictionary转换成url 参数字符串 */
- (NSString *)yj_parameterDictToUrlString{
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in [self allKeys]) {
        if ([string length]) {
            [string appendString:@"&"];
        }
        CFStringRef escaped = CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)[[self objectForKey:key] description], NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
        [string appendFormat:@"%@=%@", key, escaped];
        CFRelease(escaped);
    }
    return string;
}

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
        Method overrideMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(_setObject:forKey:));
        method_exchangeImplementations(originMethod, overrideMethod);
        
    });
}

-(void)_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if(anObject){
        [self _setObject:anObject forKey:aKey];
        
    }else{
        NSLog(@"%@----setObjct--To---key--%@ is nil",self,aKey);
    }
}

@end
