//
//  NSMutableArray+YJSuperExt.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/5/22.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableArray (YJSuperExt)

/** 安全添加对象到数组，防止非对象的崩溃 */
- (void)yj_addSafeObject:(id)obj;

/** 添加BOOL值 */
-(void)yj_addBOOL:(BOOL)boolValue;

/** 添加Int值 */
-(void)yj_addInt:(int)value;

/** 添加Integer值 */
-(void)yj_addInteger:(NSInteger)value;

/** 添加UnsignedInteger值 */
-(void)yj_addUnsignedInteger:(NSUInteger)value;

/** 添加CGFloat值 */
-(void)yj_addCGFloat:(CGFloat)value;

/** 添加Char值 */
-(void)yj_addChar:(char)value;

/** 添加Float值 */
-(void)yj_addFloat:(float)value;

/** 添加CGPoint值 */
-(void)yj_addPoint:(CGPoint)value;

/** 添加CGSize值 */
-(void)yj_addSize:(CGSize)value;

/** 添加CGRect值 */
-(void)yj_addRect:(CGRect)value;

/** 移除第一个对象 */
- (void)yj_removeFirstObject ;

/**
 move item

 @param index form
 @param toIndex to
 */
- (void)yj_moveObjectAtIndex:(NSUInteger)index
                     toIndex:(NSUInteger)toIndex;

@end
