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
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        //[self loadViews];
       // [self constrainViews];
    }
    return self;
}
- (void)awakeFromNib {
    
   // self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

    [self.priceLAbel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"price_bg_image_list_screen"]]];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
