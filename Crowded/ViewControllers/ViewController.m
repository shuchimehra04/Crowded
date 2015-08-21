//
//  ViewController.m
//  Crowded
//
//  Created by shuchi mehra on 8/5/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "ViewController.h"
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import "HomeViewController.h"

@interface ViewController ()<HomeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];self.portraitSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].portraitSlideOffset];
    self.landscapeSlideOffsetSegment.selectedSegmentIndex = [self indexFromPixels:[SlideNavigationController sharedInstance].landscapeSlideOffset];
    self.panGestureSwitch.on = [SlideNavigationController sharedInstance].enableSwipeGesture;
    self.shadowSwitch.on = [SlideNavigationController sharedInstance].enableShadow;
    self.limitPanGestureSwitch.on = ([SlideNavigationController sharedInstance].panGestureSideOffset == 0) ? NO : YES;
    self.slideOutAnimationSwitch.on = ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled;
    [self setUpSegmentControl];

   HomeViewController *home= [self.childViewControllers objectAtIndex:0];
    home.delegate=self;
    
    
//    UIViewController *oldController=[self.storyboard instantiateViewControllerWithIdentifier:@"kHomeViewControllerStoryboradID"];
//    
//    //[self.navigationController pushViewController:controller animated:YES];
//    oldController.view.frame = self.containerView.frame;
//    
//    [self addChildViewController:oldController];
//    
//    [self removeFromParentViewController];
   // [oldController didMoveToParentViewController:self];

    //[oldController addChildViewController:controller];         // incidentally, this does the `willMoveToParentViewController` for the new controller for you
    
    
}
-(void)didSelect
{
    UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"kPlatformListingsDetailsViewControllerStoryboardID"];
    [self addChildViewController:controller];
    
    [self.containerView addSubview:controller.view];
    [controller didMoveToParentViewController:self];


}
-(void)removeChild:(UIViewController *) child {
    [child didMoveToParentViewController:nil];
    [child.view removeFromSuperview];
    [child removeFromParentViewController];
}
-(void)setUpSegmentControl
{
    UISegmentedControl *statFilter = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"map", @"list", nil]];
    
    [statFilter setFrame:CGRectMake(0, -10,140, 35)];
    [statFilter addTarget:self action:@selector(segmentControlAction:) forControlEvents:UIControlEventValueChanged];
    [statFilter.layer setBorderColor:[UIColor whiteColor].CGColor];
    [statFilter.layer setBorderWidth:1.0f];
    statFilter.layer.cornerRadius=5.0f;
    [statFilter setBackgroundColor:[UIColor blackColor]];
    [statFilter setSelectedSegmentIndex:0];
    
    UIColor *tintcolor=[UIColor colorWithRed:36.0/255.0 green:167.0/255.0 blue:250.0/255.0 alpha:1.0];
    
    [[statFilter.subviews objectAtIndex:0] setTintColor:tintcolor];
    
    [statFilter setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:16.0],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [statFilter setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:16.0],NSForegroundColorAttributeName:[UIColor colorWithRed:3.0/255.0 green:-0/255.0 blue:102.0/255.0 alpha:1.0f]} forState:UIControlStateSelected];
    
    self.navigationItem.titleView = statFilter;
//    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"MapView" owner:self options:nil];
//    MapView *mapView = [nibObjects objectAtIndex:0];
//    [self.mapView addSubview: mapView];
//    
//    [self.mapView setHidden:NO];
//    [self.listTableView setHidden:YES];
//    [self.listTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomListingTableViewCell class]) bundle:nil] forCellReuseIdentifier:kCustomListingTableViewCellReuseID];
//    
    
    
}
-(void)segmentControlAction:(UISegmentedControl *)sender
{
    for (int i=0; i<[sender.subviews count]; i++)
    {
        if ([[sender.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:36.0/255.0 green:167.0/255.0 blue:250.0/255.0 alpha:1.0];
            [[sender.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else
        {
            [[sender.subviews objectAtIndex:i] setTintColor:[UIColor blackColor]];
        }
    }
    if(sender.selectedSegmentIndex==0)
    {
        
        //[self.mapView setHidden:NO];
       // [self.listTableView setHidden:YES];
    }
    else
    {
       // [self.mapView setHidden:YES];
       // [self.listTableView setHidden:NO];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

#pragma mark - IBActions -

- (IBAction)bounceMenu:(id)sender
{
    static Menu menu = MenuLeft;
    
    [[SlideNavigationController sharedInstance] bounceMenu:menu withCompletion:nil];
    
    menu = (menu == MenuLeft) ? MenuRight : MenuLeft;
}

- (IBAction)slideOutAnimationSwitchChanged:(UISwitch *)sender
{
    ((LeftMenuViewController *)[SlideNavigationController sharedInstance].leftMenu).slideOutAnimationEnabled = sender.isOn;
}

- (IBAction)limitPanGestureSwitchChanged:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].panGestureSideOffset = (sender.isOn) ? 50 : 0;
}

- (IBAction)changeAnimationSelected:(id)sender
{
    [[SlideNavigationController sharedInstance] openMenu:MenuRight withCompletion:nil];
}

- (IBAction)shadowSwitchSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableShadow = sender.isOn;
}

- (IBAction)enablePanGestureSelected:(UISwitch *)sender
{
    [SlideNavigationController sharedInstance].enableSwipeGesture = sender.isOn;
}

- (IBAction)portraitSlideOffsetChanged:(UISegmentedControl *)sender
{
    [SlideNavigationController sharedInstance].portraitSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

- (IBAction)landscapeSlideOffsetChanged:(UISegmentedControl *)sender
{
    [SlideNavigationController sharedInstance].landscapeSlideOffset = [self pixelsFromIndex:sender.selectedSegmentIndex];
}

#pragma mark - Helpers -

- (NSInteger)indexFromPixels:(NSInteger)pixels
{
    if (pixels == 60)
        return 0;
    else if (pixels == 120)
        return 1;
    else
        return 2;
}

- (NSInteger)pixelsFromIndex:(NSInteger)index
{
    switch (index)
    {
        case 0:
            return 60;
            
        case 1:
            return 120;
            
        case 2:
            return 200;
            
        default:
            return 0;
    }
}

@end
