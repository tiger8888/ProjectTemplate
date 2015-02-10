//
//  TZCameraViewController.h
//  TZCamera
//
//  Created by MYL-SOFTWARE on 14-12-9.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBCameraDelegate.h"
#import "UIViewController+UIViewController_FullScreen.h"

@class DBCameraView;
@class DBCameraGridView;
@class DBCameraSegueViewController;

@interface TZCameraViewController : UIViewController <DBCameraSegueSettings, DBCameraViewControllerSettings>

@property (nonatomic, weak) id <DBCameraViewControllerDelegate> delegate;
@property (nonatomic, weak) id <DBCameraContainerDelegate> containerDelegate;
@property (nonatomic, assign) BOOL useCameraSegue;
@property (nonatomic, assign) BOOL isContained;
@property (nonatomic, strong) DBCameraView *cameraView;
@property (nonatomic, strong) DBCameraGridView *cameraGridView;
@property (nonatomic, assign) NSUInteger libraryMaxImageSize;

+ (instancetype) initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate;
+ (instancetype) init;
- (instancetype) initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate cameraView:(id)camera;

@end
