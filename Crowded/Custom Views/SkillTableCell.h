//
//  SkillTableCell.h
//  Crowded
//
//  Created by Er Sanjay Morya on 15/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//


#import <UIKit/UIKit.h>
@class SkillTableCell;

@protocol SelectOrCancelDetectDelegate <NSObject>
-(void)customCell:(SkillTableCell *)skillVc okbuttonPressedofIndex:(NSInteger)indexValue;
-(void)customCell:(SkillTableCell *)skillVc cancelButtonPressedofIndex:(NSInteger)indexValue;
@end

@interface SkillTableCell : UITableViewCell

@property (nonatomic, assign) id<SelectOrCancelDetectDelegate> delegate;
@property (assign, nonatomic) NSInteger cellIndex;
@property (strong, nonatomic) IBOutlet UILabel *skillLabel;

-(IBAction)selectButtonTapped:(UIButton *)sender;
-(IBAction)cancelButtonTapped:(UIButton *)sender;

@end
