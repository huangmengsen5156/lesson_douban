//
//  RegisterRequest1.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterRequest1 : NSObject

- (void)registerWithUsername:(NSString *)username
                        password:(NSString *)password
                      avator:(UIImage *)image
                         success:(SuccessResponse)success
                         failure:(FailureResponse)failure;



@end
