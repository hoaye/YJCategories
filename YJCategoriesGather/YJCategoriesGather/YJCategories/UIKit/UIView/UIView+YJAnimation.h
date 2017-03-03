//
//  UIView+YJAnimation.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJAnimation)

/** 动画添加子视图 */
- (void)yj_addSubviewWithFadeAnimation:(UIView *)subview
                              duration:(NSTimeInterval)duration
                            completion:(void (^)(BOOL finished))completion;

@end
