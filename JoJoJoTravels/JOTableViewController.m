//
//  JOTableViewController.m
//  JoJoJoTravels
//
//  Created by Jonas Arvén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOTableViewController.h"
#import "OurTableCell.h"

@interface JOTableViewController ()

@end

@implementation JOTableViewController
{
    NSArray *destinations;
    NSArray *details;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    destinations = [NSArray arrayWithObjects:@"Stockholm/Arlanda", @"Mallorca", @"Malaga", nil];
    details = [NSArray arrayWithObjects:@"Sverige", @"Spanien", @"Spanien", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return section == 0 ? 3 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    OurTableCell *cell = nil;
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OurTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.destination.text = [destinations objectAtIndex:indexPath.row];
    cell.details.text = [details objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	// create the parent view that will hold header Label
	UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
	
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerLabel.backgroundColor = [UIColor clearColor];
	headerLabel.opaque = NO;
	headerLabel.textColor = [UIColor grayColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font = [UIFont boldSystemFontOfSize:12];
	headerLabel.frame = CGRectMake(60.0, 0.0, 300.0, 26.0); //Hårdkodad centrering = bad
	headerLabel.text = @"Senast uppdaterad 2012-04-21 13:37"; //Todo: läsa in datan på riktigt
	[customView addSubview:headerLabel];
    
    //Todo:Refreshknapp
    
    /* Vi tittade på olika screenshots, det under hör till en annan
    UILabel * headerLeftSubLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerLeftSubLabel.backgroundColor = [UIColor grayColor];
	headerLeftSubLabel.opaque = NO;
	headerLeftSubLabel.textColor = [UIColor whiteColor];
	headerLeftSubLabel.highlightedTextColor = [UIColor whiteColor];
	headerLeftSubLabel.font = [UIFont boldSystemFontOfSize:10];
	headerLeftSubLabel.frame = CGRectMake(10.0, 20.0, 145.0, 18.0); //Hårdkodad centrering = bad
	headerLeftSubLabel.text = @"Till: Spanien - Gran Canaria"; //Todo: läsa in datan på riktigt
	[customView addSubview:headerLeftSubLabel];
    
    UILabel * headerRightSubLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerRightSubLabel.backgroundColor = [UIColor grayColor];
	headerRightSubLabel.opaque = NO;
	headerRightSubLabel.textColor = [UIColor whiteColor];
	headerRightSubLabel.highlightedTextColor = [UIColor whiteColor];
	headerRightSubLabel.font = [UIFont boldSystemFontOfSize:10];
	headerRightSubLabel.frame = CGRectMake(165.0, 20.0, 145.0, 18.0); //Hårdkodad centrering = bad
	headerRightSubLabel.text = @"Från: Sverige - Stockholm"; //Todo: läsa in datan på riktigt
	[customView addSubview:headerRightSubLabel]; */
    
	return customView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 44.0;
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
