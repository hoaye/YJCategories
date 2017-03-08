//
//  NSString+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJSuperExt.h"

@implementation NSString (YJSuperExt)

/** 安全取出非nilString, 避免显示(null) */
+ (NSString *)safeString:(NSString *)string{
    if (string) {
        return string;
    }else{
        NSString * blankString = @"";
        return blankString;
    }
}

#pragma mark - 装换Convert

/** NSString -> NSDictionary */
- (NSDictionary *)yj_convertToDictionary{
    NSError *errorJson;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&errorJson];
    if (errorJson != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", self, errorJson);
#endif
    }
    return jsonDict;
}

#pragma mark - remove
/** 移除字符串中的所有空白 */
- (NSString *)yj_removeBlank{
    if (self == nil || [self isEqual:[NSNull null]]) {
        return nil;
    }
    return [self stringByReplacingOccurrencesOfString:@"\\s+" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, [self length])];
}

/** 清除html标签 */
- (NSString *)yj_stringByStrippingHTML{
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, self.length)];
}

/** 清除js脚本 */
- (NSString *)yj_stringByRemovingScriptsAndStrippingHTML{
    NSMutableString *mString = [self mutableCopy];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:mString options:NSMatchingReportProgress range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult *match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString yj_stringByStrippingHTML];
}

