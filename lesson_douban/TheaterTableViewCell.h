//
//  TheaterTableViewCell.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheatreModel.h"

#define TheaterTableViewCell_Identify @"TheaterTableViewCell_Identify"
@interface TheaterTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *theaterLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

@property (strong, nonatomic) TheatreModel *model;

@end
