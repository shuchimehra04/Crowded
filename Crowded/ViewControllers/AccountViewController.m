//
//  AccountViewController.m
//  Crowded
//
//  Created by Er Sanjay Morya on 09/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()


@end

@implementation AccountViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTitle:@"Account Settings"];
 [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:62.0/255.0 green:65.0/255.0 blue:68.0/255.0 alpha:1.0f]];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_image"]]];
    [self.account_bg setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
    [self.change_loc_view setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
    
    [self.change_password_vew setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
    
    [self.email_view setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.4]];
}

-(IBAction)saveButtonTapped:(UIButton *)sender
{
    
}

#pragma mark - UITextfield Delegate Methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"%s",__func__);
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
