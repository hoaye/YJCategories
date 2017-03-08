//
//  UIScrollView+YJPosition.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 手势滚动方向 */
typedef NS_ENUM(NSInteger, YJScrollDirection) {
    YJScrollDirectionUp,
    YJScrollDirectionDown,
    YJScrollDirectionLeft,
    YJScrollDirectionRight,
    YJScrollDirectionWTF
};

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

/** 手势滚动方向 */
- (YJScrollDirection)yj_ScrollDirection;

/** 是否滚动到了top */
- (BOOL)yj_isScrolledToTop;

/** 是否滚动到了Bottom */
- (BOOL)yj_isScrolledToBottom;

/** 是否滚动到了Left */
- (BOOL)yj_isScrolledToLeft;

/** 是否滚动到了Right */
- (BOOL)yj_isScrolledToRight;

/** 动画滚动 */
- (void)yj_scrollToTopAnimated:(BOOL)animated;
- (void)yj_scrollToBottomAnimated:(BOOL)animated;
- (void)yj_scrollToLeftAnimated:(BOOL)animated;
- (void)yj_scrollToRightAnimated:(BOOL)animated;

/** 当前滚动页面 及 滚动到哪一页 */
- (NSUInteger)yj_verticalPageIndex;
- (NSUInteger)yj_horizontalPageIndex;
- (void)yj_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)yj_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
