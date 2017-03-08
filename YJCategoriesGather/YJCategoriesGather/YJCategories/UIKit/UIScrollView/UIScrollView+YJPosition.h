//
//  UIScrollView+YJPosition.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YJPosition)

@property (nonatomic, assign) CGFloat yj_contentWidth; /**< 宽 */
@property (nonatomic, assign) CGFloat yj_contentHeight; /**< 高 */
@property (nonatomic, assign) CGFloat yj_contentOffsetX; /**< x */
@property (nonatomic, assign) CGFloat yj_contentOffsetY; /**< y */

/** 顶部偏移量 */
- (CGPoint)yj_topContentOffset;

/** 底部偏移量 */
- (CGPoint)yj_bottomContentOffset;

/** 左边偏移量 */
- (CGPoint)yj_leftContentOffset;

/** 右边偏移量 */
- (CGPoint)yj_rightContentOffset;

@end
