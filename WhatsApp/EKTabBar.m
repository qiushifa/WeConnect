//
//  EKTabBar.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKTabBar.h"

@interface EKTabBar ()

@end

@implementation EKTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *cinemaBtn = [UIButton new];
        
        [cinemaBtn setImage:[UIImage imageNamed:@"相机"] forState:UIControlStateNormal];
        CGRect temp = cinemaBtn.frame;
        temp.size = cinemaBtn.currentImage.size;
        cinemaBtn.frame = temp;
        
        [cinemaBtn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cinemaBtn];
        self.btn = cinemaBtn;
        
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / 5;
    CGFloat btnH = self.frame.size.height;
    
    int index = 0;
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = btnW * ((index > 1) ? (index +1): index);
        btn.frame = CGRectMake(buttonX, btnY, btnW, btnH);
        index ++;
    
    }
    
//    self.btn.frame.size = self.btn.currentBackgroundImage.size;
    self.btn.frame = CGRectMake(0, 0, self.btn.frame.size.width,self.btn.frame.size.height);
    self.btn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}

- (void)btnPressed:(id)sender{
    
    if ([self.tabBarDelegate respondsToSelector:@selector(centerBtnPressed:)]) {
        [self.tabBarDelegate centerBtnPressed:self];
    }
    
    
}




/*
 
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
