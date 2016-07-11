//
//  RegisterRequest1.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RegisterRequest1.h"

@implementation RegisterRequest1


- (void)registerWithUsername:(NSString *)username
                    password:(NSString *)password
                      avator:(UIImage *)image
                     success:(SuccessResponse)success
                     failure:(FailureResponse)failure

{
    NSDictionary *parameter = @{@"userName":username,@"password":password};
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    [request sendImageWithUrl:RegisterRequest_url parameters:parameter image:image successResponse:^(NSDictionary *dic) {
        success(dic);
        
        
    } failureResponse:^(NSError *error) {
        failure(error);
    }];
    
}

@end
