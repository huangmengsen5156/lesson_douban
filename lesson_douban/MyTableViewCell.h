//
//  MyTableViewCell.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MyTableViewCell_Identify @"MyTableViewCell_Identify"

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UILabel *subContentLabel;

@end
