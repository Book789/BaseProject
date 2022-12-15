//
//  LHLocationViewController.m
//  Project
//
//  Created by dc on 2022/4/12.
//

#import "LHLocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LHLocationViewController ()<CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation LHLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self startLocating];
}
-(void)startLocating{
    
    if ([CLLocationManager locationServicesEnabled]) {
        
    }else{
        
    }

    NSInteger status = 0;
    if (@available(iOS 14, *)) {
        status = [self.locationManager authorizationStatus];
    }else{
        status = [CLLocationManager authorizationStatus];
    }
   // NSLog(@"authorizationStatus  %d",[self.locationManager authorizationStatus]);
    if(status == kCLAuthorizationStatusNotDetermined)
    {
        //未决定，继续请求授权
//        [self requestLocationServicesAuthorization];
        [self.locationManager requestWhenInUseAuthorization];//请求定位授权
        [self.locationManager startUpdatingLocation];   //开始定位

    }
    else if(status == kCLAuthorizationStatusRestricted)
    {
        //受限制，尝试提示然后进入设置页面进行处理（根据API说明一般不会返回该值）
//        [self alertViewWithMessage];
    }
    else if(status == kCLAuthorizationStatusDenied)
    {
        //拒绝使用，提示是否进入设置页面进行修改
//        [self alertViewWithMessage];
    }
    else if(status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        //授权使用，不做处理
    }
    else if(status == kCLAuthorizationStatusAuthorizedAlways)
    {
       //始终使用，不做处理
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *location = [locations lastObject];
    
    CLLocationCoordinate2D coordinate = location.coordinate;
    //  经纬度
    NSLog(@"---x:%f---y:%f",coordinate.latitude,coordinate.longitude);
    
    [manager stopUpdatingLocation];   //停止定位
    CLGeocoder *der = [[CLGeocoder alloc] init];
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [der reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *plk = [placemarks firstObject];
        NSLog(@"---城市：%@--街道：%@--全称：%@",plk.locality,plk.thoroughfare,plk.name);
    }];
}

/* 定位失败后 回调 */
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    if (error.code == kCLErrorDenied) {
        // 提示用户出错
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
