//
//  GroupTestViewController.h
//  GroupTest
//
//  Created by LEI SHI on 1/25/13.
//  Copyright (c) 2013 LEI SHI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupTestViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *groupTableView;
@property (nonatomic, strong) NSMutableArray *groupList;
@end