//
//  NSArray+YJSuperExt.m
//  YJCategoriesGather
//
//  Created by YJHou on 2015/3/17.
//  Copyright © 2015年 侯跃军 houmanager@Hotmail.com. All rights reserved.
//

#import "NSArray+YJSuperExt.h"

@implementation NSArray (YJSuperExt)

/** 安全取出数组中的元素,避免越界造成的崩溃 */
- (id)yj_objectSafeAtIndex:(NSUInteger)index{
    if (self.count > index){
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)yj_removeObject:(id)object{
    NSMutableArray *result = [self mutableCopy];
    [result removeObject:object];
    return result;
}

- (NSArray *)yj_removeFirstObject{
    if (self.count == 0) return self;
    return [self subarrayWithRange:NSMakeRange(1, self.count - 1)];
}

- (NSArray *)yj_removeLastObject{
    if (self.count == 0) return self;
    return [self subarrayWithRange:NSMakeRange(0, self.count - 1)];
}

- (NSArray *)yj_reverseObject{
//    return [[self reverseObjectEnumerator] allObjects];
    
    NSMutableArray *resultArray = [NSMutableArray arrayWithArray:self];
    for (NSInteger min = 0, max = resultArray.count - 1; min < max; min++, max--) {
        id tmp = resultArray[min];
        resultArray[min] = resultArray[max];
        resultArray[max] = tmp;
    }
    return resultArray;
}

- (NSInteger)binarySearchObjectIndex:(NSNumber *)obj{
    
    NSInteger min = 0, max = self.count - 1, mid = 0;
    while (min <= max) {
        mid = (min + max) / 2;
        if (obj.integerValue > ((NSNumber *)self[mid]).integerValue) {
            min = mid + 1;
        }else if (obj.integerValue < ((NSNumber *)self[mid]).integerValue){
            max = mid - 1;
        }else{
            return mid;
        }
    }
    return -1;
}

@end

