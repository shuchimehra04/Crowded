//
//  AccountViewController.h
//  Crowded
//
//  Created by Er Sanjay Morya on 09/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+BorderColorWithRadius.h"
#import "Constant.h"
@interface AccountViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *accountTitleTF;
    IBOutlet UITextField *emailAddressTF;
    IBOutlet UITextField *changePasswordTF;
    IBOutlet UITextField *homeLocationTF;
    
    IBOutlet UIButton *saveButton;
    IBOutlet UIScrollView *scrollView;
}
@property (weak, nonatomic) IBOutlet UIView *email_view;
@property (weak, nonatomic) IBOutlet UIView *change_password_vew;
@property (weak, nonatomic) IBOutlet UIView *change_loc_view;

@property (weak, nonatomic) IBOutlet UIView *account_bg;
-(IBAction)saveButtonTapped:(UIButton *)sender;

@end