/** 将字符串Url里面的参数解析出来 */
- (NSDictionary *)yj_parameterDictionary{
    
    NSString *parameterString = nil;
    if (self) {
        parameterString = [self yj_removeBlank];
    }else{
        return nil;
    }
    
    NSURL *urlPath = [NSURL URLWithString:parameterString];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray * parameters = [urlPath.query componentsSeparatedByString:@"&"];

    for(NSString *parameter in parameters) {
        NSArray *contents = [parameter componentsSeparatedByString:@"="];
        if([contents count] == 2) {
            NSString *key = [contents objectAtIndex:0];
            NSString *value = [contents objectAtIndex:1];
            value = [value stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            if (key && value) {
                [dict setObject:value forKey:key];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

/** 翻转字符串 abc -> cba*/
- (NSString *)yj_reverseString{
    NSMutableString* reverseString = [[NSMutableString alloc] init];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex --;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reverseString appendString:[self substringWithRange:subStrRange]];
    }
    return reverseString;
}


/** Unicode编码的字符串转成NSString */
- (NSString *)yj_makeUnicodeToString{
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    //NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

/** 字符数量 */
- (int)yj_wordsCount{
    NSInteger n = self.length;
    int i;
    int l = 0, a = 0, b = 0;
    unichar c;
    for (i = 0; i < n; i++){
        c = [self characterAtIndex:i];
        if (isblank(c)) {
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (int)ceilf((float)(a + b));
}

/** 精准分段 功能特性如下：1、分页比较准确 2、根据CGRect来计算页数 3、利用多线程加载和分页 */
- (NSArray *)yj_getPagesOfString:(NSString *)string
                            font:(UIFont*)font
                          inRect:(CGRect)rect{
    
    //返回一个数组, 包含每一页的字符串开始点和长度(NSRange)
    NSMutableArray *ranges = [NSMutableArray array];
    //断行类型
    NSLineBreakMode lineBreakMode = NSLineBreakByCharWrapping;
    //显示字体的行高
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGFloat lineHeight;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
        lineHeight = [@"Sample样本"  sizeWithAttributes:@{NSFontAttributeName:font}].height;
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        lineHeight = [@"Sample样本" sizeWithFont:font].height;
#pragma clang diagnostic pop
    }
#else
    CGFloat lineHeight = [@"Sample样本" sizeWithFont:font].height;
#endif
    
    NSInteger maxLine = floor(rect.size.height/lineHeight);
    NSInteger totalLines = 0;
//    NSLog(@"Max Line Per Page: %zd (%.2f/%.2f)", maxLine, rect.size.height, lineHeight);
    NSString *lastParaLeft = nil;
    NSRange range = NSMakeRange(0, 0);
    //把字符串按段落分开, 提高解析效率
    NSArray *paragraphs = [string componentsSeparatedByString:@"\n"];
    for (int p = 0; p<[paragraphs count]; p++) {
        NSString *para;
        if (lastParaLeft != nil) {
            //上一页完成后剩下的内容继续计算
            para = lastParaLeft;
            lastParaLeft = nil;
        } else {
            para = [paragraphs objectAtIndex:p];
            if (p < [paragraphs count] - 1)
                para = [para stringByAppendingString:@"\n"]; //刚才分段去掉了一个换行,现在还给它
        }
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
        CGSize paraSize;
        if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
            paraSize= [para boundingRectWithSize:rect.size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
        }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            paraSize=[para sizeWithFont:font constrainedToSize:rect.size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
        }
#else
        CGSize paraSize=[para sizeWithFont:font constrainedToSize:rect.size lineBreakMode:lineBreakMode];
#endif
        
        NSInteger paraLines = floor(paraSize.height/lineHeight);
        if (totalLines + paraLines < maxLine) {
            totalLines += paraLines;
            range.length += [para length];
            if (p == [paragraphs count] - 1) {
                //到了文章的结尾 这一页也算
                [ranges addObject:[NSValue valueWithRange:range]];
                //IMILog(@"===========Page Over=============");
            }
        } else if (totalLines+paraLines == maxLine) {
            //很幸运, 刚好一段结束,本页也结束, 有这个判断会提高一定的效率
            range.length += [para length];
            [ranges addObject:[NSValue valueWithRange:range]];
            range.location += range.length;
            range.length = 0;
            totalLines = 0;
            //IMILog(@"===========Page Over=============");
        } else {
            //重头戏, 页结束时候本段文字还有剩余
            NSInteger lineLeft = maxLine - totalLines;
            CGSize tmpSize;
            NSInteger i;
            for (i = 1; i< [para length]; i ++) {
                //逐字判断是否达到了本页最大容量
                NSString *tmp = [para substringToIndex:i];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
                if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f){
                    tmpSize= [tmp boundingRectWithSize:rect.size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
                }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                    tmpSize=[tmp sizeWithFont:font constrainedToSize:rect.size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
                }
#else
                tmpSize = [tmp sizeWithFont:font constrainedToSize:rect.size lineBreakMode:lineBreakMode];
#endif
                
                
                int nowLine = floor(tmpSize.height / lineHeight);
                if (lineLeft < nowLine) {
                    //超出容量,跳出, 字符要回退一个, 应为当前字符已经超出范围了
                    lastParaLeft = [para substringFromIndex: i - 1];
                    break;
                }
            }
            range.length += i - 1;
            [ranges addObject:[NSValue valueWithRange:range]];
            range.location += range.length;
            range.length = 0;
            totalLines = 0;
            p--;
            //IMILog(@"===========Page Over=============");
        }
    }
    return [NSArray arrayWithArray:ranges];
}

/** 字符串的匹配相似度 */
- (CGFloat)yj_scoreAgainst:(NSString *)anotherString fuzziness:(NSNumber *)fuzziness options:(YJNSStringScoreOption)options{
    NSMutableCharacterSet *workingInvalidCharacterSet = [NSMutableCharacterSet lowercaseLetterCharacterSet];
    [workingInvalidCharacterSet formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    [workingInvalidCharacterSet addCharactersInString:@" "];
    NSCharacterSet *invalidCharacterSet = [workingInvalidCharacterSet invertedSet];
    
    NSString *string = [[[self decomposedStringWithCanonicalMapping] componentsSeparatedByCharactersInSet:invalidCharacterSet] componentsJoinedByString:@""];
    NSString *otherString = [[[anotherString decomposedStringWithCanonicalMapping] componentsSeparatedByCharactersInSet:invalidCharacterSet] componentsJoinedByString:@""];
    
    // If the string is equal to the abbreviation, perfect match.
    if([string isEqualToString:otherString]) return (CGFloat) 1.0f;
    
    //if it's not a perfect match and is empty return 0
    if([otherString length] == 0) return (CGFloat) 0.0f;
    
    CGFloat totalCharacterScore = 0;
    NSUInteger otherStringLength = [otherString length];
    NSUInteger stringLength = [string length];
    BOOL startOfStringBonus = NO;
    CGFloat otherStringScore;
    CGFloat fuzzies = 1;
    CGFloat finalScore;
    
    // Walk through abbreviation and add up scores.
    for(uint index = 0; index < otherStringLength; index++){
        CGFloat characterScore = 0.1;
        NSInteger indexInString = NSNotFound;
        NSString *chr;
        NSRange rangeChrLowercase;
        NSRange rangeChrUppercase;
        
        chr = [otherString substringWithRange:NSMakeRange(index, 1)];
        
        //make these next few lines leverage NSNotfound, methinks.
        rangeChrLowercase = [string rangeOfString:[chr lowercaseString]];
        rangeChrUppercase = [string rangeOfString:[chr uppercaseString]];
        
        if(rangeChrLowercase.location == NSNotFound && rangeChrUppercase.location == NSNotFound){
            if(fuzziness){
                fuzzies += 1 - [fuzziness floatValue];
            } else {
                return 0; // this is an error!
            }
            
        } else if (rangeChrLowercase.location != NSNotFound && rangeChrUppercase.location != NSNotFound){
            indexInString = MIN(rangeChrLowercase.location, rangeChrUppercase.location);
            
        } else if(rangeChrLowercase.location != NSNotFound || rangeChrUppercase.location != NSNotFound){
            indexInString = rangeChrLowercase.location != NSNotFound ? rangeChrLowercase.location : rangeChrUppercase.location;
            
        } else {
            indexInString = MIN(rangeChrLowercase.location, rangeChrUppercase.location);
            
        }
        
        // Set base score for matching chr
        
        // Same case bonus.
        if(indexInString != NSNotFound && [[string substringWithRange:NSMakeRange(indexInString, 1)] isEqualToString:chr]){
            characterScore += 0.1;
        }
        
        // Consecutive letter & start-of-string bonus
        if(indexInString == 0){
            // Increase the score when matching first character of the remainder of the string
            characterScore += 0.6;
            if(index == 0){
                // If match is the first character of the string
                // & the first character of abbreviation, add a
                // start-of-string match bonus.
                startOfStringBonus = YES;
            }
        } else if(indexInString != NSNotFound) {
            // Acronym Bonus
            // Weighing Logic: Typing the first character of an acronym is as if you
            // preceded it with two perfect character matches.
            if( [[string substringWithRange:NSMakeRange(indexInString - 1, 1)] isEqualToString:@" "] ){
                characterScore += 0.8;
            }
        }
        
        // Left trim the already matched part of the string
        // (forces sequential matching).
        if(indexInString != NSNotFound){
            string = [string substringFromIndex:indexInString + 1];
        }
        
        totalCharacterScore += characterScore;
    }
    
    if(YJNSStringScoreOptionFavorSmallerWords == (options & YJNSStringScoreOptionFavorSmallerWords)){
        // Weigh smaller words higher
        return totalCharacterScore / stringLength;
    }
    
    otherStringScore = totalCharacterScore / otherStringLength;
    
    if(YJNSStringScoreOptionReducedLongStringPenalty == (options & YJNSStringScoreOptionReducedLongStringPenalty)){
        // Reduce the penalty for longer words
        CGFloat percentageOfMatchedString = otherStringLength / stringLength;
        CGFloat wordScore = otherStringScore * percentageOfMatchedString;
        finalScore = (wordScore + otherStringScore) / 2;
        
    } else {
        finalScore = ((otherStringScore * ((CGFloat)(otherStringLength) / (CGFloat)(stringLength))) + otherStringScore) / 2;
    }
    
    finalScore = finalScore / fuzzies;
    
    if(startOfStringBonus && finalScore + 0.15 < 1){
        finalScore += 0.15;
    }
    return finalScore;
}





@end
