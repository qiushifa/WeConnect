//
//  EKPhoneViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKPhoneViewController.h"
#import "EKNewChatViewController.h"

@interface EKPhoneViewController ()

@end

@implementation EKPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPressed:)];
     [self setupSegmentedControl];
    // Do any additional setup after loading the view.
}
- (void)setupSegmentedControl{
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"所有通话",@"未接来电"]];
    segment.frame = CGRectMake(10, 200, 200, 30);
    self.navigationItem.titleView = segment;
//    [segment setTitle:@"所有通话" forSegmentAtIndex:0];
//    [segment setTitle:@"未接来电" forSegmentAtIndex:1];
//    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
}
- (void)segmentAction:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        self.view.backgroundColor = [UIColor redColor];
        
    }else if (sender.selectedSegmentIndex == 1){
        self.view.backgroundColor = [UIColor blueColor];
    }
    
}
- (void)addPressed:(UIBarButtonItem *)sender{
    EKNewChatViewController *newChatVC = [EKNewChatViewController shared];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:newChatVC];
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
