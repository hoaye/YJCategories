//
//  UITextField+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2017/7/18.
//  Copyright © 2017年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "UITextField+YJSuperExt.h"

@implementation UITextField (YJSuperExt)

- (BOOL)yj_validateArabicNumber:(NSString *)numberString {
    BOOL res =YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i =0;
    while (i < numberString.length) {
        NSString * string = [numberString substringWithRange:NSMakeRange(i,1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length ==0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (BOOL)yj_isPureNumandCharacters:(NSString *)string{
//    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
//    if(string.length > 0)
//    {
//        return NO;
//    } 
//    return YES;
    
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:string]) {
        return YES;
    }
    return NO;
}


@end
