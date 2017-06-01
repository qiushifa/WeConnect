//
//  EKTabBar.h
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EKTabBar;

@protocol EKTabBarDelegate <UITabBarDelegate>

@optional
- (void)centerBtnPressed:(EKTabBar *)tabBar;
@end


@interface EKTabBar : UITabBar
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, weak) id <EKTabBarDelegate> tabBarDelegate;
@end
