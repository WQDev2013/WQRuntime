//
//  UITapGestureRecognizer+WQExtension.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/6.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "UITapGestureRecognizer+WQExtension.h"

#import <objc/runtime.h>

static const void *UITapGestureRecognizerduration = @"UITapGestureRecognizerduration";

@implementation UITapGestureRecognizer (WQExtension)

#pragma mark - Getter Setter

- (NSTimeInterval)durationTime{
    NSNumber *number = objc_getAssociatedObject(self, &UITapGestureRecognizerduration);
    return number.doubleValue;
}

- (void)setDurationTime:(NSTimeInterval)durationTime{
    NSNumber *number = [NSNumber numberWithDouble:durationTime];
    objc_setAssociatedObject(self, &UITapGestureRecognizerduration, number, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
}

#pragma mark -- 代理 --
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    self.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.durationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.enabled = YES;
    });
    
    return YES;
}

@end
