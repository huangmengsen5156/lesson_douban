//
//  ActivityViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityViewController.h"
#import "activityTableViewCell.h"
#import "ActivityRequest.h"
#import "ActivityDetailViewController.h"
@interface ActivityViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *activityTableView;

@property (strong, nonatomic) NSMutableArray *activityDataArray;



@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.activityTableView registerNib:[UINib nibWithNibName:@"activityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:activityTableViewCell_Identify];
    
    self.activityDataArray = [[NSMutableArray alloc]init];
    
    
    [self requestActivityData];
    
    [GiFHUD show];
    [GiFHUD setGifWithImageName:@"pika.gif"];
    
}

- (void)requestActivityData{
    
    __weak typeof(self)weakSelf = self;
    ActivityRequest *request = [ActivityRequest new];
    [request activityRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success ===== %@",dic);
        for (NSDictionary *dict in dic[@"events"]) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:dict];
//            NSLog(@"================%@",dict);
            [weakSelf.activityDataArray addObject:model];
//            NSLog(@"===========%@",weakSelf.activityDataArray);
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
             [weakSelf.activityTableView reloadData];
            [GiFHUD dismiss];
        });
       
    } failure:^(NSError *error) {
//                NSLog(@"failure ==== %@",error);
    }];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.activityDataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    activityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:activityTableViewCell_Identify];
    
    ActivityModel *model = self.activityDataArray[indexPath.row];
    
    
//    [cell setModel:model];
    cell.model = model;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActivityModel *model = self.activityDataArray[indexPath.row];
    
    [self performSegueWithIdentifier:@"activityDetail" sender:model];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"activityDetail"]) {
        
        ActivityDetailViewController *detailVC = segue.destinationViewController;
        
        detailVC.model = sender;
    }
}


@end
