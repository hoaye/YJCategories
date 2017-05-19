//
//  NSObject+YJKeyValueObserving.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/5/19.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSObject+YJKeyValueObserving.h"
#import <objc/runtime.h>

static char const *const kSafeObserversKey = "kSafeObserversKey";

@implementation NSObject (YJKeyValueObserving)

- (void)setKeyPathObservers:(NSMutableArray *)keyPathObservers{
    objc_setAssociatedObject(self, kSafeObserversKey, keyPathObservers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)keyPathObservers{
    NSMutableArray *getObservers = objc_getAssociatedObject(self, kSafeObserversKey);
    if (getObservers) {
        return getObservers;
    }else{
        self.keyPathObservers = [NSMutableArray array];
        return self.keyPathObservers;
    }
}

- (void)yj_addSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{

    if (keyPath == nil || observer == nil) {
        return;
    }
    NSDictionary *observerInfo = @{keyPath:observer};
    
    if (![self.keyPathObservers containsObject:observerInfo]) {
        [self.keyPathObservers addObject:observerInfo];
        [self addObserver:observer forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)yj_removeSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath{
    
    if (keyPath == nil || observer == nil) {
        return;
    }
    
    NSDictionary *observerInfo = @{keyPath:observer};
    if ([self.keyPathObservers containsObject:observerInfo]) {
        [self.keyPathObservers removeObject:observerInfo];
        [self removeObserver:observer forKeyPath:keyPath];
    }
}

- (void)yj_removeSafeAllObservers{
    
    for (NSInteger i = 0; i < self.keyPathObservers.count; i++) {
        NSDictionary *keyObserver = [self.keyPathObservers objectAtIndex:i];
        NSString *keyPath = [keyObserver.allKeys firstObject];
        id observer = [keyObserver.allValues firstObject];
        [self yj_removeSafeObserver:observer forKeyPath:keyPath];
    }
}

@end
