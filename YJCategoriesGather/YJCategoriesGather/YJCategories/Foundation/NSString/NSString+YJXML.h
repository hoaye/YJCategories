//
//  NSString+YJXML.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJXML)

/** xml字符串转换成NSDictionary */
- (NSDictionary *)yj_convertXMLToDictionary;

@end
