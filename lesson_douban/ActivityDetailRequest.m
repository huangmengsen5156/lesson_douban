//
//  ActivityDetailRequest.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "ActivityDetailRequest.h"

@implementation ActivityDetailRequest

- (void)activityDetailRequestWithParameter:(NSDictionary *)parameter
                                   success:(SuccessResponse)success
                                   failure:(FailureResponse)failure
{
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    NSString *ID = [parameter objectForKey:@"id"];
    
    [request requestWithUrl:ActivityDetailRequest_url(ID) parameters:nil successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}





@end