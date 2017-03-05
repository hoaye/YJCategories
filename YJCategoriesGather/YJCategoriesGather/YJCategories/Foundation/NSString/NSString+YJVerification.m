//
//  NSString+YJVerification.m
//  YJCategoriesGather
//
//  Created by YJHou on 2014/11/4.
//  Copyright © 2014年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSString+YJVerification.h"

@implementation NSString (YJVerification)

/** 验证正则 regex */
- (BOOL)yj_isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pre evaluateWithObject:self];
}

/** 手机号分服务商验证 */
- (BOOL)yj_isMobileNumberClassification{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";//总况
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    if (([self yj_isValidateByRegex:CM])
        || ([self yj_isValidateByRegex:CU])
        || ([self yj_isValidateByRegex:CT])
        || ([self yj_isValidateByRegex:PHS])){
        return YES;
    }else{
        return NO;
    }
}

/** 手机号有效性 */
- (BOOL)yj_isMobileNumber{
    NSString *mobileRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[0678]|18[0-9]|14[57])[0-9]{8}$";
    BOOL ret1 = [self yj_isValidateByRegex:mobileRegex];
    return ret1;
}

/** 手机运营商 */
- (NSString *)yj_mobileNumberAscription{
    
    // 中国移动
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";

    // 中国联通
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";

    // 中国电信
    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";
    
    // 大陆地区固话及小灵通
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    if ([self yj_isValidateByRegex:CM]) {
        return @"中国移动";
    }else if ([self yj_isValidateByRegex:CU]){
        return @"中国联通";
    }else if ([self yj_isValidateByRegex:CT]){
        return @"中国电信";
    }else if ([self yj_isValidateByRegex:PHS]){
        return @"大陆地区固话或小灵通";
    }else{
        return @"未知";
    }
}

@end
