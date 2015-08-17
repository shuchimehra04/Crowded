//
//  EditSkillCollectionViewCell.h
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const kEditSkillCollectionViewCellReuseID;

@interface EditSkillCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *cross_button;
- (IBAction)cross_buttonAction:(id)sender;

@end
