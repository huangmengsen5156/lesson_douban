//
//  MovieDetailRequest.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetailRequest : NSObject


- (void)requestMovieDetailParameter:(NSDictionary *)parameter
                            success:(SuccessResponse)success
                            failure:(FailureResponse)failure;





@end
