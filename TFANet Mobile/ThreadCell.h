//
//  ThreadCell.h
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *threadCount;
@property (nonatomic, strong) IBOutlet UITextView *threadSummary;
@property (nonatomic, strong) IBOutlet UILabel *threadTitle;
@property (nonatomic, strong) IBOutlet UIImageView *icon;
@property (nonatomic, strong) IBOutlet UILabel *author;
@property (nonatomic, strong) IBOutlet UILabel *updated;

@end
