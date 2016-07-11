//
//  LoginRequest.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginRequest : NSObject


- (void)loginRequestWithUsername:(NSString *)username
                        password:(NSString *)password
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;




@end
