//
//  SkillsViewController.h
//  Crowded
//
//  Created by Er Sanjay Morya on 15/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillTableCell.h"

@interface SkillsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SelectOrCancelDetectDelegate>
{
    IBOutlet UITableView *skillsTableView;
}



@end
