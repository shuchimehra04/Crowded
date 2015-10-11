//
//  LoginViewController.m
//  Crowded
//
//  Created by Er Sanjay Morya on 14/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "LoginViewController.h"
#import "CrowdedApiWrapper.h"
#import "AppDelegate.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <FBSDKCoreKit/FBSDKGraphRequest.h>

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.aplhaView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    self.submitView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.submitView.layer.borderWidth=1.0f;
    
    self.facebookbtn.layer.borderColor=[UIColor whiteColor].CGColor;
    self.facebookbtn.layer.borderWidth=1.0f;
    
    self.linkedInButton.layer.borderColor=[UIColor whiteColor].CGColor;
    self.linkedInButton.layer.borderWidth=1.0f;
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:107.0/255.0 green:194.0/255.0 blue:205.0/255.0 alpha:1.0f]];


    
}
-(void)viewWillAppear:(BOOL)animated
{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#define kOFFSET_FOR_KEYBOARD 40.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:self.usernameTextfield])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
    
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
    
    SlideNavigationController *slide=(SlideNavigationController *)viewController;
    
    LeftMenuViewController *leftMenu = (LeftMenuViewController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"LeftMenuViewController"];
    
  slide.leftMenu = leftMenu;
    slide.menuRevealAnimationDuration = .18;
    
    // Creating a custom bar button for right menu
    UIButton *button  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    slide.rightBarButtonItem = rightBarButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Opened %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
    }];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    appDelegate.window.rootViewController=viewController;
    
    //[self.navigationController pushViewController:viewController animated:YES];

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
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    //@[@"public_profile", @"email", @"user_friends"];
    [login
     logInWithReadPermissions: @[@"public_profile",@"email"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
             [parameters setValue:@"id,name,email" forKey:@"fields"];
             
             [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
              startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                           id result, NSError *error) {
                  NSLog(@"%@",result);
                  NSDictionary *dict=[NSMutableDictionary dictionaryWithDictionary:result];
                 // email = "shuchimehra639@gmail.com";
                  //id = 847612758689138;
                  //name = "Shuchi Mehra";
             [[CrowdedApiWrapper instance] loginUser:[dict objectForKey:@"email"] andID: [dict objectForKey:@"id"]andType:@"facebook" success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  
                               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  
                               }];
                  
              }];
             
//
//             [[CrowdedApiWrapper instance] loginUser: andID: andType:@"facebook" success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                 
//             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                 
//             }];
             NSLog(@"Logged in");
         }
     }];
}
@end
