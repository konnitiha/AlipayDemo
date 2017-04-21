//
//  HomeViewController.m
//  AliPayDemo
//
//  Created by FuYunLei on 2017/4/21.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "FYLBtn.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIView *viewNav;
@property(nonatomic,strong)UIView *viewNavCover;

@property(nonatomic,strong)UIView *viewFounction;
@property(nonatomic,strong)UIView *viewMainFounction;
@property(nonatomic,strong)UIView *viewCustomFounction;

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)HomeTableView *tableView;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor_Blue;
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.viewNav];
    [self.view addSubview:self.viewNavCover];
    [self.view addSubview:self.scrollView];
    [self.viewFounction addSubview:self.viewMainFounction];
    [self.viewFounction addSubview:self.viewCustomFounction];
    [self.scrollView addSubview:self.viewFounction];
    [self.scrollView addSubview:self.tableView];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateContentSize:self.tableView.contentSize];
}

#pragma mark - 按钮点击
- (void)navFunction:(UIButton *)btn{
        NSLog(@"%s,tag = %zi",__FUNCTION__,btn.tag);
}
- (void)mainFunction:(FYLBtn *)btn{
        NSLog(@"%s,tag = %zi",__FUNCTION__,btn.tag);
}
- (void)customFunction:(FYLBtn *)btn{
        NSLog(@"%s,tag = %zi",__FUNCTION__,btn.tag);
}
#pragma mark - 处理
- (void)updateContentSize:(CGSize)size{
    CGSize contentSize = size;
    contentSize.height = MAX(contentSize.height + 250, Screen_Height - 64);
    self.scrollView.contentSize = contentSize;
    
    self.tableView.fyl_h = MAX(size.height, Screen_Height - 63 - 49 - 250);
}

