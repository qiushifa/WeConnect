//
//  EKTrendViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKTrendViewController.h"
#import "EKTrendPrivacyViewController.h"
#import "EKNewChatViewController.h"
#import "EKTableViewCell.h"
#import "EKMyTrendViewController.h"

@interface EKTrendViewController ()<UITableViewDelegate, UITableViewDataSource, EKTableViewCellDelegate>

@property (nonatomic, strong) UITableView *mainView;

@end

@implementation EKTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动态";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"隐私" style:UIBarButtonItemStylePlain target:self action:@selector(leftPressed:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"动态_"] style:UIBarButtonItemStylePlain target:self action:@selector(rightPressed:)];
    self.mainView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.mainView.delegate = self;
    self.mainView.dataSource = self;
    
    [self.view addSubview:self.mainView];

    
//    float x = [UIScreen mainScreen].bounds.size.width;
    // Do any additional setup after loading the view.
}

- (void)leftPressed:(UIBarButtonItem *)sender{
    EKTrendPrivacyViewController *trendVC = [EKTrendPrivacyViewController new];
    [self.navigationController pushViewController:trendVC animated:YES];
}
- (void)rightPressed:(UIBarButtonItem *)sender{
    EKNewChatViewController *newchat = [EKNewChatViewController shared];
    [self presentViewController:newchat animated:YES completion:nil];
}

#pragma mark - 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    static NSString *homeCell = @"homeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    EKTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:homeCell];
    
    
    if (indexPath.section == 1 && cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = @"暂时没有动态更新";
        return cell;
    }else if (indexPath.section == 0 && myCell == nil){

        myCell = [[NSBundle mainBundle] loadNibNamed:@"EKTableViewCell" owner:nil options:nil].firstObject;
        myCell.nameLabel.text = @"我的动态";
        myCell.timeLabel.text = @"20小时之前";
        myCell.moreBtn.titleLabel.text = @"...";
        myCell.btnDelegate = self;
        return myCell;
    }
    
    return nil;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 100 : 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 1 ? 5 : 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell 点击");
    
}

#pragma mark - 

- (void)cellBtnPressed{
    EKMyTrendViewController *myTrendVC = [EKMyTrendViewController new];
    myTrendVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myTrendVC animated:YES];
    NSLog(@"cell 中电钮点击");
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
