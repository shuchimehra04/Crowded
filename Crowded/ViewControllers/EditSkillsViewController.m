//
//  EditSkillsViewController.m
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "EditSkillsViewController.h"
#import "EditSkillCollectionViewCell.h"
#import "AutoCompletionTableViewController.h"
#import "WYPopoverController.h"


@interface EditSkillsViewController ()<WYPopoverControllerDelegate,AutoCompletionTableViewControllerDelegate>
{
    WYPopoverController *poppOverController;
    
}

@end

@implementation EditSkillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *txfSearchField = [_searchBar valueForKey:@"_searchField"];
    txfSearchField.backgroundColor = [UIColor colorWithRed:152.0/255.0 green:235.0/255.0 blue:249.0/255.0 alpha:1.0f];
    txfSearchField.textColor=[UIColor colorWithRed:3.0/255.0 green:-0.0/255.0 blue:102.0/255.0 alpha:1.0f];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setLeftViewMode:UITextFieldViewModeNever];
    [txfSearchField setTintColor:[UIColor colorWithRed:3.0/255.0 green:-0.0/255.0 blue:102.0/255.0 alpha:1.0f]];

    [self.searchBar setDelegate:self];
    
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([EditSkillCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:kEditSkillCollectionViewCellReuseID];
    [self.collectionView setAllowsMultipleSelection:YES];
       // Do any additional setup after loading the view.
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    return YES;
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    AutoCompletionTableViewController *autoComp=[[AutoCompletionTableViewController alloc] initWithNibName:@"AutoCompletionTableViewController" bundle:nil];
    
    [autoComp setDelegate:self];
    [autoComp.view setFrame:self.searchBar.frame];
    
    
    poppOverController = [[WYPopoverController alloc] initWithContentViewController:autoComp];
    poppOverController.delegate = self;
  
    poppOverController.popoverLayoutMargins = UIEdgeInsetsMake(168, 0, 0, 0);
    //poppOverController.wantsDefaultContentAppearance = NO;

    
    [poppOverController presentPopoverFromRect:self.searchBar.bounds
                                               inView:self.searchBar
                             permittedArrowDirections:WYPopoverArrowDirectionNone
                                             animated:YES
                                              options:WYPopoverAnimationOptionFadeWithScale];

    
    return YES;
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EditSkillCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kEditSkillCollectionViewCellReuseID forIndexPath:indexPath];
    return cell;
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EditSkillCollectionViewCell *cell=(EditSkillCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.cross_button setImage:[UIImage imageNamed:@"select_skill_tick"] forState:UIControlStateNormal];
    cell.backgroundColor=[UIColor colorWithRed:255.0/255.0 green:17.0/255.0 blue:1.0/255.0 alpha:1.0f];
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    EditSkillCollectionViewCell *cell=(EditSkillCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.cross_button setImage:[UIImage imageNamed:@"select_skill_cross"] forState:UIControlStateNormal];
    cell.backgroundColor=[UIColor colorWithRed:55.0/255.0 green:179.0/255.0 blue:52.0/255.0 alpha:1.0f];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
     [poppOverController dismissPopoverAnimated:YES];
    // Do the search...
}
# pragma mark -- AutoCompletion Delegate Method
-(void)didSelectTableViewString:(NSString *)string
{
    self.searchBar.text=string;
    [self.searchBar resignFirstResponder];
    [poppOverController dismissPopoverAnimated:YES];
    
}

@end
