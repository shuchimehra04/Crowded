//
//  LoginViewController.m
//  Crowded
//
//  Created by Er Sanjay Morya on 14/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "LoginViewController.h"
#import "CrowdedApiWrapper.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.aplhaView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    self.submitView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.submitView.layer.borderWidth=2.0f;
    
}

- (void)didReceiveMemoryWarning {
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

- (IBAction)submitAction:(id)sender {
    
//    [[CrowdedApiWrapper instance] loginUser:self.usernameTextfield.text andPassword:self.passwordTextfield.text success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    UIViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"SlideNavigationControllerStoryboardID"];
    
    [self.navigationController pushViewController:viewController animated:YES];

    //SlideNavigationControllerStoryboardID
    
}
- (IBAction)lostPasswordAction:(id)sender {
    
    //LostPasswordViewController
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle: nil];
    
    UIViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LostPasswordViewControllerStoryboardId"];
    
    [self.navigationController pushViewController:viewController animated:YES];

    
}
- (IBAction)linkedInAction:(id)sender {
}

- (IBAction)facebookAction:(id)sender {
}
@end
