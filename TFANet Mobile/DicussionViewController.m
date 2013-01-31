//
//  DicussionViewController.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 1/31/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "DicussionViewController.h"
#import "DiscussionCell.h"
@interface DicussionViewController ()

@end

@implementation DicussionViewController
NSMutableArray *discussionList;
@synthesize discTable, dataSource, data, start, step, totalResults, set;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    start = (NSNumber*)[self.dataSource objectForKey:@"startIndex"];
    step =  (NSNumber*)[self.dataSource objectForKey:@"itemsPerPage"];
    totalResults = (NSNumber*)[self.dataSource objectForKey:@"totalResults"];
    set = true;
    self.data = [self.dataSource objectForKey:@"entry"];
    discussionList = [[NSMutableArray alloc] initWithCapacity:data.count];
    [self.discTable registerNib:[UINib nibWithNibName:@"DiscussionView" bundle:nil] forCellReuseIdentifier:@"discussionCell"];
    for (NSDictionary *dic in data) {
    [discussionList addObject:[Discussion discussionWithDictionary:dic]];
    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Discussion *current = [discussionList objectAtIndex:indexPath.row];
    static NSString *discussionIdentifier = @"discussionCell";
    
    DiscussionCell *cell = (DiscussionCell *)[tableView dequeueReusableCellWithIdentifier:discussionIdentifier];
    
    cell.author.text = current.author.name;
    cell.threadCount.text = current.threadCount;
    cell.discussionSummary.text = current.summary;
    cell.discussionTitle.text = current.title;
    cell.icon.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:
                    [NSString stringWithFormat:@"http://dev.tfanet.org/profiles/photo.do?email=%@",current.author.email]]]];
    cell.updated.text = current.updated;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{        return [discussionList count];
}

@end
