//
//  LostPasswordViewController.h
//  Crowded
//
//  Created by shuchi mehra on 9/19/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LostPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
- (IBAction)submitAction:(id)sender;

@end
