//
//  DoubanTabBar.h
//  lesson_douban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DoubanTabBar;
//自定义代理
@protocol DouBanTabBarDelegate <NSObject>

- (void)DouBanItemDidClicked:(DoubanTabBar *)tabBar;

@end



@interface DoubanTabBar : UITabBar

//当前选中的tabbar的下标
@property(nonatomic, assign)int currentSelected;
//当前选中的item
@property(nonatomic, strong)UIButton *currentSelectdItem;
//tabbar上面所有的item
@property(nonatomic, strong)NSArray *allItems;
//代理
@property(nonatomic, weak) id<DouBanTabBarDelegate>douBanDelegate;


//初始化方法：根根据items初始化items
- (id)initWithItems:(NSArray *)items frame:(CGRect)frame;






@end
