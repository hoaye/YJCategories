//
//  UIView+YJScreenshot.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJScreenshot)

/** 生成图片 */
- (UIImage *)imageSreenshot;

/** 截图一个view中所有视图 包括旋转缩放效果(maxWidth 限制缩放的最大宽度 Default=0) */
- (UIImage *)imageScreenshotWithMaxWidth:(CGFloat)maxWidth;

@end
