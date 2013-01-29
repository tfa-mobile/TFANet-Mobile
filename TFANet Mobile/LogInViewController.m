//
//  LogInViewController.m
//  TFANet Mobile
//
//  Created by Vanessa Anderson on 12/18/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import "LogInViewController.h"
NSArray *menuItems;
@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize menu;

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
    menuItems = [[NSArray alloc] initWithObjects:@"Groups", @"My Groups", @"Blogs", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuItem"];
    
   cell.textLabel.text = [menuItems objectAtIndex:indexPath.row];

 return cell;



}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self openGroups:self];
            [self performSegueWithIdentifier:@"showGroups" sender:self];
            break;
        case 1:
            [self openMyGroups:self];
            break;
        case 2:
            [self openBlogs:self];
            break;
        default:
            break;
    }


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(void)openGroups:(id)sender{
    NSLog(@"opening groups");
}

-(void)openMyGroups:(id)sender{
    NSLog(@"opening my groups");
}

-(void)openBlogs:(id)sender{
    NSLog(@"opening blogs");
}

@end
