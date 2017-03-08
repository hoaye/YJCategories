//
//  UIScrollView+YJPosition.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIScrollView+YJPosition.h"

@implementation UIScrollView (YJPosition)

- (CGFloat)yj_contentWidth{
    return self.contentSize.width;
}

- (void)setYj_contentWidth:(CGFloat)yj_contentWidth{
    self.contentSize = CGSizeMake(yj_contentWidth, self.frame.size.height);
}

- (CGFloat)yj_contentHeight{
    return self.contentSize.height;
}

- (void)setYj_contentHeight:(CGFloat)yj_contentHeight{
    self.contentSize = CGSizeMake(self.frame.size.width, yj_contentHeight);
}

- (CGFloat)yj_contentOffsetX{
    return self.contentOffset.x;
}

- (void)setYj_contentOffsetX:(CGFloat)yj_contentOffsetX{
    self.contentOffset = CGPointMake(yj_contentOffsetX, self.contentOffset.y);
}

- (CGFloat)yj_contentOffsetY{
    return self.contentOffset.y;
}

- (void)setYj_contentOffsetY:(CGFloat)yj_contentOffsetY{
    self.contentOffset = CGPointMake(self.contentOffset.x, yj_contentOffsetY);
}

- (CGPoint)yj_topContentOffset{
    return CGPointMake(0.0f, -self.contentInset.top);
}

- (CGPoint)yj_bottomContentOffset{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)yj_leftContentOffset{
    return CGPointMake(-self.contentInset.left, 0.0f);
}

- (CGPoint)yj_rightContentOffset{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}


- (YJScrollDirection)yj_ScrollDirection{
    
    YJScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f){
        direction = YJScrollDirectionUp;
    }else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f){
        direction = YJScrollDirectionDown;
    }else if ([self.panGestureRecognizer translationInView:self].x < 0.0f){
        direction = YJScrollDirectionLeft;
    }else if ([self.panGestureRecognizer translationInView:self].x > 0.0f){
        direction = YJScrollDirectionRight;
    }else{
        direction = YJScrollDirectionWTF;
    }
    return direction;
}

- (BOOL)yj_isScrolledToTop{
    return self.contentOffset.y <= [self yj_topContentOffset].y;
}
- (BOOL)yj_isScrolledToBottom{
    return self.contentOffset.y >= [self yj_bottomContentOffset].y;
}

- (BOOL)yj_isScrolledToLeft{
    return self.contentOffset.x <= [self yj_leftContentOffset].x;
}
- (BOOL)yj_isScrolledToRight{
    return self.contentOffset.x >= [self yj_rightContentOffset].x;
}

- (void)yj_scrollToTopAnimated:(BOOL)animated{
    [self setContentOffset:[self yj_topContentOffset] animated:animated];
}

- (void)yj_scrollToBottomAnimated:(BOOL)animated{
    [self setContentOffset:[self yj_bottomContentOffset] animated:animated];
}

- (void)yj_scrollToLeftAnimated:(BOOL)animated{
    [self setContentOffset:[self yj_leftContentOffset] animated:animated];
}

- (void)yj_scrollToRightAnimated:(BOOL)animated{
    [self setContentOffset:[self yj_rightContentOffset] animated:animated];
}

- (NSUInteger)yj_verticalPageIndex{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}

- (NSUInteger)yj_horizontalPageIndex{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}

- (void)yj_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}

- (void)yj_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}

@end
