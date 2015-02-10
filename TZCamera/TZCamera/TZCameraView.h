//
//  TZCameraView.h
//  TZCamera
//
//  Created by MYL-SOFTWARE on 14-12-9.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import "DBCameraDelegate.h"

@interface TZCameraView : UIView <DBCameraViewControllerSettings>

@property (nonatomic, weak) id <DBCameraViewDelegate> delegate;
@property (nonatomic, strong) UIButton *photoLibraryButton;
@property (nonatomic, strong) UIButton *triggerButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *gridButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *flashButton;
@property (nonatomic, strong, readonly) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong, readonly) UITapGestureRecognizer *singleTap;
@property (nonatomic, strong, readonly) UITapGestureRecognizer *doubleTap;
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinch;

+ (id) initWithFrame:(CGRect)frame;
+ (TZCameraView *) initWithCaptureSession:(AVCaptureSession *)captureSession;
- (void) defaultInterface;
- (void) drawFocusBoxAtPointOfInterest:(CGPoint)point andRemove:(BOOL)remove;
- (void) drawExposeBoxAtPointOfInterest:(CGPoint)point andRemove:(BOOL)remove;
- (void) draw:(CALayer *)layer atPointOfInterest:(CGPoint)point andRemove:(BOOL)remove;
- (void) pinchCameraViewWithScalNum:(CGFloat)scale;

@end