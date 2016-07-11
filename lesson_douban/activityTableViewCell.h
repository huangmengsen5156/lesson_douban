//
//  activityTableViewCell.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
#define activityTableViewCell_Identify @"activityTableViewCell_Identify"



@interface activityTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *activityTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *interestingNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *joinNumberLabel;
@property (strong, nonatomic) IBOutlet UIImageView *activityImageV;
@property (strong, nonatomic) ActivityModel *model;

@end
