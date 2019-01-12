//
//  UIControl+WQExtension.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/7.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "UIControl+WQExtension.h"
#import <objc/runtime.h>

@implementation UIControl (WQExtension)

+ (void)load{
    Method originalMethod = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(WQ_SendAction:to:forEvent:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


#pragma mark -- 添加时间间隔属性 --
static const void *ButtonDurationTime = @"ButtonDurationTime";
- (NSTimeInterval)durationTime{
    NSNumber *number = objc_getAssociatedObject(self, &ButtonDurationTime);
    return number.doubleValue;
}
- (void)setDurationTime:(NSTimeInterval)durationTime{
    NSNumber *number = [NSNumber numberWithDouble:durationTime];
    objc_setAssociatedObject(self, &ButtonDurationTime, number, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)WQ_SendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if ([self respondsToSelector:@selector(durationTime)] && self.durationTime > 0) {
        self.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.durationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.userInteractionEnabled = YES;
        });
    }
    [self WQ_SendAction:action to:target forEvent:event];
}

@end
