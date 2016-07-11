//
//  MyViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MyViewController.h"
#import "LoginViewController.h"
#import "MyHeaderTableViewCell.h"
#import "MyTableViewCell.h"
#import <SDImageCache.h>
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate,UMSocialUIDelegate>

@property(nonatomic,strong)NSArray *titles;

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[@"我的活动",@"我的电影",@"清除缓存"];
    
    [self addRightnavigationItem];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyHeaderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyHeaderTableViewCell_Identify];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MyTableViewCell_Identify];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:(UIBarButtonItemStylePlain) target:self action:@selector(shareAction:)];
    [GiFHUD show];
}
-(void)shareAction:(UIBarButtonItem *)sender{
    //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    //    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5773e10f67e58e16e0004cc1" shareText:@"一切让你快乐到家"shareImage:[UIImage imageNamed:@"icon"]shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina] delegate:self];
    
    
}
- (void)addRightnavigationItem{
    //自定义rightBarBUttonItem
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor colorWithRed:38.0/255.0 green:217.0/255 blue:165.0/255 alpha:1] forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(0, 0, 40, 30);
    [btn addTarget:self action:@selector(rightBarItemClicked) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
 }

- (void)rightBarItemClicked
{
    NSLog(@"clicked clicked");
    //跳转到登录页面
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginViewController *loginVC = [mainSb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    UINavigationController *navigationC = [[UINavigationController alloc]initWithRootViewController:loginVC];
    [self presentViewController:navigationC animated:YES completion:^{
        
        
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 168;
    }
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyHeaderTableViewCell_Identify];
        
        NSString *string = [[NSUserDefaults standardUserDefaults]objectForKey:@"avatar"];
        
        NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://162.211.125.85%@",string]];
//        [cell.avatarImageView sd_setImageWithURL:imageUrl];
        [cell.avatarImageView setImageWithURL:imageUrl];
        NSString *name = [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"];
        cell.usernameLabel.text = name;
        
        return cell;
    }else{
        
        MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyTableViewCell_Identify];
        
        cell.contentLabel.text = self.titles[indexPath.row - 1];
        
        if (indexPath.row == 3) {
            cell.subContentLabel.text = [NSString stringWithFormat:@"%.1fM",[self getFilePath]];
        }
        
        
        return cell;
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.myTableView reloadData];
    [GiFHUD dismiss];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        [self removeCache];
        
        [self.myTableView reloadData];
    }else if (indexPath.row == 1){
        
    }else if (indexPath.row == 2){
        
    }
    
    
}


#warning ------------------------------=======================
//清除缓存
-(void)removeCache
{
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    NSString *path = NSHomeDirectory();
//    if ([fileManager fileExistsAtPath:path]) {
//        NSArray *childerFiles=[fileManager subpathsAtPath:path];
//        for (NSString *fileName in childerFiles) {
//            //如有需要，加入条件，过滤掉不想删除的文件
//            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
//            [fileManager removeItemAtPath:absolutePath error:nil];
//        }
//    }
//    [[SDImageCache sharedImageCache] cleanDisk];
    
    dispatch_async(
                   
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   
                   , ^{
                       
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                       
                       NSLog(@"%@", cachPath);
                       
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       
                       NSLog(@"files :%lu",[files count]);
                       
                       for (NSString *p in files) {
                           
                           NSError *error;
                           
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                               
                           }
                           
                       }
                       
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
    

}

- (void)clearCacheSuccess{
    NSLog(@"清除缓存成功");
}


//缓存
-(float)getFilePath{
    
    //文件管理
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //缓存路径
    
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    
    NSString *cacheDir = [cachePaths objectAtIndex:0];
    
    NSArray *cacheFileList;
    
    NSEnumerator *cacheEnumerator;
    
    NSString *cacheFilePath;
    
    unsigned long long cacheFolderSize = 0;
    
    cacheFileList = [fileManager subpathsOfDirectoryAtPath:cacheDir error:nil];
    
    cacheEnumerator = [cacheFileList objectEnumerator];
    
    while (cacheFilePath = [cacheEnumerator nextObject]) {
        
        NSDictionary *cacheFileAttributes = [fileManager attributesOfItemAtPath:[cacheDir stringByAppendingPathComponent:cacheFilePath] error:nil];
        
        cacheFolderSize += [cacheFileAttributes fileSize];
        
    }
    
    //单位MB
    
    return cacheFolderSize/1024/1024;
    
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
