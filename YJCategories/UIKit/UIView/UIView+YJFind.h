//
//  UIView+YJFind.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJFind)

/** 找到指定类名的subview子对象 */
- (id)yj_findSubViewWithSubViewClass:(Class)clazz;

/** 找到指定类名的SuperView对象 */
- (id)yj_findSuperViewWithSuperViewClass:(Class)clazz;

/** 找到第一响应者 */
- (UIView *)yj_findFirstResponder;

/** 找到第一响应者并注销 */
- (BOOL)yj_findFirstResponderAndResign;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)yj_findSelfInViewController;

@end
