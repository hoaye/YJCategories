//
//  UIApplication+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIApplication+YJSuperExt.h"
#import <libkern/OSAtomic.h>

static volatile int32_t numberOfActiveNetworkConnectionsxxx;   // 网络请求指示
static CGRect _yj_keyboardFrame = (CGRect){ (CGPoint){ 0.0f, 0.0f }, (CGSize){ 0.0f, 0.0f }};


@implementation UIApplication (YJSuperExt)

/** 开始网络请求指示 */
- (void)yj_startNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

/** 停止网络请求指示 */
- (void)yj_stopNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

/** 键盘的大小 */
- (CGRect)yj_keyboardFrame{
    return _yj_keyboardFrame;
}

+ (void)load{
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _yj_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidChangeFrameNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _yj_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidHideNotification object:nil queue:nil usingBlock:^(NSNotification *note){
         _yj_keyboardFrame = CGRectZero;
     }];
}


@end
