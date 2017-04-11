//
//  NSObject+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YJSuperExt)

/** 模型是否包含空值nil */
- (BOOL)isContainsNilObject;

/** 交换对象方法 */
+ (void)yj_exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;
/** 交换类方法 */
+ (void)yj_exchangeClassMethod1:(SEL)method1 method2:(SEL)method2;

@end
