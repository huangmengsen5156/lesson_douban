//
//  TheatreRequest.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheatreRequest : NSObject


- (void)theatreRequestWithParameter:(NSDictionary *)parameterDic
                      success:(SuccessResponse)success
                      failure:(FailureResponse)failure;






@end
