//
//  JSONToModelViewController.m
//  WQRuntime
//
//  Created by chenweiqiang on 2019/1/7.
//  Copyright © 2019年 chenweiqiang. All rights reserved.
//

#import "JSONToModelViewController.h"
#import "Student.h"
@interface JSONToModelViewController ()

@end

@implementation JSONToModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dic = @{@"name":@"张三",@"number":@"2019",@"score":@"99"};
    Student *s1 = [[Student alloc] init];
    s1 = [[Student alloc] initWithDict:dic];
    NSLog(@"学生1:%@--%@--%ld",s1.name,s1.number,s1.score);
    
    NSDictionary *dic2 = @{@"name":@"李四",@"number":@"2018",@"score":@"100"};
    Student *s2 = [[Student alloc] init];
    s2 = [[Student alloc] initWithDict:dic2];
    NSLog(@"学生2:%@--%@--%ld",s2.name,s2.number,s2.score);
    
    //NSArray及NSMutableArray XML归解档 **** 不适用于对象/
//    NSArray *array = @[s1,s2];
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    // 归档
//    [array writeToFile:path atomically:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 解档
//        NSArray *readArray = [NSArray arrayWithContentsOfFile:path];
//        Student *s3 = [readArray objectAtIndex:0];
//        Student *s4 = [readArray objectAtIndex:1];
//        NSLog(@"学生3:%@--%@--%ld",s3.name,s3.number,s3.score);
//        NSLog(@"学生4:%@--%@--%ld",s4.name,s4.number,s4.score);
//    });
    NSString *homeDirectory = NSHomeDirectory();//获取根目录
    NSString *path  = [homeDirectory stringByAppendingPathComponent:@"student.archiver"];//添加储存的文件名
    NSArray *stuArr = @[s1,s2];
    if ([NSKeyedArchiver archiveRootObject:stuArr toFile:path])
    {
        NSLog(@"写入成功");
    }
    NSArray *readArray = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    Student *s3 = [readArray objectAtIndex:0];
    Student *s4 = [readArray objectAtIndex:1];
    NSLog(@"学生3:%@--%@--%ld",s3.name,s3.number,s3.score);
    NSLog(@"学生4:%@--%@--%ld",s4.name,s4.number,s4.score);
    
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
