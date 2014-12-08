//
//  ViewController.m
//  TZCamera
//
//  Created by MYL-SOFTWARE on 14-12-8.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"
#import "DBCameraContainerViewController.h"

@interface DetailViewController : UIViewController {
    UIImageView *_imageView;
}
@property (nonatomic, strong) UIImage *detailImage;
@end

@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
#endif
    
    [self.navigationItem setTitle:@"Detail"];
    
    _imageView = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [_imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:_imageView];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_imageView setImage:_detailImage];
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    _detailImage = nil;
    [_imageView setImage:nil];
}

@end


@interface ViewController ()<DBCameraViewControllerDelegate>

@end

@implementation ViewController

- (void)initNavItem {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftBtnIsClicked:)];
    left.tag = 1;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(leftBtnIsClicked:)];
    right.tag = 2;
    
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNavItem];
    
}
- (void)leftBtnIsClicked:(UIBarButtonItem *)btn
{
    switch (btn.tag) {
        case 1:{
            
        }
            break;
        case 2:{
            DBCameraContainerViewController *cameraContainer = [[DBCameraContainerViewController alloc] initWithDelegate:self];
            [cameraContainer setFullScreenMode];
            
            [self presentViewController:cameraContainer animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}
#pragma mark - 相机代理方法

- (void) dismissCamera:(id)cameraViewController{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    [cameraViewController restoreFullScreenMode];
}

- (void) camera:(id)cameraViewController didFinishWithImage:(UIImage *)image withMetadata:(NSDictionary *)metadata
{
    DetailViewController *detail = [[DetailViewController alloc] init];
    [detail setDetailImage:image];
    [self.navigationController pushViewController:detail animated:NO];
    [cameraViewController restoreFullScreenMode];
//    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
