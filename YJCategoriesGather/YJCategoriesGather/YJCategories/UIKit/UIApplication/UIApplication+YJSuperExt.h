//
//  UIApplication+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (YJSuperExt)

/** 开始网络请求指示 */
- (void)yj_startNetworkActivity;

/** 停止网络请求指示 */
- (void)yj_stopNetworkActivity;

/** 键盘的大小 */
- (CGRect)yj_keyboardFrame;

@end
