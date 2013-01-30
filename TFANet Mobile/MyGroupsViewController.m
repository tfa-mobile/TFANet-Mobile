//
//  GroupTestViewController.m
//  GroupTest
//
//  Created by LEI SHI on 1/25/13.
//  Copyright (c) 2013 LEI SHI. All rights reserved.
//

#import "MyGroupsViewController.h"
#import "GroupDetailViewController.h"
#import "GroupCell.h"
#import "TFANetAppAppDelegate.h"
#import "Group.h"
@interface MyGroupsViewController ()

@end

@implementation MyGroupsViewController
{
    NSMutableArray *groups;
    NSArray *searchResults;
    TFANetAppAppDelegate *global;
    
}

@synthesize groupTableView, groupList, start, step;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	global = [[UIApplication sharedApplication]delegate];
    self.groupList = [[NSMutableArray alloc] init];
    NSString *myIdentifier = @"GroupCell";
    [self.groupTableView registerNib:[UINib nibWithNibName:@"GroupCellView" bundle:nil] forCellReuseIdentifier:myIdentifier];
    UIBarButtonItem *allGroups = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Search Groups"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(groupView)];
    self.navigationItem.rightBarButtonItem = allGroups;
    self.navigationItem.title = @"My Groups";
    [self populateTable];
       
}

-(void)groupView{
    [self performSegueWithIdentifier:@"showAllGroups" sender:self];
}
-(void) populateTable{

    [global getMyGroupsWithCompletionBlock:^(NSDictionary *results) {
        [self parseJSON:results];
          }];

}
-(void) addToDataSource{

    [global getMoreGroupsWithCompletionBlock:^(NSDictionary *results) {
       [self parseJSON:results];
    } for:start andSize:step];



}
-(void)parseJSON:(NSDictionary*)results{
 
    NSLog(@"result keys: %@", results.allKeys);
    NSDictionary* feed = [results objectForKey:@"feed"];
    NSLog(@"keys in entry: %@", feed.allKeys);
    start = (NSString*)[feed objectForKey:@"startIndex"];
    step =  (NSString*)[feed objectForKey:@"itemsPerPage"];
    NSArray* feedArray = [feed objectForKey:@"entry"];
   
    for (NSDictionary *dic in feedArray) {
        [self.groupList addObject:[Group groupWithDictionary:dic]];
    }
    [groupTableView reloadData];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{        return [self.groupList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *groupIdentifier = @"GroupCell";
    
    GroupCell *cell = (GroupCell *)[tableView dequeueReusableCellWithIdentifier:groupIdentifier];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
         [self performSegueWithIdentifier: @"showRecipeDetail" sender: self];
    } else {
        Group *current = [groupList objectAtIndex:indexPath.row];
        cell.groupTitle.text = [current handle];
        cell.groupSummary.text = [current summary];
        cell.icon.image = [[UIImage alloc] initWithData:
                           [NSData dataWithContentsOfURL:
                            [NSURL URLWithString: current.icon]]];
        cell.membercount.text = [NSString stringWithFormat:@"(%@) Members",[current membercount]];
        cell.updated.text = [NSString stringWithFormat:@"Updated: %@",[current updated]];
    }
    if(indexPath.row == [groupList count]-1){
        //need to reload data
      //  [self addToDataSource];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showGroupDetail" sender:self];
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
