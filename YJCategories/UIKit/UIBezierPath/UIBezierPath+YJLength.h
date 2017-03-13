//
//  UIBezierPath+YJLength.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (YJLength)

/** 总长度 */
- (CGFloat)yj_length;

/** 百分数的位置 */
- (CGPoint)yj_pointAtPercentOfLength:(CGFloat)percent;

@end
