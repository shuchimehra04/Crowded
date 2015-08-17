//
//  EditSkillsViewController.h
//  Crowded
//
//  Created by shuchi mehra on 8/15/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditSkillsViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end
