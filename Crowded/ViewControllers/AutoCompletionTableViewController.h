//
//  AutoCompletionTableViewController.h
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AutoCompletionTableViewControllerDelegate;
@interface AutoCompletionTableViewController : UITableViewController
@property(strong,nonatomic)id<AutoCompletionTableViewControllerDelegate>delegate;

@end
@protocol AutoCompletionTableViewControllerDelegate <NSObject>

-(void)didSelectTableViewString:(NSString *)string;


@end