//
//  UIView+YJFrame.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/2/18.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJFrame.h"

/** 获取 View 中心点 */
CGPoint CGRectGetCenter(CGRect rect){
    CGPoint pt = CGPointZero;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

@implementation UIView (YJFrame)

@end
