//
//  NSString+YJSpecialCharacter.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJSpecialCharacter.h"

@implementation NSString (YJSpecialCharacter)

/** 是否包含特殊emoji */
- (BOOL)yj_isIncludingEmoji{
    BOOL __block result = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              if ([substring _yj_isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    return result;
}

/** 删除emoji字符 */
- (NSString *)yj_removedEmojiString{
    NSMutableString * __block buffer = [NSMutableString stringWithCapacity:[self length]];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                              [buffer appendString:([substring _yj_isEmoji])? @"":substring];
                          }];
    
    return buffer;
}


#pragma mark - Private
- (BOOL)_yj_isEmoji {
    
    if ([self _yj_isFuckEmoji]) { return YES; }
    const unichar high = [self characterAtIndex:0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xd800 <= high && high <= 0xdbff) {
        const unichar low = [self characterAtIndex: 1];
        const int codepoint = ((high - 0xd800) * 0x400) + (low - 0xdc00) + 0x10000;
        
        return (0x1d000 <= codepoint && codepoint <= 0x1f77f);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27bf);
    }
}

- (BOOL)_yj_isFuckEmoji{
    NSArray *fuckArray =@[@"⭐",@"㊙️",@"㊗️",@"⬅️",@"⬆️",@"⬇️",@"⤴️",@"⤵️",@"#️⃣",@"0️⃣",@"1️⃣",@"2️⃣",@"3️⃣",@"4️⃣",@"5️⃣",@"6️⃣",@"7️⃣",@"8️⃣",@"9️⃣",@"〰",@"©®",@"〽️",@"‼️",@"⁉️",@"⭕️",@"⬛️",@"⬜️",@"⭕",@"",@"⬆",@"⬇",@"⬅",@"㊙",@"㊗",@"⭕",@"©®",@"⤴",@"⤵",@"〰",@"†",@"⟹",@"ツ",@"ღ",@"©",@"®"];
    //    NSString *test = @"⭐㊙️㊗️⬅️⬆️⬇️⤴️⤵️#️⃣0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣〰©®〽️‼️⁉️⭕️⬛️⬜️⭕⬆⬇⬅㊙㊗⭕©®⤴⤵〰†⟹ツღ";
    //    NSMutableArray *array = [NSMutableArray array];
    //    for (int i = 0;i < [test length]; i++)
    //    {
    //        [array addObject:[test substringWithRange:NSMakeRange(i,1)]];
    //    }
    BOOL result = NO;
    for(NSString *string in fuckArray){
        if ([self isEqualToString:string]) {
            return YES;
        }
    }
    if ([@"\u2b50\ufe0f" isEqualToString:self]) {
        result = YES;
    }
    return result;
}

@end
