//
//  HomeTableView.m
//  AliPayDemo
//
//  Created by FuYunLei on 2017/4/21.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "HomeTableView.h"

#import "HomeFriendCell.h"
#import "HomeAliCell.h"

@implementation HomeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataSource = self;
        self.delegate = self;
        self.estimatedRowHeight = 150;
         self.rowHeight = UITableViewAutomaticDimension;
        self.dataArray = [NSMutableArray array];
        [self.dataArray addObjectsFromArray:@[@0,@1,@2,@2,@1,@2,@2,@1,@1,@1,@2,@1,@2]];
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeCell"];
        [self registerNib:[UINib nibWithNibName:@"HomeAliCell" bundle:nil] forCellReuseIdentifier:@"HomeAliCell"];
        [self registerNib:[UINib nibWithNibName:@"HomeFriendCell" bundle:nil] forCellReuseIdentifier:@"HomeFriendCell"];
    }
    return self;
}

- (void)setScrollViewContentOffSet:(CGPoint)point{
    self.contentOffset = point;
}


#pragma mark - TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int type = [self.dataArray[indexPath.section] intValue];
    
    if (type == 0) {
        static NSString *cellId = @"HomeCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell.textLabel.text = @"记录我的生活";
        cell.imageView.image = [UIImage imageNamed:@"icon"];
        cell.accessoryView = ({
            UIImageView *imageView;
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            imageView.image = [UIImage imageNamed:@"camera"];
            (UIView *)imageView;

        });
        return cell;
    }else if (type == 1){
        
        static NSString *cellId = @"HomeFriendCell";
        HomeFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        return cell;
    }
    static NSString *cellId = @"HomeAliCell";
    HomeAliCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
@end
