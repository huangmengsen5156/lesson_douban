//
//  MoveRequest.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveRequest : NSObject


- (void)movieRequestWithParameter:(NSDictionary *)parameterDic
                    success:(SuccessResponse)success
                    failure:(FailureResponse)failure;






@end
