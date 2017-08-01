//
//  UIImageView+YJCornerRadius.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/8/1.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YJCornerRadius)

- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)yj_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)yj_cornerRadiusRoundingRect;

- (void)yj_attachBorderWidth:(CGFloat)width color:(UIColor *)color;

@end
