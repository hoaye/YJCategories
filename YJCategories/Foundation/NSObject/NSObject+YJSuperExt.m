//
//  NSObject+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSObject+YJSuperExt.h"
#import <objc/runtime.h>
#import <mach/mach_time.h>  // for mach_absolute_time() and friends

// 程序执行时间，将执行部分放入block
CGFloat RunTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
    
} // RunTimeBlock

// swizzleMethod
static void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSObject (YJSuperExt)

/** 模型是否包含空对象值nil */
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

/** 交换对象方法 */
+ (void)yj_exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

/** 交换类方法 */
+ (void)yj_exchangeClassMethod1:(SEL)method1 method2:(SEL)method2{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

- (id)performSelector:(SEL)aSelector withObjectsYJ_Ext:(NSArray *)objects{
    
    NSMethodSignature * signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    
    if (!signature) {return nil;}
    
    NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    
    NSInteger paramsCount = signature.numberOfArguments - 2;
    paramsCount = MIN(paramsCount, objects.count);
    
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) { continue; }
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    [invocation invoke];
    
    id returnValue = nil;
    if (signature.methodReturnLength) { [invocation getReturnValue:&returnValue]; }
    return returnValue;
}

- (NSString *)debugDescription{
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSString class]])
    {
        return self.debugDescription;
    }
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = [self valueForKey:name]?:@"nil"; // 默认值为nil字符串
        [dictionary setObject:value forKey:name];
    }
    free(properties);
    return [NSString stringWithFormat:@"<%@: %p> -- %@", [self class], self, dictionary];
}

@end
