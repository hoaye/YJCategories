//
//  UIViewController+YJBackButtonBlock.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//  在点击返回按钮前需要做的操作

#import <UIKit/UIKit.h>

typedef void(^YJBackButtonHandlBlock)(__kindof UIViewController *vc);

@interface UIViewController (YJBackButtonBlock)

/** 返回按钮的预处理操作 */
- (void)yj_backButtonClickBlock:(YJBackButtonHandlBlock)clickBlock;

@end
