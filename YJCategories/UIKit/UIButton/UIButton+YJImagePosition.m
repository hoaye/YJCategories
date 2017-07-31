//
//  UIButton+YJImagePosition.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIButton+YJImagePosition.h"

@implementation UIButton (YJImagePosition)

/** 设置图片和image的位置 */
- (void)yj_setImagePosition:(YJButtomImagePosition)postion spacing:(CGFloat)spacing{
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat labelWidth = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) * 0.5 - imageWidth * 0.5;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight * 0.5 + spacing * 0.5;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth * 0.5) - (imageWidth + labelWidth) * 0.5;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight * 0.5 + spacing * 0.5;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case YJButtomImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing*0.5, 0, spacing*0.5);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing*0.5, 0, -spacing*0.5);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing*0.5, 0, spacing*0.5);
            break;
            
        case YJButtomImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing*0.5, 0, -(labelWidth + spacing*0.5));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing*0.5), 0, imageWidth + spacing*0.5);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing*0.5, 0, spacing*0.5);
            break;
            
        case YJButtomImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth*0.5, changedHeight-imageOffsetY, -changedWidth*0.5);
            break;
            
        case YJButtomImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth*0.5, imageOffsetY, -changedWidth*0.5);
            break;
            
        default:
            break;
    }
    
}

@end
