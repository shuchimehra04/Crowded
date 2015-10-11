//
//  CreateAccountViewController.m
//  Crowded
//
//  Created by shuchi mehra on 9/13/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "CrowdedApiWrapper.h"
#import "CreateAccountSecondStepViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface CreateAccountViewController ()<UITextFieldDelegate>
{
    BOOL accessTokenFound;
    
}

@end

@implementation CreateAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.alphaView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    self.submitBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.submitBtn.layer.borderWidth=1.0f;
    
    
    self.facebook_btn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.facebook_btn.layer.borderWidth=1.0f;
    
    self.linked_in_btn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.linked_in_btn.layer.borderWidth=1.0f;
    
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:107.0/255.0 green:194.0/255.0 blue:205.0/255.0 alpha:1.0f]];
    
    
    [[CrowdedApiWrapper instance] getAccessTokensuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        accessTokenFound=YES;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    // Do any additional setup after loading the view.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitAction:(id)sender {
   
    if(accessTokenFound)
    {
    [[CrowdedApiWrapper instance] registerUser:_usernameTextfield.text success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"temp" bundle:nil];
        
        CreateAccountSecondStepViewController *secondController=[storyboard instantiateViewControllerWithIdentifier:@"CreateAccountSecondStepViewControllerStoryboardID"];
        
        [self.navigationController pushViewController:secondController animated:YES];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    }
    
}
- (IBAction)fb_action:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    //@[@"public_profile", @"email", @"user_friends"];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

- (IBAction)linked_in_action:(id)sender {
}
@end
