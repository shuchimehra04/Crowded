//
//  PlatformListingsDetailsViewController.h
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlatformListingsDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *ActionVisitPlatform;
- (IBAction)actionVisit:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)back_btn:(id)sender;

@end
