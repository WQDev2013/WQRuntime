//
//  NSMutableDictionary+Exception.m
//  MyNilObjectDeal
//
//  Created by chenweiqiang on 2018/6/24.
//  Copyright © 2018年 chenweiqiang. All rights reserved.
//

#import "NSMutableDictionary+Exception.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Exception)

+ (void)load{
    
    [self resolveNilExceptionMethod];
}

+ (void)resolveNilExceptionMethod{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    SEL originalSel = NSSelectorFromString(@"setObject:forKey:");
    SEL exceSel = @selector(haneldeException:forKey:);
    // NSMutableDictionary  __NSDictionaryM
    Method originalMethod = class_getInstanceMethod(object_getClass(dict), originalSel);
    
    Method exchangeMethod = class_getInstanceMethod(object_getClass(dict), exceSel);
    
    //    Method originalMethod = class_getInstanceMethod([self class], originalSel);
    //
    //    Method exchangeMethod = class_getInstanceMethod([self class], exceSel);
    
    method_exchangeImplementations(originalMethod, exchangeMethod);
    
}

- (void)haneldeException:(id)anObject forKey:(id<NSCopying>)aKey{
    
    if (anObject == nil) {
        NSLog(@"字典空值");
        anObject = @"dicNilValue";
    }
    
    [self haneldeException:anObject forKey:aKey];
    
}

@end
