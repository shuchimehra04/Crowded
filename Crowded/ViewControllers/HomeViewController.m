//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"
#import "CustomListingTableViewCell.h"

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 503);
	
    viewBounds=self.listTableView.frame;
    viewBounds.size.width=self.view.bounds.size.width;

   
    [self setUpProfileView];
    viewBounds=self.listTableView.bounds;
 [self.listTableView registerNib:[UINib nibWithNibName:NSStringFromClass([CustomListingTableViewCell class]) bundle:nil] forCellReuseIdentifier:kCustomListingTableViewCellReuseID];
  // [self setUpProfileView];

}

-(void)viewWillAppear:(BOOL)animated
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:62.0/255.0 green:65.0/255.0 blue:68.0/255.0 alpha:1.0f]];
}


-(void)setUpProfileView
{
    //NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"ProfileView" owner:self options:nil];
   // ProfileView *profileNew = [nibObjects objectAtIndex:0];
    //[self.profileBundleView addSubview: profileNew];
}
# pragma mark -- Segment Control Methods

# pragma mark - UITable View Delegate and Datasource Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomListingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kCustomListingTableViewCellReuseID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.contentMode=UIViewContentModeRedraw;
   // cell.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

//    static NSString *cellIdentifier=@"Cell";
//    UITableViewCell *tableCell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    //tableCell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate didSelect];
}
@end
