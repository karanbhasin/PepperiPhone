//
//  investorDetailsViewController.m
//  tabBarTableView
//
//  Created by Singh, Jaskaran on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "investorDetailsViewController.h"
#import "pepperAppDelegate.h"
#import "Util.h"

@implementation investorDetailsViewController

@synthesize selectedFundID = _selectedFundID;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Get the list of the Funds from the api
    pepperAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSData* responseData = [appDelegate.api GetInvestorsInFund:self.selectedFundID];
    
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                     JSONObjectWithData:responseData //1
                     options:kNilOptions 
                     error:&error];
    // The response from the server would be like this:
    // [{"id":2,"label":"AMBERBROOK II LLC","value":"AMBERBROOK II LLC"},{"id":3,"label":"AMBERBROOK III LLC","value":"AMBERBROOK III LLC"},{"id":4,"label":"AMBERBROOK IV LLC","value":"AMBERBROOK IV LLC"},{"id":1,"label":"AMBERBROOK LLC","value":"AMBERBROOK LLC"},{"id":5,"label":"AMBERBROOK V LLC","value":"AMBERBROOK V LLC"}]
    //{"page":1,"total":4,"rows":[{"cell":["American Legacy Foundation",1000000.0000,1000000.0000,"\/Date(1314831600000)\/"]},{"cell":["Blair Academy",2000000.0000,2000000.0000,"\/Date(1314831600000)\/"]},{"cell":["James Tannoy",3000000.0000,3000000.0000,"\/Date(1314831600000)\/"]},{"cell":["Willowridge V LLC",5645645564654.0000,5645645564654.0000,"\/Date(1314831600000)\/"]}]}
    // The above response is an array of dictionaries
    NSLog(@"JSon recieved: %@", json);
    // Create an array to hold all the funds
    //NSMutableArray* funds = [NSMutableArray arrayWithCapacity:[json count]];
    myData = [json objectForKey:@"rows"];
    NSLog(@"array received %@", myData);
/*
    for (int i = 0; i < [json count]; i++)
    {
        // Each entry in the array is a dictionary
        NSDictionary *dict = [json objectAtIndex:i];
        //for(NSString *key in dict) {
        //[funds addObject:[dict objectForKey:@"value"]];
        [myData addObject:dict];        //}
    }
    
    
    
    NSArray* bankArray = [json objectForKey:@"BankDetail"];
    // Currently there is only 1 bank allowed per fund from the UI. However, the DB design allows for multiple banks
    if([bankArray count] > 0){
        NSDictionary *bank = (NSDictionary*)[bankArray objectAtIndex:0];
        // clean up the unwanted elements
        NSMutableDictionary* bankDict = [Util getFilteredDictionary:bank withPropertyNames:bankProperties withOverrideKeys:mapping withDateKeys:nil];
        NSLog(@"Filtered fund dictionary %@", bankDict);
        return bankDict;
    }
    */
    
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
    return [myData count];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell = [self getCellContentView:CellIdentifier];
    
    
    // Configure the cell...
    
    // Get the cell label using it's tag and set it
    NSDictionary* dict = (NSDictionary*)[myData objectAtIndex:indexPath.row];
    NSLog(@"Dict %@", dict);
    // The returned dictionary will be of the format
    /*
    {
        cell =     (
                    "Jerrold M. Newman",
                    125000,
                    "6139.5357",
                    "/Date(1328950536000)/"
                    );
    }
     */
    // The value in the dictionary for the key "cell" is an array. we want the first item in the array as the investor name
    //cell.textLabel.text = [[dict objectForKey:@"cell"] objectAtIndex:0];
    
    /////
        
        UILabel *lblTemp1 = (UILabel *)[cell viewWithTag:1];
        UILabel *lblTemp2 = (UILabel *)[cell viewWithTag:2];
        UILabel *lblTemp3 = (UILabel *)[cell viewWithTag:3];
        UILabel *lblTemp4 = (UILabel *)[cell viewWithTag:4];
        
        lblTemp1.text = [[dict objectForKey:@"cell"] objectAtIndex:0];
        NSString* closeDate = [Util toFormattedDateString:[Util mfDateFromDotNetJSONString:(NSString*)[[dict objectForKey:@"cell"] objectAtIndex:3]]];
        
        lblTemp2.text = [NSString stringWithFormat:@"closed on %@", closeDate];
        lblTemp3.text = [NSString stringWithFormat:@"total commitment $%@", [Util formattedString:[[dict objectForKey:@"cell"] objectAtIndex:1]]];
        lblTemp4.text = [NSString stringWithFormat:@"unfunded amount $%@", [Util formattedString:[[dict objectForKey:@"cell"] objectAtIndex:2]]];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
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
