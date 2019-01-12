//
//  Student.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/7.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [self init]) {
        //获取类的属性及属性对应的类型
        NSMutableArray * keys = [NSMutableArray array];

        unsigned int outCount;
        objc_property_t * properties = class_copyPropertyList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            objc_property_t property = properties[i];
            //通过property_getName函数获得属性的名字
            NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        //立即释放properties指向的内存
        free(properties);
        
        //根据类型给属性赋值
        for (NSString * key in keys) {
            if ([dict valueForKey:key] == nil) continue;
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        //传统写法
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        self.number = [aDecoder decodeObjectForKey:@"number"];
//        self.score = [aDecoder decodeInt32ForKey:@"score"];
        
        unsigned int outCount;
        Ivar * ivars = class_copyIvarList([self class], &outCount);
        for (int i = 0; i < outCount; i ++) {
            Ivar ivar = ivars[i];
            NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    //传统写法
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.number forKey:@"number"];
//    [aCoder encodeInt64:self.score forKey:@"score"];
    
    unsigned int outCount;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end
