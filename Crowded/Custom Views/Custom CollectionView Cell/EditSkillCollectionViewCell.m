//
//  EditSkillCollectionViewCell.m
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "EditSkillCollectionViewCell.h"
NSString *const kEditSkillCollectionViewCellReuseID=@"kEditSkillCollectionViewCellReuseID";

@implementation EditSkillCollectionViewCell

- (void)awakeFromNib {
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setBorderWidth:1.0];
    [self.layer setCornerRadius:3.0f];
    
    
    // Initialization code
}

- (IBAction)cross_buttonAction:(id)sender {
}
@end
