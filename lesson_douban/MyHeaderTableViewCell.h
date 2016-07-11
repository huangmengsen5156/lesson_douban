//
//  MyHeaderTableViewCell.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
//MyHeaderTableViewCell的重用标志符
#define MyHeaderTableViewCell_Identify @"MyHeaderTableViewCell_Identify"
@interface MyHeaderTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;

@end
