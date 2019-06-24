//
//  UIViewController+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YJSuperExt)

/** vc 是否已经显示 */
- (BOOL)yj_isVisible;

/// Wraps the view controller container methods and exchanges the old view controller with the new view controller.
///
/// @param oldController  The controller to be removed.
/// @param newController  The controller to be added.
/// @param viewTransition A block that manages the view transition of the two controllers if necessary.
- (void)yj_exchangeViewController:(nullable UIViewController *)oldController withViewController:(nullable UIViewController *)newController viewTransition:(nullable void(^)(void))viewTransition;

/// Wraps the exchange of the views of two view controllers including the appearance calls.
///
/// @param oldController The controller whoes view needs to be removed.
/// @param newController The controller whoes view needs to be added.
/// @param containerView The container view in which this replacement should take place.
- (void)yj_exchangeViewFromController:(nullable UIViewController *)oldController toController:(nullable UIViewController *)newController inContainerView:(UIView *)containerView;


@end
