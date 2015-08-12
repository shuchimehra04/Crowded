//
//  SettingViewController.m
//  Crowded
//
//  Created by Er Sanjay Morya on 10/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"nav_bg.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.frame = CGRectMake(0, 0, 320, 44);
    [self.navigationController.navigationBar addSubview:imageView];
    
    [self setTitle:@"Settings"];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:2/255.0 green:0/255.0 blue:80/255.0 alpha:1.0f]}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
