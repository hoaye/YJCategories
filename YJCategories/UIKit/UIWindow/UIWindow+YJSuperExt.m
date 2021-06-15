//
//  UIWindow+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIWindow+YJSuperExt.h"

@implementation UIWindow (YJSuperExt)

/** 最底层的控制器 */
- (UIViewController *)yj_topMostController{
    UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController])	topController = [topController presentedViewController];
    return topController;
}

/** 当前显示的控制器 */
- (UIViewController *)yj_currentViewController{
    UIViewController *currentViewController = [self yj_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}

- (UIWindow *)bk_mainWindow {
        
    UIWindow *mainView = nil;
    if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
        mainView = [UIApplication sharedApplication].delegate.window;
    }
    
    if (![mainView isKindOfClass:[UIView class]]) {
        mainView = [UIApplication sharedApplication].keyWindow;
    }
    
    if (mainView == nil) {
        mainView = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    
    return mainView;
}

@end
