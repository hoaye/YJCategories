//
//  NSBundle+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSBundle+YJSuperExt.h"

@implementation NSBundle (YJSuperExt)

/** appIconPath 路径 */
- (NSString *)appIconPath{
    
    NSString *iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString *iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString *iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

/** appIconImage 对象 */
- (UIImage *)appIconImage{
    UIImage *appIcon = [[UIImage alloc] initWithContentsOfFile:[self appIconPath]] ;
    return appIcon;
}

@end
