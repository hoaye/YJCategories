//
//  NSString+YJSize.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (YJSize)

/** 计算文字大小 固定width */
- (CGSize)yj_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

/** 计算文字大小 固定height */
- (CGSize)yj_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

@end
