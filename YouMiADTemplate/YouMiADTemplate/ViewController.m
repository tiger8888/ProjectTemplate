//
//  ViewController.m
//  YouMiADTemplate
//
//  Created by MYL-SOFTWARE on 14-11-27.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"
#import "YouMiView.h"
#import "YouMiWall.h"

@interface ViewController ()<YouMiDelegate>

@property (nonatomic, strong)YouMiView *adsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAds];
    [self initSubViews];
}
- (void)initSubViews{
    
    // 开关，显示广告条
    UISwitch *isOpen = [[UISwitch alloc] initWithFrame:CGRectMake(10, 100, 50, 30)];
    isOpen.on = NO;
    [isOpen addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:isOpen];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.tag = 1;
    btn1.frame = CGRectMake(10, 140, 320, 30);
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitle:@"显示积分墙" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnIsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.tag = 2;
    btn2.frame = CGRectMake(10, 180, 320, 30);
    btn2.backgroundColor = [UIColor grayColor];
    [btn2 setTitle:@"显示推荐墙" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnIsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}
- (void)initAds{
    self.adsView = [[YouMiView alloc] initWithContentSizeIdentifier:YouMiBannerContentSizeIdentifier320x50 delegate:self];
    self.adsView.frame = CGRectMake(0, 0, 320,50);
    [self.adsView start];
    [self.view addSubview:self.adsView];
    self.adsView.hidden = YES;
}
- (void)showWallAds:(BOOL)offer{
    [YouMiWall showOffers:offer didShowBlock:^{
                NSLog(@"墙已显示");
            } didDismissBlock:^{
                NSLog(@"墙已退出");
            }];
}
- (void)showAdsView:(BOOL)on{
    self.adsView.hidden = !on;
}

- (void)switchAction:(UISwitch *)s{
    [self showAdsView:s.on];
}
- (void)btnIsClicked:(UIButton *)btn{
    switch (btn.tag) {
        case 1:{
            [self showWallAds:YES];
        }
            break;
        case 2:{
            [self showWallAds:NO];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - youmi delegate
- (void)didPresentScreen:(YouMiView *)adView{
    NSLog(@"-----didPresentScreen-------");
}
- (void)didReceiveAd:(YouMiView *)adView{
    NSLog(@"-----didReceiveAd-------");
}
- (void)willPresentScreen:(YouMiView *)adView{
    NSLog(@"-----willPresentScreen-------");
}
- (void)willDismissScreen:(YouMiView *)adView{
    NSLog(@"-----willDismissScreen-------");
}
- (void)didFailToReceiveAd:(YouMiView *)adView error:(NSError *)error{
    NSLog(@"-----didFailToReceiveAd-------");
}
- (void)didDismissScreen:(YouMiView *)adView{
    NSLog(@"-----didDismissScreen-------");
}
@end
