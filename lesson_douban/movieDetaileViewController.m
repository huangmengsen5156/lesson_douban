//
//  movieDetaileViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "movieDetaileViewController.h"
#import "MovieDetailRequest.h"
#import "MovieDetailModel.h"

@interface movieDetaileViewController ()<UMSocialUIDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *movieDetailImageV;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *pubdateLabel;
@property (strong, nonatomic) IBOutlet UILabel *durationsLabel;
@property (strong, nonatomic) IBOutlet UILabel *countriesLabel;
@property (strong, nonatomic) IBOutlet UILabel *wishLabel;

@property (strong, nonatomic) IBOutlet UILabel *genresLabel;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;



//数据库实例
@property(nonatomic,strong)FMDatabase *dataBase;



@end

@implementation movieDetaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.model.original_title;
    

    [self requestMovieDetailDataWith:self.model.ID];
    self.ratingLabel.text = self.model.rating;
    self.pubdateLabel.text = self.model.pubdate;
    
    self.wishLabel.text = [NSString stringWithFormat:@"%ld",self.model.wish];
    
    [self.movieDetailImageV setImageWithURL:[NSURL URLWithString:self.model.images[@"medium"]]];
    [self addRightnavigationItems];
    
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",doc);
    
    NSString *fileName = [doc stringByAppendingPathComponent:@"movie.sqlite"];
    //打开数据库
    self.dataBase = [FMDatabase databaseWithPath:fileName];
    
    if ([self.dataBase open]) {
        
        //创建表
        BOOL result = [self.dataBase executeUpdate:@"create table if not exists movie(ID integer not null,title text not null,pubdate integer not null)"];
        
        if (result) {
            NSLog(@"建表成功");
        }else{
            NSLog(@"建表失败");
        }
        
    }

    
    
    
}

- (void)requestMovieDetailDataWith:(NSString *)iD{
    __weak typeof(self)weakSelf = self;
    MovieDetailRequest *request = [MovieDetailRequest new];
    [request requestMovieDetailParameter:@{@"id":iD} success:^(NSDictionary *dic) {
        weakSelf.textLabel.text = dic[@"summary"];
        NSArray *durations = dic[@"durations"];
        weakSelf.durationsLabel.text = [NSString stringWithFormat:@"%@",durations.firstObject];
        
        NSArray *countries = dic[@"countries"];
        weakSelf.countriesLabel.text =[NSString stringWithFormat:@"%@,%@",countries.firstObject,countries.lastObject] ;
        NSArray *genres = dic[@"genres"];
        weakSelf.genresLabel.text = [NSString stringWithFormat:@"%@,%@,%@",genres.firstObject,genres[1],genres.lastObject];
    } failure:^(NSError *error) {
        NSLog(@"error ====== %@",error);
    }];
    
    
    
}

- (void)addRightnavigationItems{
    
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(right1Action:)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(right2Action:)];
    self.navigationItem.rightBarButtonItems =@[right1,right2];
    
    
    
}
//收藏
- (void)right1Action:(UIBarButtonItem *)sender{
    
    [self insert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"收藏成功" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];

}

- (void)insert{
    NSString *ID = self.model.ID;
    NSString *title = self.model.original_title;
    NSString *pubdate = self.pubdateLabel.text;
    
        [self.dataBase executeUpdateWithFormat:@"insert into movie(id,title,pubdate)values(%@,%@,%@);",ID,title,pubdate];
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"收藏失败，已存在" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self presentViewController:alertController animated:YES completion:nil];

            
        }]];
 
    
    
}


//分享
- (void)right2Action:(UIBarButtonItem *)sender{
    
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
        [UMSocialData defaultData].extConfig.title = @"分享的title";
    //    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5773e10f67e58e16e0004cc1" shareText:self.model.original_title shareImage:self.movieDetailImageV.image shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina] delegate:self];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
