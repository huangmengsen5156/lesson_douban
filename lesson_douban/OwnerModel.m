//
//  OwnerModel.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel


-(NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@",self.ID];
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}


@end
