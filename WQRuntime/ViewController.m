//
//  ViewController.m
//  WQRuntime
//
//  Created by chenweiqiang on 2018/12/16.
//  Copyright © 2018年 chenweiqiang. All rights reserved.
//

#import "ViewController.h"
#import "WQButtonTestViewController.h"
#import "WQHandleNilObjectViewController.h"
#import "JSONToModelViewController.h"

#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runtime相关运用";
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- UITableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        WQButtonTestViewController *vc = [[WQButtonTestViewController alloc] init];
        vc.title = self.dataSource[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else if (indexPath.row == 1)
    {
        WQHandleNilObjectViewController *vc = [[WQHandleNilObjectViewController alloc] init];
        vc.title = self.dataSource[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2)
    {
        JSONToModelViewController *vc = [[JSONToModelViewController alloc] init];
        vc.title = self.dataSource[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray*)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSArray arrayWithObjects:@"按钮防重复点击",@"交换方法处理异常",@"JSON转Model与序列化", nil];
        
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
