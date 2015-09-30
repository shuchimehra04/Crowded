//
//  EntryViewController.h
//  Crowded
//
//  Created by shuchi mehra on 9/13/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signupBtn;
- (IBAction)loginAction:(id)sender;
- (IBAction)signupAction:(id)sender;

@end
