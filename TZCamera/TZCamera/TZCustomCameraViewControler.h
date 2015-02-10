//
//  TZCustomCameraViewControler.h
//  TZCamera
//
//  Created by MYL-SOFTWARE on 14-12-9.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBCameraDelegate.h"
#import "UIViewController+UIViewController_FullScreen.h"

@class TZCameraView;
@class DBCameraViewController;

// custom CameraView
typedef void(^CustomCameraBlock)(TZCameraView *cameraView, id container);

@interface TZCustomCameraViewControler : UIViewController <DBCameraViewControllerSettings>

@property (nonatomic, weak) id <DBCameraViewControllerDelegate> delegate;
@property (nonatomic, strong) DBCameraViewController *cameraViewController;
- (id) initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate;
- (id) initWithDelegate:(id<DBCameraViewControllerDelegate>)delegate customCameraBlock:(CustomCameraBlock)block;

@end
