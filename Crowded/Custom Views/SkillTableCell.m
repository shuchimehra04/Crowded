//
//  SkillTableCell.m
//  Crowded
//
//  Created by Er Sanjay Morya on 15/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "SkillTableCell.h"

@implementation SkillTableCell

- (void)awakeFromNib {
    
}

-(IBAction)selectButtonTapped:(UIButton *)sender
{
    [self.delegate customCell:self okbuttonPressedofIndex:self.cellIndex];
}
-(IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self.delegate customCell:self cancelButtonPressedofIndex:self.cellIndex];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
