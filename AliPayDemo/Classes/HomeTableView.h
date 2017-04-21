//
//  HomeTableView.h
//  AliPayDemo
//
//  Created by FuYunLei on 2017/4/21.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArray;
- (void)setScrollViewContentOffSet:(CGPoint)point;

@end
