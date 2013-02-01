//
//  DiscussionCell.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscussionCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *threadCount;
@property (nonatomic, strong) IBOutlet UITextView *discussionSummary;
@property (nonatomic, strong) IBOutlet UILabel *discussionTitle;
@property (nonatomic, strong) IBOutlet UIImageView *icon;
@property (nonatomic, strong) IBOutlet UILabel *author;
@property (nonatomic, strong) IBOutlet UILabel *updated;

@end
