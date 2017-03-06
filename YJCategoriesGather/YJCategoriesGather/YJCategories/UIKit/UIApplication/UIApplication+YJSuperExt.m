//
//  UIApplication+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIApplication+YJSuperExt.h"
#import <libkern/OSAtomic.h>

static volatile int32_t numberOfActiveNetworkConnectionsxxx;

@implementation UIApplication (YJSuperExt)

/** 开始网络请求指示 */
- (void)yj_startNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

/** 停止网络请求指示 */
- (void)yj_stopNetworkActivity{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnectionsxxx) > 0;
}


@end
