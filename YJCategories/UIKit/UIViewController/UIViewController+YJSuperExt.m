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


@end
