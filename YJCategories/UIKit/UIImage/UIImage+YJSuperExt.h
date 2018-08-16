//
//  UIImage+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/9/29.
//  Copyright © 2017年 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJSuperExt)

/**
 将 UIView 转换成 UIImage
 
 @param view 将要转换的View
 @return 新生成的 UIImage 对象
 */
- (UIImage *)yj_convertCreateImageWithUIView:(UIView *)view;

/**
 裁剪带边框的圆形图片

 @param image 图片
 @param inset 裁剪inset
 @param borderWidth 边框宽 不要边框设置 0
 @param borderColor 边框颜色
 @return 裁剪完毕
 */
+ (UIImage *)yj_ellipseImage:(UIImage *)image
                       inset:(CGFloat)inset
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor;

@end
