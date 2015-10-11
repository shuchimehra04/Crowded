//
//  LeftMenuTableViewCell.h
//  Crowded
//
//  Created by shuchi mehra on 10/1/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString const *LeftMenuTableViewCellId;

@interface LeftMenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIView *alphaView;

@end
