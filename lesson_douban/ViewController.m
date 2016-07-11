//
//  ViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ViewController.h"

#import "ActivityRequest.h"
#import "ActivityDetailRequest.h"
#import "ActivityModel.h"


#import "TheatreRequest.h"


#import "MoveRequest.h"
#import "MovieDetailRequest.h"
#import "MovieModel.h"


@interface ViewController ()

//活动
@property(nonatomic,strong)NSMutableArray *activities;

//电影
@property(nonatomic,strong)NSMutableArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.activities = [NSMutableArray array];
    
    self.movies = [NSMutableArray array];
//    [self requestActiviyData];
//    [self requestActivityDetailDataWith:@"26865955"];
//    [self requestTheatreData];
    [self requestMovieData];
}
//活动
- (void)requestActiviyData
{
    __weak typeof(self) weakSelf = self;
    ActivityRequest *activity = [[ActivityRequest alloc]init];
    
    [activity activityRequestWithParameter:nil success:^(NSDictionary *dic) {
        //        NSLog(@"success ===== %@",dic);
        
        NSArray *events = [dic objectForKey:@"events"];
        
        //        NSLog(@"events ========%@",events);
        
        for (NSDictionary *tempDict in events) {
//            ActivityModel *model = [ActivityModel new];
//            [model setValuesForKeysWithDictionary:tempDict];
//            [weakSelf.activities addObject:model];
        }
        NSLog(@"activities ======= %@",weakSelf.activities);

    } failure:^(NSError *error) {
        
        NSLog(@"error === %@",error);

    }];

}
//活动详情

- (void)requestActivityDetailDataWith:(NSString *)ID
{
    ActivityDetailRequest *activity = [[ActivityDetailRequest alloc]init];
    
    [activity activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
        NSLog(@"activity detail success ======= %@",dic);
        
    } failure:^(NSError *error) {
        
        NSLog(@"activity error ====== %@",error);
        
    }];
}


//影院
- (void)requestTheatreData
{
    
    TheatreRequest *theatre = [[TheatreRequest alloc]init];
    
    [theatre theatreRequestWithParameter:nil success:^(NSDictionary *dic) {
        NSLog(@"success =======%@",dic);
    } failure:^(NSError *error) {
        NSLog(@"error ====== %@",error);
    }];
    
}

//电影
- (void)requestMovieData
{
    
    __weak typeof(self)weakSelf = self;
    
    MoveRequest *movie = [[MoveRequest alloc]init];
    
    [movie movieRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success ======= %@",dic);
//        NSString *movieTitle = [dic objectForKey:@"title"];
        NSArray *tempMovie = [dic objectForKey:@"entries"];
        for (NSDictionary *tempDic in tempMovie) {
            MovieModel *model = [[MovieModel alloc]init];
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.movies addObject:model];
                }
        NSLog(@"weakSelf movies=========%@",weakSelf.movies);

    } failure:^(NSError *error) {
        NSLog(@"error ======= %@",error);
    }];
    
    
}

- (void)requestMovieDetailDataWith:(NSString *)ID
{
    
    MovieDetailRequest *movie = [[MovieDetailRequest alloc]init];
    [movie requestMovieDetailParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@" ======== %@",dic);
    } failure:^(NSError *error) {
        NSLog(@"error ======= %@",error);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
