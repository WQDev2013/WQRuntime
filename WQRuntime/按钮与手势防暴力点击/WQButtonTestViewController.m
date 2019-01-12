//
//  WQButtonTestViewController.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/6.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "WQButtonTestViewController.h"
#import "UIControl+WQExtension.h"
#import "UITapGestureRecognizer+WQExtension.h"

@interface WQButtonTestViewController ()

@end

@implementation WQButtonTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //按钮测试，1s内最多响应1次
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 50)];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    btn.durationTime = 1;
    [self.view addSubview:btn];
    
    //手势测试，1s内最多响应1次
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewEvent)];
    tap1.durationTime = 1;
    [self.view addGestureRecognizer:tap1];
    // Do any additional setup after loading the view.
}

- (void)clickAction
{
    NSLog(@"点击了按钮:%@",[self CurrentTime]);
}
- (void)tapViewEvent
{
    NSLog(@"点击了View:%@",[self CurrentTime]);
}
///获取当前时间
- (NSString *)CurrentTime{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //“HH”代表24小时制，“hh”代表12小时制
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    return dateString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
