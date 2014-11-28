//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by MYL-SOFTWARE on 14-11-25.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (nonatomic, strong)WKWebView *webView;

@end

@implementation ViewController

- (void)initWebView{
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self.view addSubview:self.webView];
}

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"浏览器测试";
    [self initWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
