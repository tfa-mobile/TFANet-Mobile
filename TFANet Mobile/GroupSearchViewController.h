//
//  GroupSearcgViewController.h
//  GroupTest
//
//  Created by V Anderson on 1/30/13.
//  Copyright (c) 2013 V Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UITableView *groupTableView;
@property (nonatomic, strong) NSMutableArray *groupList;
@property (nonatomic) NSNumber *start, *totalResults, *step;
@end
