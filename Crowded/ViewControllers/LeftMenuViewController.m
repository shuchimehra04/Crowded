//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "LeftMenuTableViewCell.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}
- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad
{
	[super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_image"]]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LeftMenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"LeftMenuTableViewCellId"];
    
    
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  LeftMenuTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"LeftMenuTableViewCellId" forIndexPath:indexPath];
    
	switch (indexPath.row)
	{
		case 0:
			cell.label.text = @"SKILLS";
            cell.imageview.image=[UIImage imageNamed:@"tick1"];
			break;
			
		case 1:
			cell.label.text = @"ACCOUNT";
            cell.imageview.image=[UIImage imageNamed:@"account"];

			break;
			
		case 2:
			cell.label.text = @"SETTINGS";
            cell.imageview.image=[UIImage imageNamed:@"setting"];

			break;
			
		case 3:
			cell.label.text = @"PLATFORMS";
            cell.imageview.image=[UIImage imageNamed:@"platform"];

			break;
        case 4:
            cell.label.text = @"TUTORIAL";
            cell.imageview.image=[UIImage imageNamed:@"tutorial"];
            
            break;

        case 5:
            cell.label.text = @"LOGOUT";
            cell.imageview.image=[UIImage imageNamed:@"logout"];

            break;
	}
	cell.alphaView.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    
    cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
	UIViewController *viewController = nil ;
	
	switch (indexPath.row)
	{
        case 0:{
            UIStoryboard *tempStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle:nil];
			viewController = [tempStoryboard instantiateViewControllerWithIdentifier: @"SkillsViewController"];
			break;
        }
        case 1:{
            UIStoryboard *tempStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle:nil];
			viewController = [tempStoryboard instantiateViewControllerWithIdentifier: @"AccountViewController"];
			break;
        }
        case 2:{
            UIStoryboard *tempStoryboard = [UIStoryboard storyboardWithName:@"temp" bundle:nil];
            viewController = [tempStoryboard instantiateViewControllerWithIdentifier: @"SettingViewController"];
            
            break;
        }
        case 3:{
            
			[[SlideNavigationController sharedInstance] popToRootViewControllerAnimated:YES];
			return;
			break;
        }
	}
	
	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:viewController withSlideOutAnimation:self.slideOutAnimationEnabled andCompletion:nil];
}

@end
