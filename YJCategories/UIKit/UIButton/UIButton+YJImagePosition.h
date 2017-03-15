//
//  UIButton+YJImagePosition.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YJButtomImagePosition) {
    YJButtomImagePositionLeft   = 0,
    YJButtomImagePositionRight,
    YJButtomImagePositionTop,
    YJButtomImagePositionBottom,
};

@interface UIButton (YJImagePosition)

/** 设置图片和image的位置 */
- (void)yj_setImagePosition:(YJButtomImagePosition)postion spacing:(CGFloat)spacing;

@end
