//
//  ViewController.m
//  GaoDe2DTemplate
//
//  Created by MYL-SOFTWARE on 14-11-20.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "POIAnnotation.h"
#import "TZCommon.h"
@interface ViewController ()<MAMapViewDelegate,
    AMapSearchDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;
@property (nonatomic, strong) CLLocationManager *locationManager;

// 开启定位
- (void)openLocation;
@end

@implementation ViewController
- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager =[[CLLocationManager alloc] init];
    }
    return _locationManager;
}
- (MAMapView *)mapView
{
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight-20)];
    }
    return _mapView;
}
- (void)initMapView
{
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
}

// 开启定位
- (void)openLocation
{
    // fix ios8 location issue
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
#ifdef __IPHONE_8_0
        if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
        {
            [self.locationManager performSelector:@selector(requestAlwaysAuthorization)];
            //用这个方法，plist中需要NSLocationAlwaysUsageDescription
        }
        
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [self.locationManager performSelector:@selector(requestWhenInUseAuthorization)];
            //用这个方法，plist里要加字段NSLocationWhenInUseUsageDescription
        }
#endif
    }
    self.mapView.showsUserLocation = YES;
    
}

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"高德2D地图工程模板";
}
- (void)viewWillAppear:(BOOL)animated
{
    [self initMapView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
