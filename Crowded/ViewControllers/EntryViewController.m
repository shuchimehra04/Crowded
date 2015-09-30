//
//  EntryViewController.m
//  Crowded
//
//  Created by shuchi mehra on 9/13/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "EntryViewController.h"
#import "CrowdedApiWrapper.h"

@interface EntryViewController ()

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.loginBtn.layer.borderWidth=2.0f;
    
    self.signupBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.signupBtn.layer.borderWidth=2.0f;
    
    
    // Do any additional setup after loading the view.
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

- (IBAction)loginAction:(id)sender {
    //LostPasswordViewController
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle: nil];
    
    UIViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewControllerStoryboradID"];
    
    [self.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)signupAction:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle: nil];
    
    UIViewController *viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"CreateAccountViewControllerStoryboardID"];

    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
@end
