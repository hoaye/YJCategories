//
//  NSDictionary+YJXML.h
//  YJCategoriesGather
//
//  Created by YJHou on 2017/3/2.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJXML)

/** 不带XML声明 不带根节点 */
- (NSString *)yjxmlString;

/** 默认 <?xml version=\"1.0\" encoding=\"utf-8\"?> 声明   自定义根节点 */
- (NSString*)yj_xmlStringDefaultDeclarationWithRootElement:(NSString *)rootElement;

/** 将NSDictionary转换成XML字符串, 自定义根节点  自定义xml声明 */
- (NSString*)yj_xmlStringWithRootElement:(NSString *)rootElement declaration:(NSString *)declaration;

/** 字典转 plistString*/
- (NSString *)yj_plistString;

/** 转换为plistData类型 */
- (NSData *)yj_plistData;

@end
