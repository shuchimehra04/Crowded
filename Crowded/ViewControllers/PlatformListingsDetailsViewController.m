//
//  PlatformListingsDetailsViewController.m
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "PlatformListingsDetailsViewController.h"

@interface PlatformListingsDetailsViewController ()

@end

@implementation PlatformListingsDetailsViewController

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

- (IBAction)actionVisit:(id)sender {
    
    UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"kEditSkillsViewControllerStoryboardID"];
    [self.navigationController pushViewController:controller animated:YES];
    
}
@end