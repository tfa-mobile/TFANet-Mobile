//
//  GroupTestViewController.h
//  GroupTest
//
//  Created by LEI SHI on 1/25/13.
//  Copyright (c) 2013 LEI SHI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyGroupsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UITableView *groupTableView;
@property (nonatomic, strong) NSMutableArray *groupList;
@property (nonatomic) NSNumber *start, *totalResults, *step;

@end
