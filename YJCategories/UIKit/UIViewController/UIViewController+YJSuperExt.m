//
//  UIViewController+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+YJSuperExt.h"

@implementation UIViewController (YJSuperExt)

/** vc 是否已经显示 */
- (BOOL)yj_isVisible{
    return ([self isViewLoaded] && self.view.window);
}

- (void)yj_exchangeViewController:(nullable UIViewController *)oldController
                    newController:(nullable UIViewController *)newController
                   viewTransition:(nullable void(^)(void))viewTransition {
    
    [oldController willMoveToParentViewController:nil];
    if (newController) {
        [self addChildViewController:newController];
    }
    
    if (self.isViewLoaded && viewTransition) {
        viewTransition();
    }
    
    [newController didMoveToParentViewController:self];
    [oldController removeFromParentViewController];
}

- (void)yj_exchangeViewFromController:(nullable UIViewController *)oldController
                         toController:(nullable UIViewController *)newController
                      inContainerView:(UIView *)containerView {
    
    if (oldController == nil && newController == nil) {
        return;
    }
    
    NSParameterAssert(oldController.view == nil || oldController.view.superview == containerView);
    
    UIView *oldView = oldController.view;
    
    newController.view.frame = (oldView ? oldView.frame : containerView.bounds);
    newController.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    
    // Check if the view is inside a window and if the container view is within the bounds of the controller's view.
    // If the container is not within the bounds of the controller's view, we consider the container to be non-visible.
    CGRect containerFrame = [self.view convertRect:containerView.bounds fromView:containerView];
    BOOL viewVisible = (self.view.window && CGRectIntersectsRect(self.view.bounds, containerFrame));
    if (viewVisible) {
        [oldController beginAppearanceTransition:NO animated:NO];
        [newController beginAppearanceTransition:YES animated:NO];
    }
    
    if (oldView) {
        [containerView insertSubview:newController.view aboveSubview:oldView];
    } else {
        [containerView addSubview:newController.view];
    }
    [oldView removeFromSuperview];
    
    if (viewVisible) {
        [newController endAppearanceTransition];
        [oldController endAppearanceTransition];
    }
}

+ (UIViewController *)bk_recursiveFindCurrentShowViewControllerFromViewController:(UIViewController *)fromVC {
    
    UIViewController *result = nil;
    if ([fromVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)fromVC;
        result = [self bk_recursiveFindCurrentShowViewControllerFromViewController:[nav topViewController]];
    } else {
        
        if ([fromVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)fromVC;
            result = [self bk_recursiveFindCurrentShowViewControllerFromViewController:[tab selectedViewController]];
        } else {
            if (![fromVC isKindOfClass:[UIViewController class]]) {
                result = nil;
                return result;
            }
            
            UIViewController *presented = fromVC.presentedViewController;
            if (presented && ![presented isKindOfClass:[UIAlertController class]]) {
                result = [self bk_recursiveFindCurrentShowViewControllerFromViewController:presented];

            }
        }
    }
    return result;
}

// 安全的presentViewController, 多次Present同一个会崩溃
- (void)bk_safelyPresentViewController:(UIViewController *)viewController
                              animated: (BOOL)animated
                            completion:(void (^)(void))completion {
    
    if (self.presentedViewController) {
        
    } else {
        if (self != viewController) {
            [self presentViewController:viewController animated:animated completion:completion];
        }
    }
}

// 获取当前最后一个被present出的VC，如果没有返回self
- (UIViewController *)bk_presentingViewController {
    
    UIViewController *result = self;
    if (self.presentedViewController) {
        UIViewController *vc = nil;
        do {
            vc = self.presentedViewController.presentedViewController;
        } while (vc);
    }
    
    return result;
}


@end
