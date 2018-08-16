//
//  UIViewController+YJCyclePushLimit.h
//  YJCategoriesGather
//
//  Created by hm on 2015/5/11.
//  Copyright © 2015年 stackhou houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YJCyclePushLimit)

/**
 限制同一个控制器重复加载的次数 默认 return 0 不受控制

 @return 控制器加载的最大限度
 */
+ (NSUInteger)yj_cyclePushLimitNumber;

@end
