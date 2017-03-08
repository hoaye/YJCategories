//
//  UIResponder+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (YJSuperExt)

/** 当前第一响应者 */
+ (id)yj_currentFirstResponder;

/** 响应者链 */
- (NSString *)yj_responderChainDescription;

@end
