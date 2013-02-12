//
//  ThreadViewController.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 2/5/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFANetAppAppDelegate.h"
#import "Thread.h"

@interface ThreadViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property(nonatomic, retain) IBOutlet UITableView *threadTable;
@property(nonatomic, retain) IBOutlet UITextView *post;
@property(nonatomic, retain) IBOutlet UILabel *author, *date;
@property(nonatomic, retain) IBOutlet UIImageView *pic;
@property(nonatomic, retain) Thread *thread;
@property (nonatomic, retain) TFANetAppAppDelegate *global;
@end
