//
//  EKTableViewCell.h
//  WhatsApp
//
//  Created by Dove on 2017/6/1.
//  Copyright © 2017年 Dove. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EKTableViewCellDelegate <NSObject>

- (void)cellBtnPressed;

@end

@interface EKTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (nonatomic, weak) id<EKTableViewCellDelegate> btnDelegate;

@end
