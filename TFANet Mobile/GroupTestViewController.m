//
//  GroupTestViewController.m
//  GroupTest
//
//  Created by LEI SHI on 1/25/13.
//  Copyright (c) 2013 LEI SHI. All rights reserved.
//

#import "GroupTestViewController.h"
#import "GroupDetailViewController.h"
#import "GroupCell.h"
#import "TFANetAppAppDelegate.h"
#import "Group.h"
@interface GroupTestViewController ()

@end

@implementation GroupTestViewController
{
    NSMutableArray *groups;
    NSArray *searchResults;
    TFANetAppAppDelegate *global;
    
}

@synthesize groupTableView, groupList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	global = [[UIApplication sharedApplication]delegate];
    self.groupList = [[NSMutableArray alloc] init];
    NSString *myIdentifier = @"GroupCell";
    [self.groupTableView registerNib:[UINib nibWithNibName:@"GroupCellView" bundle:nil] forCellReuseIdentifier:myIdentifier];

    [self parseJSON];
       
}

-(void) parseJSON{

    [global getAllGroupsWithCompletionBlock:^(NSDictionary *results) {
        NSLog(@"result keys: %@", results.allKeys);
        NSDictionary* feed = [results objectForKey:@"feed"];
        NSLog(@"keys in entry: %@", feed.allKeys);
        NSArray* feedArray = [feed objectForKey:@"entry"];
        for (NSDictionary *dic in feedArray) {
            [self.groupList addObject:[Group groupWithDictionary:dic]];
        }
        [groupTableView reloadData];
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [self.groupList count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *groupIdentifier = @"GroupCell";
    
    GroupCell *cell = (GroupCell *)[tableView dequeueReusableCellWithIdentifier:groupIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GroupCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
         [self performSegueWithIdentifier: @"showRecipeDetail" sender: self];
    } else {
        Group *current = [groupList objectAtIndex:indexPath.row];
        cell.groupTitle.text = [current handle];
        cell.groupSummary.text = [current summary];
        cell.icon.image = [[UIImage alloc] initWithData:
                           [NSData dataWithContentsOfURL:
                            [NSURL URLWithString: current.icon]]];
        cell.membercount.text = [current membercount];
        cell.updated.text = [current updated];
    }
    if(indexPath.row == [groupList count]){
        //need to reload data
    
    }
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGroupDetail"]) {
        GroupDetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.groupName = [searchResults objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [self.groupTableView indexPathForSelectedRow];
            destViewController.groupName = [groups objectAtIndex:indexPath.row];
        }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [groups filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