- (void)handleOffset:(CGFloat)offsetY{
    if (offsetY > 100/2.0) {
        //隐藏功能按钮
        [self.scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
        
    } else {
        //展示功能按钮
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    // 松手时判断是否刷新
    CGFloat y = scrollView.contentOffset.y;
    
    
    if (y < -65) {
//        self.mainTableView.mj_header.beginRefreshing()
    } else if (y > 0 && y <= 100 ){
        [self handleOffset:y];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;
    if (y <= 0) {

        self.viewFounction.fyl_y = y;
        

        self.tableView.fyl_y = y + 250;
        
        [self.tableView setScrollViewContentOffSet:CGPointMake(0, y)];

        self.viewMainFounction.fyl_y = 0;
        
         self.viewNav.alpha = 1;
    }else if (y < 100 && y > 0){
    
        self.viewMainFounction.fyl_y = y/2;
        //处理透明度
        CGFloat alpha = (1 - y/100 ) > 0 ? (1 - y/100) : 0;
        self.viewMainFounction.alpha = alpha;
        
        
        if (alpha>0.5) {
            CGFloat newAlpha =  alpha*0.5;
            self.viewNav.alpha = newAlpha;
            self.viewNavCover.alpha = 0;
            self.viewNavCover.hidden = YES;
        } else {
            CGFloat newAlpha =  1 - alpha*2;
            self.viewNav.alpha = 0;
            self.viewNavCover.alpha = newAlpha;
            self.viewNavCover.hidden = NO;
        }

    }
}
#pragma mark - 懒加载
- (UIView *)viewNav{
    if (_viewNav == nil) {
        _viewNav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 64)];
        _viewNav.backgroundColor = kColor_Blue;
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 26, Screen_Width - 100, 30)];
        [textField setLeftViewMode:UITextFieldViewModeAlways];
        textField.leftView = ({
            UIImageView *imageView;
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            imageView.image = [UIImage imageNamed:@"home_search"];
            (UIView *)imageView;
        });
        [textField leftViewRectForBounds:CGRectMake(17, 3.5, 16, 23)];
        textField.placeholder = @"   海鲜大餐";
        [textField setBorderStyle:UITextBorderStyleRoundedRect];
        textField.backgroundColor = [UIColor colorWithRed:23/255.f green:92/255.f blue:171/255.f alpha:1];
        [_viewNav addSubview:textField];
        
        
        UIButton *btnPerson = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnPerson setFrame:CGRectMake(Screen_Width - 60, 30, 25, 25)];
        [btnPerson setImage:[UIImage imageNamed:@"nav_person"] forState:UIControlStateNormal];
        [btnPerson addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
        btnPerson.tag = 1;
        [_viewNav addSubview:btnPerson];
        
        UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnMore setFrame:CGRectMake(Screen_Width - 30, 30, 25, 25)];
        [btnMore setImage:[UIImage imageNamed:@"nav_more"] forState:UIControlStateNormal];
        [btnMore addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
         btnMore.tag = 2;
        [_viewNav addSubview:btnMore];
        
    }
    return _viewNav;
}
- (UIView *)viewNavCover{
    if (_viewNavCover == nil) {
        _viewNavCover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 64)];
        _viewNavCover.backgroundColor = kColor_Blue;
        _viewNavCover.hidden = YES;
        _viewNavCover.alpha = 0;
        
        UIButton *btnScan = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnScan setFrame:CGRectMake(15, 30, 25, 25)];
        [btnScan setBackgroundImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
        [btnScan addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
        btnScan.tag = 4;
        [_viewNavCover addSubview:btnScan];
        
        UIButton *btnPay = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnPay setFrame:CGRectMake(60, 30, 25, 25)];
        [btnPay setBackgroundImage:[UIImage imageNamed:@"pay_mini"] forState:UIControlStateNormal];
        [btnPay addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
        btnPay.tag = 5;
        [_viewNavCover addSubview:btnPay];
        
        UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnSearch setFrame:CGRectMake(105, 30, 25, 25)];
        [btnSearch setBackgroundImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
        [btnSearch addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
        btnSearch.tag = 6;
        [_viewNavCover addSubview:btnSearch];
        
        UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnMore setFrame:CGRectMake(Screen_Width - 30, 30, 25, 25)];
        [btnMore setBackgroundImage:[UIImage imageNamed:@"nav_more"] forState:UIControlStateNormal];
        [btnMore addTarget:self action:@selector(navFunction:) forControlEvents:UIControlEventTouchUpInside];
        btnMore.tag = 2;
        [_viewNavCover addSubview:btnMore];
    }
    return _viewNavCover;
}
- (UIView *)viewFounction{
    if (_viewFounction == nil) {
        _viewFounction = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 250)];
        _viewFounction.backgroundColor = kColor_Blue;
    }
    return _viewFounction;
}
- (UIView *)viewMainFounction{
    if (_viewMainFounction == nil) {
        _viewMainFounction = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 100)];
        _viewMainFounction.backgroundColor = kColor_Blue;
        
        NSArray *titles = @[@"扫一扫",@"付款",@"收款",@"卡券"];
        NSArray *imageNames = @[@"home_scan",@"home_pay",@"home_shoukuan",@"home_card"];
        
        CGFloat width = Screen_Width/titles.count;
        
        for (int i = 0; i<titles.count; i++) {
            FYLBtn *btn = [[FYLBtn alloc] initWithFrame:CGRectMake(i*width, 0, width, 100)];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
            btn.tag = i;
            [btn addTarget:self action:@selector(mainFunction:) forControlEvents:UIControlEventTouchUpInside];
            [_viewMainFounction addSubview:btn];
        }
  
    }
    return _viewMainFounction;
}
- (UIView *)viewCustomFounction{
    if (_viewCustomFounction == nil) {
        _viewCustomFounction = [[UIView alloc] initWithFrame:CGRectMake(0, 100, Screen_Width, 150)];
        _viewCustomFounction.backgroundColor = [UIColor whiteColor];
        
        NSArray *titles = @[@"红包",@"转账",@"充值",@"机票",@"淘票票",@"滴滴出行",@"我的快递",@"全部"];
        NSArray *imageNames = @[@"function_red",@"function_zhuanzhang",@"function_chongzhi",@"function_jipiao",@"function_taopiao",@"function_chuxing",@"function_kuaidi",@"function_all"];
        
        CGFloat width = Screen_Width/4;
        CGFloat height = 150/2.f;
        
        int hang = 0;
        int lie = 0;
        for (int i = 0; i<titles.count; i++) {
            
            hang = i/4;
            lie = i%4;
            FYLBtn *btn = [[FYLBtn alloc] initWithFrame:CGRectMake(lie*width, hang*height, width, height)];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
            btn.tag = i;
            [btn addTarget:self action:@selector(customFunction:) forControlEvents:UIControlEventTouchUpInside];
            [_viewCustomFounction addSubview:btn];
        }
        
    }
    return _viewCustomFounction;
}
- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Screen_Width, Screen_Height - 64)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(Screen_Width, 100);
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(250, 0, 0, 0);
    }
    return _scrollView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        
        _tableView = [[HomeTableView alloc] initWithFrame:CGRectMake(0, 255, Screen_Width, 1000) style:UITableViewStyleGrouped];
        _tableView.scrollEnabled = NO;
  
    }
    return _tableView;
}


@end
