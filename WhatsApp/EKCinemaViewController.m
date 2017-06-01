//
//  EKCinemaViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//


#import "EKCinemaViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface EKCinemaViewController ()


@end

@implementation EKCinemaViewController

+ (instancetype)sharedCinema{
    static EKCinemaViewController *cinema =  nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cinema = [[self alloc] init];
    });
    return cinema;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
       // Do any additional setup after loading the view.
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
