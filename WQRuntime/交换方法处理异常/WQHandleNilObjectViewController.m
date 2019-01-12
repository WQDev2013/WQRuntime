//
//  WQHandleNilObjectViewController.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/7.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "WQHandleNilObjectViewController.h"

@interface WQHandleNilObjectViewController ()

@end

@implementation WQHandleNilObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //字典空值
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"2" forKey:@"keytest"];
    NSString *str;
    [dic setObject:str forKey:@"aaa"];
    
    //数组空值
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:@"asd"];
    NSString *str2;
    [arr addObject:str2];
    
    // Do any additional setup after loading the view.
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
