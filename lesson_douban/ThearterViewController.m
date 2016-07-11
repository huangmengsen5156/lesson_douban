//
//  ThearterViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ThearterViewController.h"
#import "TheaterTableViewCell.h"
#import "TheatreRequest.h"
//显示地图
#import "ThearterMapViewController.h"
@interface ThearterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *thearterTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ThearterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.thearterTableView registerNib:[UINib nibWithNibName:@"TheaterTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TheaterTableViewCell_Identify];
    
    self.dataArray = [[NSMutableArray alloc]init];
    
    [self requestThearterData];
    [GiFHUD show];
    
}

- (void)requestThearterData{
    __weak typeof(self)weakSelf = self;
    TheatreRequest *request = [[TheatreRequest alloc]init];
    
    [request theatreRequestWithParameter:nil success:^(NSDictionary *dic) {
        NSLog(@"dict ========== %@",dic);
        NSDictionary *tempdic = dic[@"result"];
        NSArray *array = tempdic[@"data"];
        for (NSDictionary *dict in array) {
            TheatreModel *model = [TheatreModel new];
            [model setValuesForKeysWithDictionary:dict];
            [weakSelf.dataArray addObject:model];
        }
        NSLog(@"dataArray ========%@",weakSelf.dataArray);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [weakSelf.thearterTableView reloadData];
            [GiFHUD dismiss];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error ======= %@",error);
        
    }];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TheaterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TheaterTableViewCell_Identify];
    TheatreModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TheatreModel *model = self.dataArray[indexPath.row];
    ThearterMapViewController *mapVC = [[ThearterMapViewController alloc]init];
    
    [self.navigationController pushViewController:mapVC animated:YES];
    mapVC.model = model;
    
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
