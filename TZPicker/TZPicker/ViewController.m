//
//  ViewController.m
//  TZPicker
//
//  Created by MYL-SOFTWARE on 14-12-4.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,
    UIPickerViewDelegate>

@property (nonatomic, strong)NSArray *selectionArr;
@property (nonatomic, strong)NSArray *optionArr;
@property (nonatomic)NSInteger selectRow;
@end

@implementation ViewController

- (NSArray *)selectionArr
{
    if (!_selectionArr) {
        _selectionArr = @[@"分类1",@"分类2"];
    }
    return _selectionArr;
}

- (NSArray *)optionArr
{
    if (!_optionArr) {
        NSArray *opt1 = @[@"S",@"S2",@"S3",@"S4"];
        NSArray *opt2 = @[@"D1",@"D2",@"D3",@"D4"];
        _optionArr = @[opt1,opt2];
    }
    return _optionArr;
}
- (void)createBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 100, 300, 30);
    [btn setTitle:@"picker" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnIsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnIsClicked:(UIButton *)btn
{
    UIPickerView *selectionPicker = [[UIPickerView alloc] init];
    selectionPicker.tag = 0;
    selectionPicker.delegate = self;
    selectionPicker.dataSource = self;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择您的XX" message:@"\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:okAction];
    [alertController.view addSubview:selectionPicker];
    
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}
#pragma mark - UIPicker 代理方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.selectionArr.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:{
            return self.selectionArr.count;
        }
            break;
        case 1:{
            return ((NSArray *)self.optionArr[self.selectRow]).count;
        }
            break;
        default:
            return 0;
            break;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0){
        self.selectRow = row;
        [pickerView reloadComponent:1];
    }
}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    switch (component) {
//        case 0:{
//            return self.selectionArr[row];
//            }
//            break;
//        case 1:{
//            return self.optionArr[self.selectRow][row];
//        }
//            break;
//        default:
//            return nil;
//            break;
//    }
//}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *tempStr;
    switch (component) {
        case 0:{
            tempStr = self.selectionArr[row];
        }
            break;
        case 1:{
            tempStr = self.optionArr[self.selectRow][row];
        }
            break;
        default:
            return nil;
            break;
    }
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:tempStr];
    NSDictionary *attrDict = @{@"NSFontAttributeName":[UIFont systemFontOfSize:15],
                               @"NSBackgroundColor":[UIColor lightGrayColor],
                               @"NSForegroundColorAttributeName":[UIColor greenColor]};
    [attr addAttributes:attrDict range:NSMakeRange(0,tempStr.length)];
    return attr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
