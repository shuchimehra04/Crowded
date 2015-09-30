//
//  LostPasswordViewController.m
//  Crowded
//
//  Created by shuchi mehra on 9/19/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "LostPasswordViewController.h"
#import "CrowdedApiWrapper.h"

@interface LostPasswordViewController ()

@end

@implementation LostPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)submitAction:(id)sender {
    
    [[CrowdedApiWrapper instance] forgotPassword:self.usernameTextfield.text success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
@end
