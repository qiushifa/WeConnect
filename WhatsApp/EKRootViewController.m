//
//  EKRootViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKRootViewController.h"

#import "EKSettingViewController.h"
#import "EKTrendViewController.h"
#import "EKPhoneViewController.h"
#import "EKChatViewController.h"
#import "EKCinemaViewController.h"
#import "EKTabBar.h"

@interface EKRootViewController ()<EKTabBarDelegate>

@end

@implementation EKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupChildVC:[EKTrendViewController new] title:@"动态" image:[UIImage imageNamed:@"动态"] imageSelected:[UIImage imageNamed:@"动态"]];
    [self setupChildVC:[EKPhoneViewController new] title:@"通话" image:[UIImage imageNamed:@"通话"] imageSelected:[UIImage imageNamed:@"通话"]];
    [self setupChildVC:[EKChatViewController new] title:@"对话" image:[UIImage imageNamed:@"对话"] imageSelected:[UIImage imageNamed:@"对话"]];
    [self setupChildVC:[EKSettingViewController new] title:@"设置" image:[UIImage imageNamed:@"设置"] imageSelected:[UIImage imageNamed:@"设置"]];
    EKTabBar *tabbar = [[EKTabBar alloc] init];
    tabbar.tabBarDelegate = self;
    [self setValue:tabbar forKey:@"tabBar"];
   
    
    // Do any additional setup after loading the view.
}

- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image imageSelected:(UIImage *)selectedImage{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    vc.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

// 弹出照相视图
- (void)centerBtnPressed:(EKTabBar *)tabBar{
    EKCinemaViewController *cinemaVC = [EKCinemaViewController sharedCinema];
    [self presentViewController:cinemaVC animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
