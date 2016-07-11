//
//  NetWorkRequest.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "BaseRequest.h"

//成功回调
typedef void(^SuccessResponse)(NSDictionary *dic);
//失败回调
typedef void(^FailureResponse)(NSError *error);


@interface NetWorkRequest : BaseRequest
//请求数据
/**
 *
 *
 *  @param url           请求地址
 *  @param parametersDic 请求参数
 *  @param success       成功回调的block
 *  @param failurl       失败回调的block
 */
- (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parametersDic
       successResponse:(SuccessResponse)success
       failureResponse:(FailureResponse)failurl;



- (void)sendDataWithUrl:(NSString *)url
             parameters:(NSDictionary *)parametersDic
        successResponse:(SuccessResponse)success
        failureResponse:(FailureResponse)failure;

- (void)sendImageWithUrl:(NSString *)url
              parameters:(NSDictionary *)parametersDic
                   image:(UIImage *)uploadImage
         successResponse:(SuccessResponse)success
         failureResponse:(FailureResponse)failure;



@end
