//
//  LoginRequest.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest


- (void)loginRequestWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure
{
    
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request sendDataWithUrl:LoginRequest_url parameters:@{@"userName": username,@"password": password} successResponse:^(NSDictionary *dic) {
        success(dic);
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
    
}



@end
