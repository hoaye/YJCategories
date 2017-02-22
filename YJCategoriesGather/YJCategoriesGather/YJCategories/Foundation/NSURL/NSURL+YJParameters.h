//
//  NSURL+YJParameters.h
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (YJParameters)

/** url参数转字典 */
- (NSDictionary *)dictParameters;

/** 根据参数名 取参数值 */
- (NSString *)valueForParameter:(NSString *)parameter;

@end
