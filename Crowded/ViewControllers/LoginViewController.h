//
//  LoginViewController.h
//  Crowded
//
//  Created by Er Sanjay Morya on 14/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *aplhaView;
@property (weak, nonatomic) IBOutlet UIButton *submitView;
- (IBAction)submitAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (weak, nonatomic) IBOutlet UIButton *lostPassword;
- (IBAction)lostPasswordAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookbtn;
@property (weak, nonatomic) IBOutlet UIButton *linkedInButton;
- (IBAction)linkedInAction:(id)sender;
- (IBAction)facebookAction:(id)sender;
@end
