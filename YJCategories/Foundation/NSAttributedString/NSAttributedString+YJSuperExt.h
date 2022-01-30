//
//  NSAttributedString+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by stackhou on 2015/3/17.
//  Copyright © 2015年 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (YJSuperExt)

/**
 由于系统计算富文本的高度不正确 替换方法

 @param width 包容width
 @return height
 */
- (CGFloat)yj_attributedStringHeightWithContainWidth:(CGFloat)width;

@end
