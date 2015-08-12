//
//  CustomListingTableViewCell.m
//  Crowded
//
//  Created by shuchi mehra on 8/12/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "CustomListingTableViewCell.h"
NSString *const kCustomListingTableViewCellReuseID=@"kCustomListingTableViewCellReuseID";

@implementation CustomListingTableViewCell

- (void)awakeFromNib {
    
    [self.priceLAbel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"price_bg_image"]]];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
