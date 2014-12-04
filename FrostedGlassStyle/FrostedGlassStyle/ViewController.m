//
//  ViewController.m
//  FrostedGlassStyle
//
//  Created by MYL-SOFTWARE on 14-12-4.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"
#import "FXBlurView.h"

@interface ViewController ()
@property (nonatomic, weak) FXBlurView *blurView;
@end

@implementation ViewController

- (void)createblurView {
    FXBlurView *blurView = [[FXBlurView alloc] init];
    blurView.dynamic = NO;
    blurView.tintColor = [UIColor colorWithRed:0 green:0.4 blue:0.4 alpha:1];
    [blurView.layer displayIfNeeded]; //force immediate redraw
    blurView.contentMode = UIViewContentModeBottom;
    blurView.frame = CGRectMake(0, 200, 400,400);
    self.blurView = blurView;
    [self.view addSubview:blurView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    [self createblurView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
