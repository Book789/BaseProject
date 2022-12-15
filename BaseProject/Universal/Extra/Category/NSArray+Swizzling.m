//
//  NSArray+Swizzling.m
//  BaseProject
//
//  Created by dc on 2022/3/28.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import <objc/runtime.h>

@implementation NSArray (Swizzling)
+ (void)load{
    
    static dispatch_once_t onceToken;
    //调用原方法以及新方法进行交换，处理崩溃问题。
    dispatch_once(&onceToken, ^{
        //越界崩溃方式一：[array objectAtIndex:1000];
        Method system_method = class_getInstanceMethod([NSClassFromString(@"__NSArrayI")  class], @selector(objectAtIndex:));
        // 将要替换系统方法
        Method my_method = class_getInstanceMethod([self class], @selector(safeObjectAtIndex:));
        method_exchangeImplementations(system_method, my_method);
                
        //越界崩溃方式二：arr[1000];   Subscript n:下标、脚注
        Method system_subscriptMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayI")  class], @selector(objectAtIndexedSubscript:));
        Method my_subscriptMethod = class_getInstanceMethod([self class], @selector(safeobjectAtIndexedSubscript:));
        method_exchangeImplementations(system_subscriptMethod, my_subscriptMethod);
    });
}
- (instancetype)safeObjectAtIndex:(NSUInteger)index {
    // 数组越界也不会崩，但是开发的时候并不知道数组越界
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeObjectAtIndex:index];
    }
}
- (instancetype)safeobjectAtIndexedSubscript:(NSUInteger)index{
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeobjectAtIndexedSubscript:index];
    }
}
@end
