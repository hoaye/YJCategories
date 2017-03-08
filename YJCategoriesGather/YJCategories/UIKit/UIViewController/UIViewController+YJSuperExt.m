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

@end
