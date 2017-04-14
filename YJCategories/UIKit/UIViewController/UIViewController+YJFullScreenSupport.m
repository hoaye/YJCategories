//
//  UIViewController+YJFullScreenSupport.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIViewController+YJFullScreenSupport.h"

#if __IPHONE_7_0 && __IPHONE_OS_VERSION_MAX_ALLOWED >=  __IPHONE_7_0
#define YJ_IS_RUNNING_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#else
#define YJ_IS_RUNNING_IOS7 NO
#endif

@implementation UIViewController (YJFullScreenSupport)

- (void)yj_showNavigationBar:(BOOL)animated{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    [self yj_setNavigationBarOriginY:statusBarHeight animated:animated];
    
}

- (void)yj_hideNavigationBar:(BOOL)animated{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat top = YJ_IS_RUNNING_IOS7 ? -navigationBarHeight + statusBarHeight : -navigationBarHeight;
    [self yj_setNavigationBarOriginY:top animated:animated];
}

- (void)yj_moveNavigtionBar:(CGFloat)deltaY animated:(BOOL)animated{
    CGRect frame = self.navigationController.navigationBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self yj_setNavigationBarOriginY:nextY animated:animated];
}

- (void)yj_setNavigationBarOriginY:(CGFloat)y animated:(BOOL)animated{
    CGSize statuBarFrameSize = [UIApplication sharedApplication].statusBarFrame.size;
    CGFloat statusBarHeight = [self isPortrait] ? statuBarFrameSize.height : statuBarFrameSize.width;
    CGRect frame = self.navigationController.navigationBar.frame;
    CGFloat navigationBarHeight = frame.size.height;
    
    CGFloat topLimit = YJ_IS_RUNNING_IOS7 ? -navigationBarHeight + statusBarHeight : -navigationBarHeight;
    CGFloat bottomLimit = statusBarHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit);
    CGFloat alpha = 1 - (statusBarHeight - frame.origin.y) / statusBarHeight;
    UIColor *titleTextColor = [UIColor colorWithWhite:0.0 alpha:alpha]; // fade title
    [UIView animateWithDuration:animated ? 0.1 : 0 animations:^{
        self.navigationController.navigationBar.frame = frame;
        [self.navigationController.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : titleTextColor }];
        if (YJ_IS_RUNNING_IOS7) {
            // fade bar buttons
            UIColor *tintColor = self.navigationController.navigationBar.tintColor;
            if (tintColor) {
                CGFloat *components = (CGFloat *)CGColorGetComponents(tintColor.CGColor);
                self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:alpha];
            }
        }
        
    }];
}

#pragma mark - ToolBar
- (void)yj_showToolbar:(BOOL)animated{
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    CGFloat toolbarHeight = self.tabBarController.tabBar.frame.size.height;
    [self yj_setToolbarOriginY:viewHeight - toolbarHeight animated:animated];
}

- (void)yj_hideToolbar:(BOOL)animated{
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    [self yj_setToolbarOriginY:viewHeight animated:animated];
}

- (void)yj_moveToolbar:(CGFloat)deltaY animated:(BOOL)animated{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self yj_setToolbarOriginY:nextY animated:animated];
}

- (void)yj_setToolbarOriginY:(CGFloat)y animated:(BOOL)animated{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.navigationController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? 0.1 : 0 animations:^{
        self.tabBarController.tabBar.frame = frame;
    }];
}

- (BOOL)isPortrait {
    return [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait;
}

#pragma mark - TabBar

- (void)yj_showTabBar:(BOOL)animated{
    CGFloat viewHeight = self.tabBarController.view.frame.size.height;
    CGFloat toolbarHeight = self.tabBarController.tabBar.frame.size.height;
    [self yj_setToolbarOriginY:viewHeight - toolbarHeight animated:animated];
}

- (void)yj_hideTabBar:(BOOL)animated{
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    [self yj_setToolbarOriginY:viewHeight animated:animated];
}

- (void)yj_moveTabBar:(CGFloat)deltaY animated:(BOOL)animated{
    CGRect frame =  self.tabBarController.tabBar.frame;
    CGFloat nextY = frame.origin.y + deltaY;
    [self yj_setToolbarOriginY:nextY animated:animated];
}

- (void)yj_setTabBarOriginY:(CGFloat)y animated:(BOOL)animated{
    CGRect frame = self.tabBarController.tabBar.frame;
    CGFloat toolBarHeight = frame.size.height;
    CGSize viewSize = self.tabBarController.view.frame.size;
    CGFloat viewHeight = [self isPortrait] ? viewSize.height : viewSize.width;
    
    CGFloat topLimit = viewHeight - toolBarHeight;
    CGFloat bottomLimit = viewHeight;
    
    frame.origin.y = fmin(fmax(y, topLimit), bottomLimit); // limit over moving
    
    [UIView animateWithDuration:animated ? 0.1 : 0 animations:^{
        self.tabBarController.tabBar.frame = frame;
    }];
}

@end
