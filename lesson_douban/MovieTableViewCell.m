//
//  MovieTableViewCell.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(MovieModel *)model{
    _model = model;
    
    self.titleLabel.text = model.original_title;
    self.startsLabel.text = model.stars;
    self.dateLabel.text = model.pubdate;
    
    [self.movieImageView setImageWithURL:[NSURL URLWithString:model.images[@"medium"]]];
    
    
}


@end
