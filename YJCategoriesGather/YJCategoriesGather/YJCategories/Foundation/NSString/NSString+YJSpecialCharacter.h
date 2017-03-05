//
//  NSString+YJSpecialCharacter.h
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJSpecialCharacter)

/** 是否包含特殊emoji */
- (BOOL)yj_isIncludingEmoji;

/** 删除emoji字符 */
- (NSString *)yj_removedEmojiString;

/** emoji转换  "This is a smiley face :smiley:" -> "This is a smiley face \U0001F604" */
- (NSString *)yj_stringByReplacingEmojiCheatCodesWithUnicode;

/** emoji转换  "This is a smiley face \U0001F604" -> "This is a smiley face :smiley:" */
- (NSString *)yj_stringByReplacingEmojiUnicodeWithCheatCodes;

@end
