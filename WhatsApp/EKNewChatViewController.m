//
//  EKNewChatViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKNewChatViewController.h"

@interface EKNewChatViewController ()

@end

@implementation EKNewChatViewController

+ (instancetype)shared{
    static EKNewChatViewController *newchat = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        newchat = [[self alloc] init];
    });
    return newchat;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新通话";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPressed:)];
    // Do any additional setup after loading the view.
}
- (void)cancelPressed:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
