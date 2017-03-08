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

@end
