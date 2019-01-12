//
//  Student.h
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/7.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *number;
@property(nonatomic, assign) NSInteger score;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
