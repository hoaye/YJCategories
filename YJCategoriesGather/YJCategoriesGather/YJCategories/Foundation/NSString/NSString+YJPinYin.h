//
//  NSString+YJPinYin.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJPinYin)

/**【拼音 是否大写】比如: 侯跃军 -> hou yue jun*/
- (NSString *)yj_pinyinUppercase:(BOOL)uppercase;

/**【每个首字母大写】比如: 侯跃军 -> Hou Yue Jun */
- (NSString *)yj_pinyinCapitalized;

/** 拼音带声调 比如: 侯跃军 -> hóu yuè jūn */
- (NSString *)yj_pinyinWithPhoneticSymbolUppercase:(BOOL)uppercase;

/**【带声调 每个首字母大写】比如: 侯跃军 -> Hóu Yuè Jūn */
- (NSString *)yj_pinyinPhoneticSymbolCapitalized;

/**【没有空格 是否全大写】比如: 侯跃军 -> houyuejun */
- (NSString *)yj_pinyinWithoutBlankUppercase:(BOOL)uppercase;

/**【没有空格 每个首字母大写】比如: 侯跃军 -> HouYueJun */
- (NSString *)yj_pinyinWithoutBlankCapitalized;

/**【拼音数组 是否全部大写】比如: 侯跃军 -> @[@"hou", @"yue", @"jun"]*/
- (NSArray *)yj_pinyinArrayUppercase:(BOOL)uppercase;

/**【拼音数组 首字母大写】比如:侯跃军 -> @[@"Hou", @"Yue", @"Jun"] */
- (NSArray *)yj_pinyinArrayCapitalized;

/**【拼音首字母字符串 是否大写】比如: 侯跃军 -> hyj */
- (NSString *)yj_pinyinInitialsStringUppercase:(BOOL)uppercase;

/**【拼音首字母数组 是否大写】 比如: 侯跃军 -> @[@"h", @"y", @"j"] */
- (NSArray*)yj_pinyinInitialsArrayUppercase:(BOOL)uppercase;

@end
