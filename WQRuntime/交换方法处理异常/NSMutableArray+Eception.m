//
//  NSMutableArray+Eception.m
//  MyNilObjectDeal
//
//  Created by chenweiqiang on 2018/6/24.
//  Copyright © 2018年 chenweiqiang. All rights reserved.
//

#import "NSMutableArray+Eception.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Eception)

+ (void)load{
    
    [self resolveNilExceptionMethod];
}

+ (void)resolveNilExceptionMethod{
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    SEL originalSel = NSSelectorFromString(@"addObject:");
    SEL exceSel = @selector(haneldeException:);
    // NSMutableDictionary  __NSDictionaryM
    Method originalMethod = class_getInstanceMethod(object_getClass(arr), originalSel);
    Method exchangeMethod = class_getInstanceMethod(object_getClass(arr), exceSel);
    method_exchangeImplementations(originalMethod, exchangeMethod);
}

- (void)haneldeException:(id)anObject{
    
    if (anObject == nil) {
        NSLog(@"数组空值");
        anObject = @"arrNilValue";
        NSLog(@"数组空指针调用栈：%@",[NSThread callStackSymbols]);
        NSLog(@"打印完成");
    }
    
    [self haneldeException:anObject];
    
}

@end
