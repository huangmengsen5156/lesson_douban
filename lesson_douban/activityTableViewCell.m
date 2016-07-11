//
//  activityTableViewCell.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "activityTableViewCell.h"

@implementation activityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(ActivityModel *)model{
    
        _model = model;
    
    self.titleLabel.text = model.title;
    
        self.dateLabel.text = [NSString stringWithFormat:@"%@-%@",model.begin_time,model.end_time];
    
        self.addressLabel.text = model.address;
    
        self.activityTypeLabel.text = model.category;
    
        self.interestingNumberLabel.text = [NSString stringWithFormat:@"%@",model.wisher_count];
    
        self.joinNumberLabel.text = [NSString stringWithFormat:@"%@",model.participant_count];
    [self.activityImageV setImageWithURL:[NSURL URLWithString:model.image]];
    

    
    
}


@end
