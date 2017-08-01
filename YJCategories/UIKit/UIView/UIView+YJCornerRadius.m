//
//  UIView+YJCornerRadius.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/7/31.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJCornerRadius.h"

@implementation UIView (YJCornerRadius)

- (void)yj_setCornerWithRectCorner:(UIRectCorner)rectCorner cornerRadius:(CGFloat)cornerRadius{
    
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:cornerSize];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
    self.layer.masksToBounds = YES;
}


@end
