//
//  UIScrollView+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YJSuperExt)

/** 共多少页 */
- (NSInteger)yj_allPages;

/** 当前是第几页 */
- (NSInteger)yj_currentPage;

/** 滚动百分比 */
- (CGFloat)yj_scrollPercent;

/** x方向上的页数 */
- (CGFloat)yj_pagesX;

/** y方向上的页数 */
- (CGFloat)yj_pagesY;

/** X当前是第几页 */
- (CGFloat)yj_currentPageX;

/** Y当前是第几页 */
- (CGFloat)yj_currentPageY;

/** 设置X方向页数 */
- (void)yj_setPageX:(NSInteger)page animated:(BOOL)animated;

/** 设置Y方向页数 */
- (void)yj_setPageY:(NSInteger)page animated:(BOOL)animated;

@end
