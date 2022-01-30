//
//  NSObject+YJUnicodeConvert.m
//  YJCategoriesGather
//
//  Created by YJHou on 15/11/28.
//  Copyright © 2015年 YJHou. All rights reserved.
//

#import "NSObject+YJUnicodeConvert.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (YJUnicodeConvert)

// description 会报错，待查
- (NSString *)description1 {
    
  NSMutableDictionary *debugInfos = [NSMutableDictionary dictionary];
  
  unsigned int count = 0;
  Ivar *ivars = class_copyIvarList(self.class, &count);
  for (unsigned int i = 0; i < count; ++i) {
    Ivar ivar = ivars[i];
    
    const char *name = ivar_getName(ivar);
    NSString *ivarName = [NSString stringWithUTF8String:name];
    NSLog(@"%@", ivarName);
    
    NSString *propertyName = ivarName;
    if ([propertyName hasPrefix:@"_"]) {
      propertyName = [propertyName substringFromIndex:1];
    }

   const char *type = ivar_getTypeEncoding(ivar);
    NSString *typeEncoding = [NSString stringWithUTF8String:type];
    id value = nil;
    
    // object
    if ([typeEncoding rangeOfString:@"@"].location != NSNotFound) {
      value =  ((id (*)(id, SEL))objc_msgSend)((id)self, NSSelectorFromString(propertyName));
    } else if ([typeEncoding rangeOfString:@"*"].location != NSNotFound) {
      char *v = ((char * (*)(id, SEL))objc_msgSend)((id)self, NSSelectorFromString(propertyName));
      value = [NSString stringWithUTF8String:v];
    } else if ([typeEncoding rangeOfString:@"#"].location != NSNotFound) {
      value = propertyName;
    } else if ([typeEncoding rangeOfString:@"^"].location != NSNotFound) {
      value = @"基本C指针";
    } else {
      @try {
        value = [self valueForKey:propertyName];
      }
      @catch (NSException *exception) {
        
      }
      @finally {
      }
    }
    
    value = value == nil ? @"<nil>" : value;
    
    [debugInfos setValue:value forKey:propertyName];
  }
  
  free(ivars);
  
  return debugInfos.description;
}

- (NSString *)debugDescription1 {
  NSMutableDictionary *debugInfos = [NSMutableDictionary dictionary];
  
  unsigned int count = 0;
  Ivar *ivars = class_copyIvarList(self.class, &count);
  for (unsigned int i = 0; i < count; ++i) {
    Ivar ivar = ivars[i];
    
    const char *name = ivar_getName(ivar);
    NSString *ivarName = [NSString stringWithUTF8String:name];
    NSLog(@"%@", ivarName);
  }
  
  free(ivars);
  
  return debugInfos.debugDescription;
}

@end
