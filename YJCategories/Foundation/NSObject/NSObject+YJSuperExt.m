//
//  NSObject+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSObject+YJSuperExt.h"
#import <objc/runtime.h>

@implementation NSObject (YJSuperExt)

/** 模型是否包含空值nil */
- (BOOL)isContainsNilObject{
    unsigned count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t propertyValue = properties[i];
        const char *propertyName = property_getName(propertyValue);
        SEL getSeletor = NSSelectorFromString([NSString stringWithUTF8String:propertyName]);
        
        if ([self respondsToSelector:getSeletor]) {
            NSMethodSignature *signature = [self methodSignatureForSelector:getSeletor];//方法签名
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];//调用对象
            [invocation setTarget:self];//设置target
            [invocation setSelector:getSeletor];//设置selector
            NSObject *__unsafe_unretained returnValue = nil;//设置返回值
            [invocation invoke];//开始调用
            [invocation getReturnValue:&returnValue];//接收返回值
#if DEBUG
            NSLog(@"property value is:--> %@ = %@", [NSString stringWithUTF8String:propertyName], returnValue);
#endif
            if (returnValue == nil) {
                return YES;
            }
        }
    }
    return NO;
}

@end
