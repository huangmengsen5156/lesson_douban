//
//  OwnerModel.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface OwnerModel : BaseModel
//组织者名称
@property(nonatomic, copy) NSString *name;
//组织者图片
@property(nonatomic, copy) NSString *avatar;
//
@property(nonatomic, copy) NSString *uid;
//购票推荐的网址
@property(nonatomic, copy) NSString *alt;
//类型
@property(nonatomic, copy) NSString *type;
//编号
@property(nonatomic, copy) NSString *ID;
//大头像
@property(nonatomic, copy) NSString *large_avatar;



@end
