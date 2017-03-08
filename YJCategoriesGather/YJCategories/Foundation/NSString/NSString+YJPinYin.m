//
//  NSString+YJPinYin.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJPinYin.h"

@implementation NSString (YJPinYin)

/**【拼音 是否大写】比如: 侯跃军 -> hou yue jun*/
- (NSString *)yj_pinyinUppercase:(BOOL)uppercase{
    NSMutableString *pinyin = [NSMutableString stringWithString:[self yj_pinyinWithPhoneticSymbolUppercase:NO]];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformStripCombiningMarks, NO);
    return uppercase?[pinyin uppercaseString]:pinyin;
}

/**【每个首字母大写】比如: 侯跃军 -> Hou Yue Jun */
- (NSString *)yj_pinyinCapitalized{
    return [[self yj_pinyinUppercase:NO] capitalizedString];
}

/** 拼音带声调 比如: 侯跃军 -> hóu yuè jūn */
- (NSString *)yj_pinyinWithPhoneticSymbolUppercase:(BOOL)uppercase{
    NSMutableString *pinyin = [NSMutableString stringWithString:self];
    CFStringTransform((__bridge CFMutableStringRef)(pinyin), NULL, kCFStringTransformMandarinLatin, NO);
    return uppercase?[pinyin uppercaseString]:pinyin;
}

/**【带声调 每个首字母大写】比如: 侯跃军 -> Hóu Yuè Jūn */
- (NSString *)yj_pinyinPhoneticSymbolCapitalized{
    return [[self yj_pinyinWithPhoneticSymbolUppercase:NO] capitalizedString];
}

/**【没有空格 是否全大写】比如: 侯跃军 -> houyuejun */
- (NSString *)yj_pinyinWithoutBlankUppercase:(BOOL)uppercase{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *str in [self yj_pinyinArrayUppercase:NO]) {
        [string appendString:str];
    }
    return uppercase?[string uppercaseString]:string;
}

/**【没有空格 每个首字母大写】比如: 侯跃军 -> HouYueJun */
- (NSString *)yj_pinyinWithoutBlankCapitalized{
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (NSString *subString in [self yj_pinyinArrayUppercase:NO]) {
        [string appendString:[subString capitalizedString]];
    }
    return string;
}

/**【拼音数组 是否全部大写】比如: 侯跃军 -> @[@"hou", @"yue", @"jun"]*/
- (NSArray *)yj_pinyinArrayUppercase:(BOOL)uppercase{
    NSArray *array = [[self yj_pinyinUppercase:uppercase] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
}

/**【拼音数组 首字母大写】比如:侯跃军 -> @[@"Hou", @"Yue", @"Jun"] */
- (NSArray *)yj_pinyinArrayCapitalized{
    NSArray *array = [[self yj_pinyinCapitalized] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return array;
}

/**【拼音首字母字符串 是否大写】比如: 侯跃军 -> hyj */
- (NSString *)yj_pinyinInitialsStringUppercase:(BOOL)uppercase{
    NSMutableString *pinyin = [NSMutableString stringWithString:@""];
    for (NSString *str in [self yj_pinyinArrayUppercase:NO]) {
        if ([str length] > 0) {
            NSString *subString = [str substringToIndex:1];
            [pinyin appendString:uppercase?[subString uppercaseString]:subString];
        }
    }
    return pinyin;
}

/**【拼音首字母数组 是否大写】 比如: 侯跃军 -> @[@"h", @"y", @"j"] */
- (NSArray*)yj_pinyinInitialsArrayUppercase:(BOOL)uppercase{
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *str in [self yj_pinyinArrayUppercase:NO]) {
        if ([str length] > 0) {
            NSString *subString = [str substringToIndex:1];
            [array addObject:uppercase?[subString uppercaseString]:subString];
        }
    }
    return array;
}


@end
