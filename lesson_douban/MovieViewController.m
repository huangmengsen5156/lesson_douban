//
//  MovieViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "MoveRequest.h"
#import "movieDetaileViewController.h"
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *movieTableView;

@property (strong, nonatomic) NSMutableArray *movieDataArray;



@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.movieTableView registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieTableViewCell_Identify];
    
    self.movieDataArray = [NSMutableArray array];
    
    [self requestMovieData];
    [GiFHUD show];
}

- (void)requestMovieData{
    MoveRequest *request = [MoveRequest new];
    [request movieRequestWithParameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"dict  ==========%@",dic);
        for (NSDictionary *dict in dic[@"entries"]) {
            MovieModel *model = [MovieModel new];
            [model setValuesForKeysWithDictionary:dict];
            [self.movieDataArray addObject:model];
//            NSLog(@"%@",self.movieDataArray);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.movieTableView reloadData];
            [GiFHUD dismiss];
        });
        
    } failure:^(NSError *error) {
        NSLog(@"error ==========%@",error);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell_Identify];
    
    MovieModel *model = self.movieDataArray[indexPath.row];
    
    [cell setModel:model];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieModel *model = self.movieDataArray[indexPath.row];
    
    [self performSegueWithIdentifier:@"movieDetaile" sender:model];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"movieDetaile" ]) {
        
        movieDetaileViewController *movieVC = segue.destinationViewController;
        
        movieVC.model = sender;
        
    };
    
    
    
}


@end
