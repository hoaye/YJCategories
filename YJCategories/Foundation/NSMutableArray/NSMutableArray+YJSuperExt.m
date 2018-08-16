//
//  NSMutableArray+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSMutableArray+YJSuperExt.h"

@implementation NSMutableArray (YJSuperExt)

/** 安全添加对象到数组，防止非对象的崩溃 */
- (void)yj_addSafeObject:(id)obj{
    if (obj != nil) {
        [self addObject:obj];
    }
}

/** 添加BOOL值 */
-(void)yj_addBOOL:(BOOL)boolValue{
    [self addObject:@(boolValue)];
}

/** 添加Int值 */
-(void)yj_addInt:(int)value{
    [self addObject:@(value)];
}

/** 添加Integer值 */
-(void)yj_addInteger:(NSInteger)value{
    [self addObject:@(value)];
}

/** 添加UnsignedInteger值 */
-(void)yj_addUnsignedInteger:(NSUInteger)value{
    [self addObject:@(value)];
}

/** 添加CGFloat值 */
-(void)yj_addCGFloat:(CGFloat)value{
    [self addObject:@(value)];
}

/** 添加Char值 */
-(void)yj_addChar:(char)value{
    [self addObject:@(value)];
}

/** 添加Float值 */
-(void)yj_addFloat:(float)value{
    [self addObject:@(value)];
}

/** 添加CGPoint值 */
-(void)yj_addPoint:(CGPoint)value{
    [self addObject:NSStringFromCGPoint(value)];
}

/** 添加CGSize值 */
-(void)yj_addSize:(CGSize)value{
    [self addObject:NSStringFromCGSize(value)];
}

/** 添加CGRect值 */
-(void)yj_addRect:(CGRect)value{
    [self addObject:NSStringFromCGRect(value)];
}

- (void)yj_removeFirstObject {
    if (self.count > 0) {
        [self removeObjectAtIndex:0];
    }
}

- (void)yj_moveObjectAtIndex:(NSUInteger)index
                     toIndex:(NSUInteger)toIndex{
    
    if (self.count > index && self.count > toIndex) {
        id object = [self objectAtIndex:index];
        if (index > toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex];
        } else if (index < toIndex) {
            [self removeObjectAtIndex:index];
            [self insertObject:object atIndex:toIndex - 1];
        }
    }
}




@end
