//
//  MovieModel.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@" ID = %@,image = %@",self.ID,self.images];
}

@end
