//
//  UIView+YJVisuals.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/3.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJVisuals.h"

@implementation UIView (YJVisuals)

-(void)cornerRadius: (CGFloat)radius strokeSize: (CGFloat)size color: (UIColor *)color
{
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = size;
}

@end
