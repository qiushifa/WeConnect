//
//  EKTableViewCell.m
//  WhatsApp
//
//  Created by Dove on 2017/6/1.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import "EKTableViewCell.h"

@implementation EKTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnPressed:(UIButton *)sender {
    [self.btnDelegate cellBtnPressed];
}
@end
