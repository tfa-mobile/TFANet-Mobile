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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)openGroups:(id)sender{
   [self performSegueWithIdentifier:@"showGroups" sender:self];
    NSLog(@"opening groups");
}

-(IBAction)openMyGroups:(id)sender{
    NSLog(@"opening my groups");
}

-(IBAction)openBlogs:(id)sender{
    NSLog(@"opening blogs");
}
-(IBAction)openComingSoon:(id)sender;{

}

@end
