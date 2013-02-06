//
//  ThreadViewController.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 2/5/13.
//  Copyright (c) 2013 Teach For America. All rights reserved.
//

#import "ThreadViewController.h"
#import "ThreadCell.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController
@synthesize global, threadTable, thread, pic, author, date, post;
NSMutableArray *comments;
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
    [self.threadTable registerNib:[UINib nibWithNibName:@"ThreadView" bundle:nil] forCellReuseIdentifier:@"threadCell"];
   
    global = [[UIApplication sharedApplication] delegate];
    comments = [self.thread comments];
    self.post.text = thread.content;
    self.author.text = thread.author.name;
    self.date.text = thread.updated;
    self.pic.image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:thread.icon]]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *current = [comments objectAtIndex:indexPath.row];
    
    static NSString *cellIdentifier = @"threadCell";
    
    ThreadCell *cell = (ThreadCell *)[self.threadTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
   
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{        return [comments count];
}

- (void) viewWillDisappear:(BOOL)animated {
    [self.threadTable deselectRowAtIndexPath:[self.threadTable indexPathForSelectedRow] animated:animated];
    [super viewWillDisappear:animated];
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
