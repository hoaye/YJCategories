//
//  UIViewController+YJBackButtonBlock.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+YJBackButtonBlock.h"
#import <objc/runtime.h>

static char const * const YJBackButtonHandlerKey = "YJBackButtonHandlerKey";

@implementation UIViewController (YJBackButtonBlock)

/** 返回按钮的预处理操作 */
- (void)yj_backButtonClickBlock:(YJBackButtonHandlBlock)clickBlock{
    objc_setAssociatedObject(self, YJBackButtonHandlerKey, clickBlock, OBJC_ASSOCIATION_COPY);
}

- (YJBackButtonHandlBlock)yj_backButtonClickBlock{
    return objc_getAssociatedObject(self, YJBackButtonHandlerKey);
}

@end


@implementation UINavigationController (YJBackButtonBlock)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
   	UIViewController *vc = [self topViewController];
    YJBackButtonHandlBlock handler = [vc yj_backButtonClickBlock];
    if (handler) {
        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.0f) {
                [UIView animateWithDuration:0.25f animations:^{
                    subview.alpha = 1.0f;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }
    return NO;
}
@end

