//
//  EKChatViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKChatViewController.h"
#import "EKNewChatViewController.h"

@interface EKChatViewController ()

@property (nonatomic, strong) UISegmentedControl *segControl;

@end

@implementation EKChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"对话";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"书写"] style:UIBarButtonItemStylePlain target:self action:@selector(writePressed:)];
   
    
    // Do any additional setup after loading the view.
}
- (void)writePressed:(UIBarButtonItem *)sender{
    EKNewChatViewController *newchat = [EKNewChatViewController shared];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newchat];
    [self presentViewController:nav animated:YES completion:nil];
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
