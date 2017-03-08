//
//  UIView+YJCustomBorder.m
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJCustomBorder.h"

/** 边框的位置 */
typedef NS_ENUM(NSInteger, YJCustomBorderEdgeType) {
    YJCustomBorderEdgeTop     = 10000,
    YJCustomBorderEdgeLeft    = 20000,
    YJCustomBorderEdgeBottom  = 30000,
    YJCustomBorderEdgeRight  = 40000
};

@implementation UIView (YJCustomBorder)

#pragma mark -  Add Line
/** 顶部添加Border边框 无删除 */
- (void)yj_addTopBorderWithColor:(UIColor *)color width:(CGFloat)width{
    [self yj_addTopBorderWithColor:color width:width excludeLength:0 excludePointType:0];
}

/** 顶部添加Border边框 */
- (void)yj_addTopBorderWithColor:(UIColor *)color
                           width:(CGFloat)width
                   excludeLength:(CGFloat)length
                excludePointType:(YJExcludePointType)excludeType{
    
    // 1. 移除之前的
    [self yj_removeTopBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = YJCustomBorderEdgeTop;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (excludeType & YJExcludePointStart) {
        startPoint += length;
    }
    if (excludeType & YJExcludePointEnd) {
        endPoint += length;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLenght = self.bounds.size.width - endPoint - startPoint;
        border.frame = CGRectMake(startPoint, 0.0f, borderLenght, width);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
}

/** Left添加Border边框 无删除 */
- (void)yj_addLeftBorderWithColor:(UIColor *)color width:(CGFloat)width{
    [self yj_addLeftBorderWithColor:color width:width excludeLength:0 excludePointType:0];
}

/** Left添加Border边框 */
- (void)yj_addLeftBorderWithColor:(UIColor *)color
                            width:(CGFloat)width
                    excludeLength:(CGFloat)length
                 excludePointType:(YJExcludePointType)excludeType{
    
    [self yj_removeLeftBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = YJCustomBorderEdgeLeft;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (excludeType & YJExcludePointStart) {
        startPoint += length;
    }
    if (excludeType & YJExcludePointEnd) {
        endPoint += length;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(0.0, startPoint, width, borderLength);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
    
}

/** Bottom添加Border边框 无删除 */
- (void)yj_addBottomBorderWithColor:(UIColor *)color width:(CGFloat)width{
    [self yj_addBottomBorderWithColor:color width:width excludeLength:0 excludePointType:0];
}

/** Bottom添加Border边框 */
- (void)yj_addBottomBorderWithColor:(UIColor *)color
                              width:(CGFloat)width
                      excludeLength:(CGFloat)length
                   excludePointType:(YJExcludePointType)excludeType{
    
    [self yj_removeBottomBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = YJCustomBorderEdgeBottom;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (excludeType & YJExcludePointStart) {
        startPoint += length;
    }
    
    if (excludeType & YJExcludePointEnd) {
        endPoint += length;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.width - startPoint - endPoint;
        border.frame = CGRectMake(startPoint, self.bounds.size.height - width, borderLength, width);
        return;
    }
    
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
}

/** Right添加Border边框 无删除 */
- (void)yj_addRightBorderWithColor:(UIColor *)color width:(CGFloat)width{
    [self yj_addRightBorderWithColor:color width:width excludeLength:0 excludePointType:0];
}

/** Right添加Border边框 */
- (void)yj_addRightBorderWithColor:(UIColor *)color
                             width:(CGFloat)width
                     excludeLength:(CGFloat)length
                  excludePointType:(YJExcludePointType)excludeType{
    [self yj_removeRightBorder];
    
    UIView *border = [[UIView alloc] init];
    if (!self.translatesAutoresizingMaskIntoConstraints) {
        border.translatesAutoresizingMaskIntoConstraints = NO;
    }
    border.userInteractionEnabled = NO;
    border.backgroundColor = color;
    border.tag = YJCustomBorderEdgeRight;
    [self addSubview:border];
    
    CGFloat startPoint = 0.0f;
    CGFloat endPoint = 0.0f;
    if (excludeType & YJExcludePointStart) {
        startPoint += length;
    }
    
    if (excludeType & YJExcludePointEnd) {
        endPoint += length;
    }
    
    if (border.translatesAutoresizingMaskIntoConstraints) {
        CGFloat borderLength = self.bounds.size.height - startPoint - endPoint;
        border.frame = CGRectMake(self.bounds.size.width - width, startPoint, width, borderLength);
        return;
    }
    // AutoLayout
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:startPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-endPoint]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:border attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width]];
}

#pragma mark - Remove
/** 移除Top的Border */
- (void)yj_removeTopBorder{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == YJCustomBorderEdgeTop) {
            [subView removeFromSuperview];
        }
    }];
}

/** 移除Left的Border */
- (void)yj_removeLeftBorder{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == YJCustomBorderEdgeLeft) {
            [subView removeFromSuperview];
        }
    }];
}

/** 移除Bottom的Border */
- (void)yj_removeBottomBorder{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == YJCustomBorderEdgeBottom) {
            [subView removeFromSuperview];
        }
    }];
}

/** 移除Right的Border */
- (void)yj_removeRightBorder{
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        if (subView.tag == YJCustomBorderEdgeRight) {
            [subView removeFromSuperview];
        }
    }];
}

@end
