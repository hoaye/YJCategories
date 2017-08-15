//
//  NSObject+YJKeyValueObserving.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/5/19.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YJKeyValueObserving)

@property (nonatomic, strong) NSMutableArray *keyPathObservers; /**< 保存监察者们 @{@"keyPath":observer}*/

/** 安全添加kvo */
- (void)yj_addSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

/** 安全移除kvo */
- (void)yj_removeSafeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

/** 移除本类所有的监听者们 */
- (void)yj_removeSafeAllObservers;

@end
