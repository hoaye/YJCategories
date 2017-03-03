//
//  UIView+YJVisuals.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJVisuals.h"

@implementation UIView (YJVisuals)

/** 设置圆角和边框 */
- (void)yj_cornerRadius:(CGFloat)radius
                  color:(UIColor *)color
            borderWidth:(CGFloat)borderWidth{
    
    if (radius > 0) {
        self.layer.cornerRadius = radius;
    }
    if (color) {
        self.layer.borderColor = color.CGColor;
    }
    if (borderWidth > 0) {
        self.layer.borderWidth = borderWidth;
    }
}

/** 设置阴影 */
- (void)yj_shadowWithColor:(UIColor *)shadowColor
                    offset:(CGSize)offset
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius{
    self.clipsToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
}


@end
