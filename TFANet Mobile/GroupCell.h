//
//  GroupCell.h
//  GroupTest
//
//  Created by LEI SHI on 1/25/13.
//  Copyright (c) 2013 LEI SHI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *membercount;
@property (nonatomic, strong) IBOutlet UITextView *groupSummary;
@property (nonatomic, strong) IBOutlet UILabel *groupTitle;
@property (nonatomic, strong) IBOutlet UIImageView *icon;
@property (nonatomic, strong) IBOutlet UILabel *groupID;
@property (nonatomic, strong) IBOutlet UILabel *updated;

@end
