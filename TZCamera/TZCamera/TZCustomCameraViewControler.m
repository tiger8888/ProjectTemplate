//
//  TZCustomCameraViewControler.m
//  TZCamera
//
//  Created by MYL-SOFTWARE on 14-12-9.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "TZCustomCameraViewControler.h"
#import "DBCameraViewController.h"
#import "DBCameraMacros.h"
#import "DBCameraView.h"

@interface TZCustomCameraViewControler () <DBCameraContainerDelegate> {
    CustomCameraBlock _customBlock;
    BOOL _wasStatusBarHidden;
    BOOL _wasWantsFullScreenLayout;
}
@property (nonatomic, strong) DBCameraViewController *defaultCameraViewController;
@end

@implementation TZCustomCameraViewControler
@synthesize tintColor = _tintColor;
@synthesize selectedTintColor = _selectedTintColor;

- (id) initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate
{
    return [[TZCustomCameraViewControler alloc] initWithDelegate:delegate customCameraBlock:nil];
}
- (id)initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate customCameraBlock:(CustomCameraBlock)block
{
    self = [super init];
    if ( self ) {
        _delegate = delegate;
        _customBlock = block;
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:RGBColor(0x000000, 1)];
    [self addChildViewController:self.defaultCameraViewController];
    [self.view addSubview:self.defaultCameraViewController.view];
    if ( _customBlock )
        _customBlock(self.cameraViewController.cameraView, self);
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

#pragma mark - DBCameraContainerDelegate

- (void) backFromController:(id)fromController
{
    [self switchFromController:fromController
                  toController:self.defaultCameraViewController];
}

- (void) switchFromController:(id)fromController toController:(id)controller
{
    [[(UIViewController *)controller view] setAlpha:1];
    [[(UIViewController *)controller view] setTransform:CGAffineTransformMakeScale(1, 1)];
    [self addChildViewController:controller];
    
    __block id blockViewController = fromController;
    
    [self transitionFromViewController:blockViewController
                      toViewController:controller
                              duration:.2
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^(void){ }
                            completion:^(BOOL finished) {
                                [blockViewController removeFromParentViewController];
                                blockViewController = nil;
                            }];
}

#pragma mark - Properties

- (DBCameraViewController *) defaultCameraViewController
{
    if ( !_defaultCameraViewController ) {
        _defaultCameraViewController = [DBCameraViewController initWithDelegate:_delegate];
        if ( self.tintColor )
            [_defaultCameraViewController setTintColor:self.tintColor];
        if ( self.selectedTintColor )
            [_defaultCameraViewController setSelectedTintColor:self.selectedTintColor];
    }
    
    if ( !self.cameraViewController )
        [self setCameraViewController:_defaultCameraViewController];
    
    return self.cameraViewController;
}

- (void) setCameraViewController:(DBCameraViewController *)cameraViewController
{
    _cameraViewController = cameraViewController;
    [_cameraViewController setIsContained:YES];
    [_cameraViewController setContainerDelegate:self];
    _defaultCameraViewController = nil;
}

@end
