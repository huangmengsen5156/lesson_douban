//
//  TheatreModel.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface TheatreModel : BaseModel


//影院标号
@property(nonatomic, copy) NSString *ID;
//影院所在城市名
@property(nonatomic, copy) NSString *cityName;
//影院名
@property(nonatomic, copy) NSString *cinemaName;
//影院地址
@property(nonatomic, copy) NSString *address;
//电话号码
@property(nonatomic, copy) NSString *telephone;
//纬度
@property(nonatomic, copy) NSString *latitude;
//精度
@property(nonatomic, copy) NSString *longitude;
//交通路线
@property(nonatomic, copy) NSString *trafficRoutes;





@end
