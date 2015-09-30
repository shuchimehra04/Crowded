//
//  CreateAccountViewController.h
//  Crowded
//
//  Created by shuchi mehra on 9/13/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UIView *alphaView;
- (IBAction)submitAction:(id)sender;
@end
