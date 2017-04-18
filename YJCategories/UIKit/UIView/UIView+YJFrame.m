//
//  UIView+YJFrame.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/20.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJFrame.h"

/** 获取 View 中心点 */
CGPoint CGRectGetCenter(CGRect rect){
    CGPoint point = CGPointZero;
    point.x = CGRectGetMidX(rect);
    point.y = CGRectGetMidY(rect);
    return point;
}

@implementation UIView (YJFrame)

- (CGPoint)origin{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect newframe = self.frame;
    newframe.origin = origin;
    self.frame = newframe;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect newframe = self.frame;
    newframe.size = size;
    self.frame = newframe;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect newframe = self.frame;
    newframe.origin.x = x;
    self.frame = newframe;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y{
    CGRect newframe = self.frame;
    newframe.origin.y = y;
    self.frame = newframe;
}

- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom{
    CGRect newframe = self.frame;
    newframe.origin.y = bottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right{
    CGFloat delta = right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width{
    CGRect newframe = self.frame;
    newframe.size.width = width;
    self.frame = newframe;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    CGRect newframe = self.frame;
    newframe.size.height = height;
    self.frame = newframe;
}

- (CGPoint)leftTop{
    return self.frame.origin;
}

- (void)setLeftTop:(CGPoint)leftTop{
    CGRect newframe = self.frame;
    newframe.origin = leftTop;
    self.frame = newframe;
}

- (CGPoint)leftBottom{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (void)setLeftBottom:(CGPoint)leftBottom{
    CGRect newframe = self.frame;
    newframe.origin.x = leftBottom.x;
    newframe.origin.y = leftBottom.y - self.frame.size.height;
    self.frame = newframe;
}

- (CGPoint)rightTop{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (void)setRightTop:(CGPoint)rightTop{
    CGRect newframe = self.frame;
    newframe.origin.x = rightTop.x - self.frame.size.width;
    newframe.origin.y = rightTop.y;
    self.frame = newframe;
}

- (CGPoint)rightBottom{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (void)setRightBottom:(CGPoint)rightBottom{
    CGRect newframe = self.frame;
    newframe.origin.x = rightBottom.x - self.frame.size.width;
    newframe.origin.y = rightBottom.y - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY{
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)yj_moveOriginToPoint:(CGPoint)point{
    CGRect newframe = self.frame;
    newframe.origin.x = point.x;
    newframe.origin.y = point.y;
    self.frame = newframe;
}

- (void)moveX:(CGFloat)xValue Y:(CGFloat)yValue{
    CGPoint newcenter = self.center;
    newcenter.x += xValue;
    newcenter.y += yValue;
    self.center = newcenter;
}

- (void)yj_scaleWidth:(CGFloat)widthFactor height:(CGFloat)heightFactor{
    CGRect newframe = self.frame;
    newframe.size.width *= widthFactor;
    newframe.size.height *= heightFactor;
    self.frame = newframe;
}

- (void)yj_fitScaleInSize:(CGSize)size{
    
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > size.height)){
        scale = size.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    if (newframe.size.width && (newframe.size.width >= size.width)){
        scale = size.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    self.frame = newframe;
}

@end
