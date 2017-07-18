//
//  UIImage+YJReSize.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJReSize)

- (UIImage *)jk_croppedImage:(CGRect)bounds;
- (UIImage *)jk_thumbnailImage:(NSInteger)thumbnailSize
             transparentBorder:(NSUInteger)borderSize
                  cornerRadius:(NSUInteger)cornerRadius
          interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)jk_resizedImage:(CGSize)newSize
        interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)jk_resizedImageWithContentMode:(UIViewContentMode)contentMode
                                     bounds:(CGSize)bounds
                       interpolationQuality:(CGInterpolationQuality)quality;

@end
