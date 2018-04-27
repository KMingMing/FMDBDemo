//
//  ViewController.m
//  FMDBDemo
//
//  Created by 孔志林 on 2018/4/27.
//  Copyright © 2018年 KMingMing. All rights reserved.
//

#import "ViewController.h"
#import "KMFMDBManager.h"
#import "KMFMDBModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
/**  tableView    */
@property (nonatomic, strong) UITableView *tableView;
/**  数据源    */
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

#pragma mark - Life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_config];
    [self p_createUI];
}

#pragma mark - Private methods
- (void)p_config
{
    self.navigationItem.title = @"FMDBDemo";
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_icon_introduce"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
}
- (void)p_createUI
{
    
}
- (void)rightBarButtonItemClick
{
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - Lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.rowHeight = 40;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}
- (NSArray *)dataArray
{
    if (_dataArray) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}
@end
