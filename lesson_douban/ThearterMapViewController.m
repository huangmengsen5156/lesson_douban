//
//  ThearterMapViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ThearterMapViewController.h"
//显示地图
#import <BaiduMapAPI_Map/BMKMapComponent.h>
//地图编码(根据位置信息检索)
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

#import <BaiduMapAPI_Location/BMKLocationService.h>


@interface ThearterMapViewController ()<BMKMapViewDelegate,BMKGeoCodeSearchDelegate,BMKLocationServiceDelegate>
//地图属性
@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) BMKGeoCodeSearch *searcher;


@property (nonatomic, strong) BMKLocationService *locService;


@end

@implementation ThearterMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WindowWidth, WindowHeight)];
//    _mapView.delegate = self;
    _mapView.zoomLevel = 1;
    self.view = _mapView;
    
    //初始化检索对象
    //创建检索对象
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    //创建检索信息类对象
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    
    geoCodeSearchOption.city= self.model.cityName;
    geoCodeSearchOption.address = self.model.address;
    BOOL flag = [_searcher geoCode:geoCodeSearchOption];
    if(flag)
    {
        NSLog(@"geo检索发送成功");
    }
    else
    {
        NSLog(@"geo检索发送失败");
    }
    
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    
    
    
}
#warning  ----------------地图
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    //设置代理
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    //当不适用地图的时候,把代理设置为 nil
    _mapView.delegate = nil; // 不用时，置nil
}



#warning  -------------- 检索 -------
//编码的代理方法
/**
 *返回地址信息搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结BMKGeoCodeSearch果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
//    NSLog(@"searcher ====== %@",result);
    //把上一次显示的大头针清除
    
    //大头针
    BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc]init];
    
    //设置经纬度
    pointAnnotation.coordinate = result.location;
    pointAnnotation.title = result.address;
    NSLog(@"result ====== %@",result);
    [_mapView addAnnotation:pointAnnotation];
    
    _mapView.centerCoordinate = result.location;
    
    
}
/**
 *根据anntation生成对应的View
 *@param mapView 地图View
 *@param annotation 指定的标注
 *@return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation{
    
    //当做大头针视图的标识符
    NSString *annotationViewID = @"annotationViewID";
    //根据标识符，查找一个可以复用的大头针
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    //如果没有可复用的大头针，就创建一个新的大头针，并加上标识符
    //BMKPinAnnotationView是BMKAnnotationView子类，添加了颜色以及一个动画效果
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        //下面给两个是设置效果
        //设置颜色
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorRed;
        //设置动画效果(从天而降的动画效果)
//        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
    }
    
    annotationView.annotation = annotation;
    //可以点击大头针弹出信息
    annotationView.canShowCallout = YES;
    return annotationView;
}



#warning  ---------- 大头针 --------
//实现相关delegate 处理位置信息更新
//处理方向变更信息
//- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
//{
//    //NSLog(@"heading is %@",userLocation.heading);
//    //普通态
//    //以下_mapView为BMKMapView对象
//    _mapView.showsUserLocation = YES;//显示定位图层
//    [_mapView updateLocationData:userLocation];
//    
//}
////处理位置坐标更新
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
//{
//    //NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
