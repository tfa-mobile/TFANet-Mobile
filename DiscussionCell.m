//
//  DiscussionCell.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "DiscussionCell.h"

@implementation DiscussionCell
@synthesize discussionSummary, discussionTitle, author, threadCount, icon, updated;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
