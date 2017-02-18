//
//  UIView+YJLoadNib.h
//  YJCategoriesGather
//
//  Created by YJHou on 2016/2/18.
//  Copyright © 2016年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJLoadNib)

/** 根据 View 获取自身的 nib */
+ (UINib *)loadNib;

/** 根据 nibName 获取 Nib */
+ (UINib *)loadNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle;

/** 实例化View Form Nib*/
+ (UIView *)loadInstanceFromNib;

/** 实例化 View 参数nibName:名字  owner:归属*/
+ (UIView *)loadInstanceWithNibName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
