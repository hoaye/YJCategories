//
//  UITableViewCell+YJNib.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UITableViewCell+YJNib.h"

@implementation UITableViewCell (YJNib)

/** 加载同类名的 nib */
+ (UINib *)nib{
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}


@end
