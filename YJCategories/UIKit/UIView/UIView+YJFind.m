//
//  UIView+YJFind.m
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJFind.h"

@implementation UIView (YJFind)

/** 找到指定类名的subview子对象 */
- (id)yj_findSubViewWithSubViewClass:(Class)clazz{
    for (id subView in self.subviews) {
        if ([subView isKindOfClass:clazz]) {
            return subView;
        }
    }
    return nil;
}

/** 找到指定类名的SuperView对象 */
- (id)yj_findSuperViewWithSuperViewClass:(Class)clazz{
    if (self == nil) {
        return nil;
    } else if (self.superview == nil) {
        return nil;
    } else if ([self.superview isKindOfClass:clazz]) {
        return self.superview;
    } else {
        return [self.superview yj_findSuperViewWithSuperViewClass:clazz];
    }
}

/** 找到第一响应者 */
- (UIView *)yj_findFirstResponder{
    
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    for (UIView *v in self.subviews) {
        UIView *fv = [v yj_findFirstResponder];
        if (fv) {
            return fv;
        }
    }
    return nil;
}

/** 找到第一响应者并注销 */
- (BOOL)yj_findFirstResponderAndResign{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    
    for (UIView *v in self.subviews) {
        if ([v yj_findFirstResponderAndResign]) {
            return YES;
        }
    }
    return NO;
}

/** 找到当前view所在的viewcontroler */
- (UIViewController *)yj_findSelfInViewController{
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    return nil;
}

@end
