//
//  EKMyTrendViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/6/1.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKMyTrendViewController.h"

@interface EKMyTrendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainView;
@property (nonatomic, strong) UIView *editView;

@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *deleteBtn;

@end

@implementation EKMyTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的动态";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editBtnPressed:)];
   
    
    self.mainView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.mainView.delegate = self;
    self.mainView.dataSource = self;
    [self.view addSubview:self.mainView];
    
  
    self.editView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, screenWidth, 50)];
    self.editView.backgroundColor = [UIColor whiteColor];
    [self addEditView];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 加入编辑试图
- (void)addEditView{
    
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _shareBtn.frame = CGRectMake(0, 0, 40, 40);
    [_shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [_shareBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_shareBtn addTarget:self action:@selector(leftBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [_editView addSubview:_shareBtn];
    
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake(_editView.frame.size.width - 40, 0, 40, 40);
    [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_deleteBtn addTarget:self action:@selector(rightBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [_editView addSubview:_deleteBtn];
    
}

- (void)leftBtnPressed{
    NSLog(@"调用分享");
}
- (void)rightBtnPressed{
    NSLog(@"确认删除");
}
#pragma mark -
- (void)leftPressed:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editBtnPressed:(UIBarButtonItem *)sender{
    
    if ([sender.title  isEqual: @"编辑"]) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
        [self.view addSubview:_editView];
       
    }else{
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        [_editView removeFromSuperview];
    }
    
    self.mainView.allowsMultipleSelectionDuringEditing = !_mainView.editing;
    [_mainView setEditing:!_mainView.editing animated:YES];
}


#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"this is my trend";
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"您的动态将在24小时后消失";
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
