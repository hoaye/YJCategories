//
//  UIBezierPath+YJSymbol.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YJUIBezierPathArrowDirection) {
    kUIBezierPathArrowDirectionNone  = 0,
    kUIBezierPathArrowDirectionRight = 1 << 0,
    kUIBezierPathArrowDirectionLeft  = 1 << 1,
    kUIBezierPathArrowDirectionUp    = 1 << 2,
    kUIBezierPathArrowDirectionDown  = 1 << 3
};

@interface UIBezierPath (YJSymbol)

/** +号 */
+ (UIBezierPath *)yj_customBezierPathOfPlusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale;

/** -减号 */
+ (UIBezierPath *)yj_customBezierPathOfMinusSymbolWithRect:(CGRect)rect scale:(CGFloat)scale;

/** 对号 */
+ (UIBezierPath *)yj_customBezierPathOfCheckSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

/** x号 */
+ (UIBezierPath *)yj_customBezierPathOfCrossSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

/** 箭头 */
+ (UIBezierPath *)yj_customBezierPathOfArrowSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick direction:(YJUIBezierPathArrowDirection)direction;

/** 铅笔 */
+ (UIBezierPath *)yj_customBezierPathOfPencilSymbolWithRect:(CGRect)rect scale:(CGFloat)scale thick:(CGFloat)thick;

@end
