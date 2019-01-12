//
//  UITapGestureRecognizer+WQExtension.h
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/6.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITapGestureRecognizer (WQExtension)<UIGestureRecognizerDelegate>

//时间间隔
@property (nonatomic,assign) NSTimeInterval durationTime;

@end
