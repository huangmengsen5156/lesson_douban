//
//  ActivityDetailViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()<UMSocialUIDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *activityDetailImageV;
@property (strong, nonatomic) IBOutlet UILabel *namelabel;
@property (strong, nonatomic) IBOutlet UILabel *categorylabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UILabel *textLabel;



@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRightnavigationItems];
    
    
    
    self.title = @"活动详情";
    self.titleLabel.text = self.model.title;
    self.dateLabel.text = self.model.begin_time;
    self.namelabel.text = self.model.user.name;
    self.categorylabel.text = self.model.category_name;
    self.addressLabel.text = self.model.address;
    self.textLabel.text =self.model.content;
    [self.activityDetailImageV setImageWithURL:[NSURL URLWithString:self.model.image]];
    
//    UIImageView *imView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    //毛玻璃效果
//    //    [imView setImage:[ObjectFunction blurryImage:[UIImage imageNamed:@"66.jpg"] withBlurLevel:10.0f]];
//    imView.image = [UIImage imageNamed:@"66.jpg"];
//    [self.view addSubview:imView];
}

- (void)addRightnavigationItems{
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(right1Action:)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(right2Action:)];
    self.navigationItem.rightBarButtonItems =@[right1,right2];

    
    
}

- (void)right1Action:(UIBarButtonItem *)sender{
    
    
}

- (void)right2Action:(UIBarButtonItem *)sender{
    
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    
    [UMSocialData defaultData].extConfig.title = self.model.title;
    //    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5773e10f67e58e16e0004cc1" shareText:self.model.title shareImage:self.activityDetailImageV.image shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina] delegate:self];
    

    
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
