//
//  DicussionViewController.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Discussion.h"
@interface DicussionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) IBOutlet UITableView *discTable;
@property(nonatomic, retain) NSDictionary *dataSource;
@property(nonatomic, retain) NSMutableArray *data;
@property (nonatomic) NSNumber *start, *totalResults, *step;
@property (nonatomic) bool set;
@end
