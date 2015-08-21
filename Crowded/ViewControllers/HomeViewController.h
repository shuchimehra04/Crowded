//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
//#import "ProfileView.h"
#import "MapView.h"
@protocol HomeViewControllerDelegate;

@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    CGRect viewBounds;
    
}
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (weak, nonatomic)   IBOutlet UIView *bannerView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
//@property(nonatomic,strong)IBOutlet ProfileView *profileBundleView;
@property (nonatomic,strong) IBOutlet MapView *mapView;
@property (nonatomic,strong) id <HomeViewControllerDelegate>delegate;
@end
@protocol HomeViewControllerDelegate <NSObject>
-(void)didSelect;

@end