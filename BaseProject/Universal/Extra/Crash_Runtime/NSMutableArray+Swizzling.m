//
//  NSMutableArray+Swizzling.m
//  BaseProject
//
//  Created by dc on 2022/3/28.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Swizzling)

+ (void)load{
    
    static dispatch_once_t onceToken;
    //调用原方法以及新方法进行交换，处理崩溃问题。
    dispatch_once(&onceToken, ^{
        
//        [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObject:)
//                                withSwizzledSelector:@selector(hdf_safeAddObject:)];

        //越界崩溃方式一：[array objectAtIndex:1000];
        Method system_method = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(objectAtIndex:));
        // 将要替换系统方法
        Method my_method = class_getInstanceMethod([self class], @selector(safeObjectAtIndex:));
        method_exchangeImplementations(system_method, my_method);
                
        //越界崩溃方式二：arr[1000];   Subscript n:下标、脚注
        Method system_subscriptMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(objectAtIndexedSubscript:));
        Method my_subscriptMethod = class_getInstanceMethod([self class], @selector(safeobjectAtIndexedSubscript:));
        method_exchangeImplementations(system_subscriptMethod, my_subscriptMethod);
        
        //添加数据中有nil的情况，剔除掉nil
        Method system_initWithObjectsMethod = class_getInstanceMethod([NSClassFromString(@"__NSPlaceholderArray")  class], @selector(initWithObjects:count:));
        Method my_initWithObjectsMethod = class_getInstanceMethod([self class], @selector(safe_initWithObjects:count:));
        method_exchangeImplementations(system_initWithObjectsMethod, my_initWithObjectsMethod);

        
        //提示移除的数据不能为空
        Method system_removeObjectMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(removeObject:));
        Method my_removeObjectMethod = class_getInstanceMethod([self class], @selector(safeRemoveObject:));
        method_exchangeImplementations(system_removeObjectMethod, my_removeObjectMethod);
        
        //提示数组不能添加为nil的数据
        Method system_addObjectMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(addObject:));
        Method my_addObjectMethod = class_getInstanceMethod([self class], @selector(safeAddObject:));
        method_exchangeImplementations(system_addObjectMethod, my_addObjectMethod);

        
        //7、替换某个数据越界
//        Method system_replaceObjectMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(replaceObjectAtIndex:withObject:));
//        Method my_replaceObjectMethod = class_getInstanceMethod([self class], @selector(safeReplaceObjectAtIndex:withObject:));
//        method_exchangeImplementations(system_replaceObjectMethod, my_replaceObjectMethod);
        
        
        //3、移除数据越界
        Method system_removeObjectcMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(removeObjectAtIndex:));
        Method my_removeObjectIndexMethod = class_getInstanceMethod([self class], @selector(safeRemoveObjectAtIndex:));
        method_exchangeImplementations(system_removeObjectcMethod, my_removeObjectIndexMethod);

        //4、插入数据越界
        Method system_insertObjectMethod = class_getInstanceMethod([NSClassFromString(@"__NSArrayM")  class], @selector(insertObject:atIndex:));
        Method my_insertObjectMethod = class_getInstanceMethod([self class], @selector(safeInsertObject:atIndex:));
        method_exchangeImplementations(system_insertObjectMethod, my_insertObjectMethod);


    });
}
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
        NSLog(@"%s can't insert nil into NSMutableArray", __FUNCTION__);
    } else if (index > self.count) {
        NSLog(@"%s index is invalid", __FUNCTION__);
    } else {
        [self safeInsertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        return;
    }
    
    if (index >= self.count) {
        NSLog(@"%s index out of bound", __FUNCTION__);
        return;
    }
    [self safeRemoveObjectAtIndex:index];
}

- (void)safeAddObject:(id)obj {
    if (obj == nil) {
        NSLog(@"%s can add nil object into NSMutableArray", __FUNCTION__);
    } else {
        [self safeAddObject:obj];
    }
}

- (instancetype)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (anObject == nil) {
        NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
        return nil;
    }
    if (![self objectAtIndex:index]) { //
        NSLog(@"移除索引越界");
        return nil;
    }else {
        return [self safeReplaceObjectAtIndex:index withObject:anObject];
    }
}
- (instancetype)safe_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    BOOL hasNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if ([objects[i] isKindOfClass:[NSArray class]]) {
            NSLog(@"%@", objects[i]);
        }
        if (objects[i] == nil) {
            hasNilObject = YES;
            NSLog(@"%s object at index %lu is nil, it will be filtered", __FUNCTION__, i);
        }
    }
    
    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
    if (hasNilObject) {
        id __unsafe_unretained newObjects[cnt];
        
        NSUInteger index = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] != nil) {
                newObjects[index++] = objects[i];
            }
        }
        
        NSLog(@"%@", [NSThread callStackSymbols]);
        return [self safe_initWithObjects:newObjects count:index];
    }
    
    return [self safe_initWithObjects:objects count:cnt];
}
- (void)safeRemoveObject:(id)obj {
    if (obj == nil) {
        NSLog(@"%s call -removeObject:, but argument obj is nil", __FUNCTION__);
        return;
    }
    [self safeRemoveObject:obj];
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
