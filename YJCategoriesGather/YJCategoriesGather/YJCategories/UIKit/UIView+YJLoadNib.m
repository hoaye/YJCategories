//
//  UIView+YJLoadNib.m
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UIView+YJLoadNib.h"

@implementation UIView (YJLoadNib)

/** 根据 View 获取自身的 nib */
+ (UINib *)loadNib{
    return [self loadNibNamed:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

/** 根据 nibName 获取 Nib */
+ (UINib *)loadNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle{
    return [UINib nibWithNibName:nibName bundle:bundle];
}

/** 实例化View Form Nib*/
+ (UIView *)loadInstanceFromNib{
    return [self loadInstanceWithNibName:NSStringFromClass([self class]) owner:nil bundle:[NSBundle mainBundle]];
}

/** 实例化 View 参数nibName:名字  owner:归属*/
+ (UIView *)loadInstanceWithNibName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle{
    UIView *result = nil;
    NSArray *elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements){
        if ([object isKindOfClass:[self class]]){
            result = object;
            break;
        }
    }
    return result;
}

@end
