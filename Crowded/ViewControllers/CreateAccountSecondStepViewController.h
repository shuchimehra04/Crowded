//
//  CreateAccountSecondStepViewController.h
//  Crowded
//
//  Created by shuchi mehra on 9/30/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrowdedApiWrapper.h"

@interface CreateAccountSecondStepViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *alphaView;

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *postalZip;
@property (weak, nonatomic) IBOutlet UIButton *submit;
- (IBAction)submitAction:(id)sender;
@end
