//
//  UIBezierPath+YJBasicShapes.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (YJBasicShapes)

/** 心形 */
+ (UIBezierPath *)yj_heartShape:(CGRect)originalFrame;

/** 用户头像 */
+ (UIBezierPath *)yj_userShape:(CGRect)originalFrame;

/** 马丁尼酒杯 */
+ (UIBezierPath *)yj_martiniShape:(CGRect)originalFrame;

/** 烧杯 */
+ (UIBezierPath *)yj_beakerShape:(CGRect)originalFrame;

/** 五角星 */
+ (UIBezierPath *)yj_starShape:(CGRect)originalFrame;

/** 多个小五角星 */
+ (UIBezierPath *)yj_stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
