//
//  SkillsViewController.m
//  Crowded
//
//  Created by Er Sanjay Morya on 15/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "SkillsViewController.h"
@interface SkillsViewController ()

@property(nonatomic, strong) NSMutableArray *skillsArray;

@end

@implementation SkillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.skillsArray = [[NSMutableArray alloc] initWithObjects:@"COOKING",@"DOG SITTING",@"DRIVING",@"C++",@"SERVING",@"VOLUNTEERING", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.skillsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellIdentifier = @"Cell";
   SkillTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
       NSArray * cellPaths = [[NSBundle mainBundle] loadNibNamed:@"SkillTableCell" owner:self options:nil];
        cell = [cellPaths objectAtIndex:0];
    }
    cell.delegate = self;
    cell.cellIndex = indexPath.row;
    
    [cell.skillLabel setText:[self.skillsArray objectAtIndex:indexPath.row]];
    return cell;
    
}

#pragma mark - Skill table view cell delegate
-(void)customCell:(SkillTableCell *)skillVc okbuttonPressedofIndex:(NSInteger)indexValue
{
    NSLog(@"Hello =%ld",indexValue);
}
-(void)customCell:(SkillTableCell *)skillVc cancelButtonPressedofIndex:(NSInteger)indexValue
{
     NSLog(@"Hello =%ld",indexValue);
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
