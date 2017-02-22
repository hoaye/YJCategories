//
//  NSIndexPath+YJOffset.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSIndexPath+YJOffset.h"

@implementation NSIndexPath (YJOffset)

/** 上一行 */
- (NSIndexPath *)previousRow{
    return [NSIndexPath indexPathForRow:self.row - 1
                              inSection:self.section];
}

/** 下一行 */
- (NSIndexPath *)nextRow{
    return [NSIndexPath indexPathForRow:self.row + 1
                              inSection:self.section];
}

/** 上一项 */
- (NSIndexPath *)previousItem{
    return [NSIndexPath indexPathForItem:self.item - 1
                               inSection:self.section];
}

/** 下一项 */
- (NSIndexPath *)nextItem{
    return [NSIndexPath indexPathForItem:self.item + 1
                               inSection:self.section];
}

/** 上一组 */
- (NSIndexPath *)previousSection{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section - 1];
}

/** 下一组 */
- (NSIndexPath *)nextSection{
    return [NSIndexPath indexPathForRow:self.row
                              inSection:self.section + 1];
}


@end
