//
//  ViewController.m
//  AFNetworkingTemplate
//
//  Created by MYL-SOFTWARE on 14-11-21.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

@interface ViewController ()

@property (nonatomic, weak)UIImageView *imgView;
@end

@implementation ViewController
#pragma mark - init subviews
- (void)initSubViews{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.tag = 0;
    btn.frame = CGRectMake(10, 60, 300, 30);
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn setTitle:@"load Img" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadImgFormNet:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.tag = 1;
    btn2.frame = CGRectMake(10, 100, 300, 30);
    [btn2 setBackgroundColor:[UIColor greenColor]];
    [btn2 setTitle:@"request test" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(loadImgFormNet:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
    CGRect frame = CGRectMake(10, 140, 300, 100);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    [self.view addSubview:imgView];
    self.imgView = imgView;
}

- (void)loadImgFormNet:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self requestImgFromNet];
            break;
        case 1:{
            [self testRequestOperation];
            [self testRequestOperationManager];
        }
            break;
        default:
            break;
    }
}
#pragma mark - request
- (void)requestImgFromNet{
    NSURL *URL = [NSURL URLWithString:@"http://www.baidu.com/img/bd_logo1.png"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    
    operation.responseSerializer = [AFImageResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"-------%@--------", responseObject);
        self.imgView.image = responseObject;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"=======%@========", error);
    }];
    [operation start];

}
- (void)testRequestOperation{
    
    NSURL *URL = [NSURL URLWithString:@"http://a509.sinaapp.com/api/list.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];

    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"-------%@--------", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"=======%@========", error);
    }];
    [operation start];
}
- (void)testRequestOperationManager{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"http://a509.sinaapp.com/api/list.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        NSLog(@"%@", error);
    }];
}
#pragma mark - leftcycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
