//
//  MyTableViewController.m
//  TableViewTemplate
//
//  Created by MYL-SOFTWARE on 14-11-20.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "MyTableViewController.h"
#import "common.h"
#import "MyCell.h"
#import "Model.h"

@interface MyTableViewController ()<UITableViewDataSource,
    UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *models;

@end

@implementation MyTableViewController

- (NSMutableArray *)models{
    if (!_models) {
        _models = [NSMutableArray array];
    }
    return _models;
}
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    }
    return _tableView;
}

- (void)initTableView{
    
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    [self.view addSubview:self.tableView];
}
- (void)clearTable{
    self.tableView.delegate     = nil;
    self.tableView.dataSource   = nil;
    [self.tableView removeFromSuperview];
}

#pragma mark tabledelegate & tableviewdatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = [MyCell cellWithTableView:tableView];
    cell.model = self.models[indexPath.row];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.models.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"You did Selected At Index :%d",(int)indexPath.row);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"You did DeSelected At Index :%d",(int)indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - lefecycle method;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TableView工程模板";
    
    // 生成假数据
    for (int i = 0; i < 20; i++) {
        Model *model = [[Model alloc] init];
        model.name = [NSString stringWithFormat:@"Name is Denny%d",i];
        model.code = [NSString stringWithFormat:@"Code is Num%d",i];
        
        [self.models addObject:model];
    }
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [self initTableView];
}
- (void)viewWillDisappear:(BOOL)animated{
    [self clearTable];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
