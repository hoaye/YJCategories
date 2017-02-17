//
//  NSDictionary+YJExtention.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/17.
//  Copyright © 2017年 Houmanager. All rights reserved.
//

#import "NSDictionary+YJExtention.h"

@implementation NSDictionary (YJExtention)

/** NSDictionary->NSString */
- (NSString *)convertToJSONString{
    
    NSData * data = [self convertToJSONData];
    if (data) {
        __autoreleasing NSString *  string=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return string;
    }
    return nil;
}

/** NSDictionary->NSData */
- (NSData *)convertToJSONData{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    NSError *error = nil;
    NSData  *data   = nil;
    NSException *exce = nil;
    @try {
        ///这里的options参数为kNilOptions,转换为json的时候不添加\n格式化换行
        ///当该参数为NSJSONWritingPrettyPrinted时，添加\n格式化换行，方便阅读
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

@end
