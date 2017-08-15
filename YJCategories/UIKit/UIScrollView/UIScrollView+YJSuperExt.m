//
//  UIScrollView+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIScrollView+YJSuperExt.h"

@implementation UIScrollView (YJSuperExt)

- (NSInteger)yj_allPages{
    NSInteger pages = self.contentSize.width/self.frame.size.width;
    return pages;
}

- (NSInteger)yj_currentPage{
    NSInteger pages = self.contentSize.width/self.frame.size.width;
    CGFloat scrollPercent = [self yj_scrollPercent];
    NSInteger currentPage = (NSInteger)roundf((pages-1)*scrollPercent);
    return currentPage;
}

- (CGFloat)yj_scrollPercent{
    CGFloat width = self.contentSize.width-self.frame.size.width;
    CGFloat scrollPercent = self.contentOffset.x/width;
    return scrollPercent;
}

- (CGFloat)yj_pagesY{
    CGFloat pageHeight = self.frame.size.height;
    CGFloat contentHeight = self.contentSize.height;
    return contentHeight/pageHeight;
}

- (CGFloat)yj_pagesX{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat contentWidth = self.contentSize.width;
    return contentWidth/pageWidth;
}

- (CGFloat)yj_currentPageY{
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = self.contentOffset.y;
    return offsetY / pageHeight;
}

- (CGFloat)yj_currentPageX{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetX = self.contentOffset.x;
    return offsetX / pageWidth;
}

- (void)yj_setPageY:(NSInteger)page animated:(BOOL)animated{
    CGFloat pageHeight = self.frame.size.height;
    CGFloat offsetY = page * pageHeight;
    CGFloat offsetX = self.contentOffset.x;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset];
}

- (void)yj_setPageX:(NSInteger)page animated:(BOOL)animated{
    CGFloat pageWidth = self.frame.size.width;
    CGFloat offsetY = self.contentOffset.y;
    CGFloat offsetX = page * pageWidth;
    CGPoint offset = CGPointMake(offsetX,offsetY);
    [self setContentOffset:offset animated:animated];
}


@end
