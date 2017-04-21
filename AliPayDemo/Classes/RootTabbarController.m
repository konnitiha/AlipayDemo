//
//  RootTabbarController.m
//  AliPayDemo
//
//  Created by FuYunLei on 2017/4/21.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "RootTabbarController.h"

#import "HomeViewController.h"
#import "KouBeiViewController.h"
#import "FriendViewController.h"
#import "MineViewController.h"

@interface RootTabbarController ()

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self SetupAllControllers];

}

- (void)SetupAllControllers{
    NSArray *titles = @[@"首页",@"口碑",@"朋友",@"我的"];
    NSArray *vcNames = @[@"HomeViewController",@"KouBeiViewController",@"FriendViewController",@"MineViewController"];
    NSArray *images = @[@"tabbar_home",@"tabbar_koubei",@"tabbar_friend",@"tabbar_mine"];
    
    for (int i = 0; i < vcNames.count; i++) {
        [self setupChildVcWithName:vcNames[i] title:titles[i] image:images[i]];
    }

}

- (void)setupChildVcWithName:(NSString *)vcName title:(NSString *)title image:(NSString *)imageName{
 
    Class cls = NSClassFromString(vcName);
    UIViewController *vc = [[cls alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.title = title;
    vc.title = title;
    [self addChildViewController:nav];
}
@end
