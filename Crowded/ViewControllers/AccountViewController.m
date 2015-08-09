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
    
    NSLog(@"%s",__func__);
    
    UIImage *image = [UIImage imageNamed:@"nav_bg.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.frame = CGRectMake(0, 0, 320, 44);
    [self.navigationController.navigationBar addSubview:imageView];
    
    [self setTitle:@"Account Settings"];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:2/255.0 green:0/255.0 blue:80/255.0 alpha:1.0f]}];
    
    [UITextField changeBorderColor:accountTitleTF];
    [UITextField changeBorderColor:emailAddressTF];
    [UITextField changeBorderColor:changePasswordTF];
    [UITextField changeBorderColor:homeLocationTF];

    [UIButton makeCornerRadiusOfView:saveButton withRadius:3.0f];
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

@end
