//
//  MovieModel.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseModel.h"

@interface MovieModel : BaseModel

//评分
@property(nonatomic, copy) NSString *rating;
//上映时间
@property(nonatomic, copy) NSString *pubdate;
//电影名
@property(nonatomic, copy) NSString *orignal_title;
//所有图片
@property(nonatomic, strong) NSDictionary *images;
//大图片
@property(nonatomic, copy) NSString *large;
//小图片
@property(nonatomic, copy) NSString *small;
//中等图片
@property(nonatomic, copy) NSString *medium;
//电影编号
@property(nonatomic, copy) NSString *ID;
//正在上映的电影数
@property(nonatomic, copy) NSString *total;
//评论数
@property(nonatomic, assign) NSInteger wish;
//原始标题
@property(nonatomic, copy) NSString *original_title;
//收藏数
@property(nonatomic, copy) NSString *collection;
//星级数
@property(nonatomic, copy) NSString *stars;









@end
