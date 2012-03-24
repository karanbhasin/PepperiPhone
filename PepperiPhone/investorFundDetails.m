//
//  investorFundDetails.m
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "investorFundDetails.h"
#import "pepperAppDelegate.h"
#import "Util.h"

@implementation investorFundDetails

@synthesize fundsForinvestor = _fundsForinvestor;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"FundsToInvestors: %@", self.fundsForinvestor);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fundsForinvestor count];
}

- (UITableViewCell *) getCellContentView:(NSString *)cellIdentifier {
    
    CGRect CellFrame = CGRectMake(0, 0, 300, 60);
    CGRect Label1Frame = CGRectMake(10, 10, 290, 25);
    CGRect Label2Frame = CGRectMake(10, 33, 290, 25);
    CGRect Label3Frame = CGRectMake(10, 56, 290, 25);
    CGRect Label4Frame = CGRectMake(10, 79, 290, 25);
    UILabel *lblTemp;
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CellFrame reuseIdentifier:cellIdentifier];
    
    //Initialize Label with tag 1.
    lblTemp = [[UILabel alloc] initWithFrame:Label1Frame];
    lblTemp.tag = 1;
    [cell.contentView addSubview:lblTemp];
    
    //Initialize Label with tag 2.
    lblTemp = [[UILabel alloc] initWithFrame:Label2Frame];
    lblTemp.tag = 2;
    lblTemp.font = [UIFont boldSystemFontOfSize:12];
    lblTemp.textColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lblTemp];
    
    lblTemp = [[UILabel alloc] initWithFrame:Label3Frame];
    lblTemp.tag = 3;
    lblTemp.font = [UIFont boldSystemFontOfSize:12];
    lblTemp.textColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lblTemp];
    
    lblTemp = [[UILabel alloc] initWithFrame:Label4Frame];
    lblTemp.tag = 4;
    lblTemp.font = [UIFont boldSystemFontOfSize:12];
    lblTemp.textColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lblTemp];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //if (cell == nil) {
    //    cell = [self getCellContentView:CellIdentifier];;
    //}
    cell = [self getCellContentView:CellIdentifier];
    
    
    // Configure the cell...
    //{"CommitmentAmount":20000000.0000,"UnfundedAmount":8746454.9064,"FundClose":"Fund Close 1","CommittedDate":"\/Date(1086130800000)\/","CloseDate":"\/Date(1086130800000)\/",
    //"InvestorID":17,"FundID":0,"InvestorName":"American Legacy Foundation"}
    
    // Get the cell label using it's tag and set it
    NSDictionary* dict = (NSDictionary*)[self.fundsForinvestor objectAtIndex:indexPath.row];
    NSLog(@"Dict %@", dict);
    
    UILabel *lblTemp1 = (UILabel *)[cell viewWithTag:1];
    UILabel *lblTemp2 = (UILabel *)[cell viewWithTag:2];
    UILabel *lblTemp3 = (UILabel *)[cell viewWithTag:3];
    UILabel *lblTemp4 = (UILabel *)[cell viewWithTag:4];
    
    lblTemp1.text = [Util formattedString:[dict objectForKey:@"FundName"]];
    lblTemp2.text = [NSString stringWithFormat:@"committed $%@ on %@", [Util formattedString:[dict objectForKey:@"CommitmentAmount"]], [Util toFormattedDateString:[Util mfDateFromDotNetJSONString:(NSString*)[dict objectForKey:@"CommittedDate"] ]] ];
    lblTemp3.text = [NSString stringWithFormat:@"unfunded $%@", [Util formattedString:[dict objectForKey:@"UnfundedAmount"]] ];
    lblTemp4.text = [NSString stringWithFormat:@"closed on %@", [Util toFormattedDateString:[Util mfDateFromDotNetJSONString:(NSString*)[dict objectForKey:@"CloseDate"] ]] ];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
