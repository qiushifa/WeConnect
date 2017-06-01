//
//  EKSettingViewController.m
//  WhatsApp
//
//  Created by Dove on 2017/5/8.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKSettingViewController.h"

@interface EKSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainView;

@end

@implementation EKSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    self.mainView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    self.mainView.delegate = self;
    self.mainView.dataSource = self;
    [self.view addSubview:_mainView];
    // Do any additional setup after loading the view.
}


#pragma mark - 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;

        case 1:
            return 2;
      
        case 2:
            return 4;
         
        case 3:
            return 2;
            
        default:
            break;
    }
   
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 1) {
        NSString *str = @"";
        str = (indexPath.row == 0 ? @"标注信息" : @"WhatsApp网页版／桌面版");
        cell.textLabel.text = str;
        
        
    } else if (indexPath.section == 2) {
        NSString *str = @"";
        switch (indexPath.row) {
            case 0:
                str = @"账号";
                break;
            case 1:
                str = @"对话";
                break;
            case 2:
                str = @"通知";
                break;
            case 3:
                str = @"数据和存储用量";
                break;
                
            default:
                break;
        }
        cell.textLabel.text = str;
        
    }else if (indexPath.section == 3) {
        NSString *str = @"";
        str = (indexPath.row == 0 ? @"帮助" : @"告诉朋友");
        cell.textLabel.text = str;
    }else{
        
    }
    return cell;
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
