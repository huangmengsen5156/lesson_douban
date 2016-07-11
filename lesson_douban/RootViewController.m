//
//  RootViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RootViewController.h"
#import "DoubanTabBar.h"
//调用协议
@interface RootViewController ()<DouBanTabBarDelegate>

@property(nonatomic, strong) DoubanTabBar *dbTabBar;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    //添加button
    //活动
    UIButton *firstButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [firstButton setImage:[UIImage imageNamed:@"paper"] forState:(UIControlStateNormal)];
    [firstButton setImage:[UIImage imageNamed:@"paperH"] forState:(UIControlStateSelected)];
    [firstButton setTitle:@"活动" forState:(UIControlStateNormal)];
    [firstButton setTitleColor:[UIColor colorWithRed:38.0/255.0 green:217.0/255 blue:165.0/255 alpha:1] forState:(UIControlStateNormal)];
    [self getButton:firstButton];
    
    //电影
    UIButton *secondButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [secondButton setImage:[UIImage imageNamed:@"video"] forState:(UIControlStateNormal)];
    [secondButton setImage:[UIImage imageNamed:@"videoH"] forState:(UIControlStateSelected)];
    [secondButton setTitle:@"电影" forState:(UIControlStateNormal)];
    [secondButton setTitleColor:[UIColor colorWithRed:38.0/255.0 green:217.0/255 blue:165.0/255 alpha:1] forState:(UIControlStateNormal)];
    [self getButton:secondButton];
    
    //影院
    UIButton *thirdButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [thirdButton setImage:[UIImage imageNamed:@"2image"] forState:(UIControlStateNormal)];
    [thirdButton setImage:[UIImage imageNamed:@"2imageH"] forState:(UIControlStateSelected)];
    [thirdButton setTitle:@"影院" forState:(UIControlStateNormal)];
    [thirdButton setTitleColor:[UIColor colorWithRed:38.0/255.0 green:217.0/255 blue:165.0/255 alpha:1] forState:(UIControlStateNormal)];
    [self getButton:thirdButton];
    
    //我的
    UIButton *fourthButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [fourthButton setImage:[UIImage imageNamed:@"person"] forState:(UIControlStateNormal)];
    [fourthButton setImage:[UIImage imageNamed:@"personH"] forState:(UIControlStateSelected)];
    [fourthButton setTitle:@"我的" forState:(UIControlStateNormal)];
    [fourthButton setTitleColor:[UIColor colorWithRed:38.0/255.0 green:217.0/255 blue:165.0/255 alpha:1] forState:(UIControlStateNormal)];
    [self getButton:fourthButton];
    
    //添加到dbTabBar
    self.dbTabBar = [[DoubanTabBar alloc]initWithItems:@[firstButton,secondButton,thirdButton,fourthButton] frame:CGRectMake(0, WindowHeight -49, WindowWidth, 49)];

    [self.view addSubview:self.dbTabBar];
    //遵循代理
    self.dbTabBar.douBanDelegate = self;
    
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:0/255.0 green:128/255.0 blue:64/255.0 alpha:1]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0/255.0 green:150/255.0 blue:80/255.0 alpha:1]];
    
    
 }
//代理的方法
- (void)DouBanItemDidClicked:(DoubanTabBar *)tabBar{
    //接收传过来的值
    self.selectedIndex = tabBar.currentSelected;
    
}

/*
- (void)setButton:(UIButton *)button
            title:(NSString *)title
            image:(NSString *)image
           selete:(NSString *)selete
{
    
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [button setImage:[UIImage imageNamed:image] forState:(UIControlStateSelected)];
}
*/
- (void)getButton:(UIButton *)button{
    //偏移量
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 15, 0)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, -30, 0)];
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
