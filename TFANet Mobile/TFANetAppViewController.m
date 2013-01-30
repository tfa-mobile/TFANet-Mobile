//
//  TFANetAppViewController.m
//  TFANet Mobile
//
//  Created by Henry Fougere on 12/6/12.
//  Copyright (c) 2012 Teach For America. All rights reserved.
//

#import "TFANetAppViewController.h"
#import "TFANetAppAppDelegate.h"
#import "LogInViewController.h"

@interface TFANetAppViewController ()

@end

@implementation TFANetAppViewController
TFANetAppAppDelegate *global;

@synthesize _username, _password, _serverResponse;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    global = [[UIApplication sharedApplication] delegate];
    if ([global prefsSaved]){
        //load fields from NSUserdata
        _username.text = [global loadUsername];
        _password.text = [global loadPassword];
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doLogin:(id)sender {
    _serverResponse.text = @"Hello!";
    [global loginTFANet:_username.text with:_password.text];
    [global checkAuthorizationWithCompletionBlock:^(NSDictionary *body) {
        if([body valueForKey:@"status"]){
            [global storePrefs: _username.text with:_password.text];
            LogInViewController *liv = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
            liv.status.text = [NSString stringWithFormat:@"Login: %@", [body valueForKey:@"status"]];
            [self.navigationController pushViewController:liv animated:YES];
            [global getAllGroupsWithCompletionBlock:^(NSDictionary *results) {
                //break
                NSLog(@"gotten data");
            }];
        }
        else{
            NSLog(@"Incorrect Login Information. Try again.");
        
        }
    }];
}

@end
