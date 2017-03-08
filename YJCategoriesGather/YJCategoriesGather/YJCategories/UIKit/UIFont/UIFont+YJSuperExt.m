//
//  UIFont+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIFont+YJSuperExt.h"
#import <CoreText/CoreText.h>

@implementation UIFont (YJSuperExt)

/** 自定义字体的获取 */
+ (UIFont *)yj_fontWithTTFAtPath:(NSString *)path size:(CGFloat)size{
    
    BOOL foundFile = [[NSFileManager defaultManager] fileExistsAtPath:path];
    NSAssert(foundFile, @"The font at: \"%@\" was not found.", path);
    if (!foundFile) {
        return [UIFont systemFontOfSize:size];
    }
    
    CFURLRef fontURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (__bridge CFStringRef)path, kCFURLPOSIXPathStyle, false);;
    CGDataProviderRef dataProvider = CGDataProviderCreateWithURL(fontURL);
    CFRelease(fontURL);
    CGFontRef graphicsFont = CGFontCreateWithDataProvider(dataProvider);
    CFRelease(dataProvider);
    CTFontRef smallFont = CTFontCreateWithGraphicsFont(graphicsFont, size, NULL, NULL);
    CFRelease(graphicsFont);
    
    UIFont *returnFont = (__bridge UIFont *)smallFont;
    CFRelease(smallFont);
    
    return returnFont;
}

@end
