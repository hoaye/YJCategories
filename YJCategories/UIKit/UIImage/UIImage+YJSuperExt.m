//
//  UIImage+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/9/29.
//  Copyright © 2017年 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import "UIImage+YJSuperExt.h"

@implementation UIImage (YJSuperExt)

/**
 将 UIView 转换成 UIImage

 @param view 将要转换的View
 @return 新生成的 UIImage 对象
 */
- (UIImage *)yj_convertCreateImageWithUIView:(UIView *)view{
    
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//纠正图片方向
- (UIImage *)yj_imageFixOrientation:(UIImage *)srcImg {
    
    if (srcImg.imageOrientation == UIImageOrientationUp) return srcImg;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (srcImg.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, srcImg.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, srcImg.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (srcImg.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, srcImg.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, srcImg.size.width, srcImg.size.height,
                                             CGImageGetBitsPerComponent(srcImg.CGImage), 0,
                                             CGImageGetColorSpace(srcImg.CGImage),
                                             CGImageGetBitmapInfo(srcImg.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (srcImg.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,srcImg.size.height,srcImg.size.width), srcImg.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,srcImg.size.width,srcImg.size.height), srcImg.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

//正中裁剪
- (UIImage *)yj_clipImageCenterWithImage:(UIImage *)sourceImage andOrigalRect:(CGRect)bound {
    CGSize targetSize = bound.size;
    CGFloat whS = targetSize.width/targetSize.height;
    
    CGFloat newW;
    CGFloat newH;
    
    if (sourceImage.size.width>sourceImage.size.height) {
        newH = sourceImage.size.height;
        newW = sourceImage.size.height * whS;
    } else {
        newW = sourceImage.size.width;
        newH = sourceImage.size.width / whS;
    }
    
    CGFloat x = (sourceImage.size.width-newW)*0.5;
    CGFloat y = (sourceImage.size.height-newH)*0.5;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(sourceImage.CGImage, CGRectMake(x, y, newW, newH));
    UIImage *cropedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return cropedImage;

}


@end
