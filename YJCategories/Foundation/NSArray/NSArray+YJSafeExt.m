//
//  NSArray+YJSafeExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2018/5/15.
//  Copyright © 2018年 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+YJSafeExt.h"
#import <objc/runtime.h>

@implementation NSArray (YJSafeExt)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method sourceMethod = class_getInstanceMethod(self, @selector(objectAtIndex:));
        Method sourceMethodI = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
        Method sourceMethodM = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
        
        Method disMethod = class_getInstanceMethod([self class], @selector(_objectAtIndex:));
        Method disMethodI = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(_iObjectAtIndex:));
        Method disMethodM = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(_mObjectAtIndex:));
        
        method_exchangeImplementations(sourceMethod, disMethod);
        method_exchangeImplementations(sourceMethodI, disMethodI);
        method_exchangeImplementations(sourceMethodM, disMethodM);
        
    });
}
- (id)_objectAtIndex:(NSUInteger)index{
    
    
    if (index < self.count) {
        return [self _objectAtIndex:index];
    }
    return nil;
}

- (id)_iObjectAtIndex:(NSUInteger)index{
    
    if (index < self.count) {
        return [self _iObjectAtIndex:index];
    }
    return nil;
    
}
- (id)_mObjectAtIndex:(NSUInteger)index{
    
    if (index < self.count) {
        return [self _mObjectAtIndex:index];
    }
    return nil;
}

@end
