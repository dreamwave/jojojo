//
//  JOTableViewController.m
//  JoJoJoTravels
//
//  Created by Jonas Arvén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOTableViewController.h"
#import "JOViewController.h"
#import "OurTableCell.h"
#import "JOLastMinuteAPIClient.h"
#import "JOTravelItem.h"

@interface JOTableViewController ()
    @property (nonatomic, strong) NSArray *itemsArray;
    @property (nonatomic, strong) NSArray *destinationArray;
    @property (nonatomic, strong) NSArray *detailArray;
    @property (nonatomic, strong) NSArray *monthArray;
    @property (nonatomic, strong) NSArray *dayArray;
    @property (nonatomic, strong) NSArray *durationArray;
    @property (nonatomic, strong) NSArray *nrRemainingArray;
    @property (nonatomic, strong) NSArray *originArray;
    @property (nonatomic, strong) NSArray *deptTimeArray;
    @property (nonatomic, strong) NSArray *priceArray;
@end

@implementation JOTableViewController
{
    
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
    
    //Todo: Populate the arrays from the API
    
    self.destinationArray = [NSArray arrayWithObjects:@"Turkiet/Dalaman", @"Turkiet", @"Mallorca", nil];
    self.detailArray = [NSArray arrayWithObjects:@"Endast flyg", @"Ospecifierat boende", @"Endast flyg", nil];
    self.monthArray = [NSArray arrayWithObjects:@"Okt", @"Okt", @"Okt", nil];
    self.dayArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:12],[NSNumber numberWithInt:12],[NSNumber numberWithInt:13], nil];
    self.durationArray = [NSArray arrayWithObjects:@"1 vecka", @"1 vecka", @"1 vecka", nil];
    self.nrRemainingArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
    self.originArray = [NSArray arrayWithObjects:@"Köpenhamn",@"Köpenhamn",@"Göteborg", nil];
    self.deptTimeArray = [NSArray arrayWithObjects:@"17:00",@"17:00",@"06:30", nil];
    self.priceArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:3298],[NSNumber numberWithInt:3698],[NSNumber numberWithInt:2998], nil];
    
    JOViewController *searchView = [self.storyboard instantiateViewControllerWithIdentifier:@"JOViewController"];
    searchView.view.frame = CGRectMake(0, -330, self.navigationController.view.frame.size.width, 64);
    [self.navigationController.view insertSubview:searchView.view atIndex:2];
    
    [self doFillThetable];
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

- (void)doFillThetable
{
    [[JOLastMinuteAPIClient sharedClient] getPath:@"/offers/from/Stockholm/Arlanda/to/Bulgarien" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *tmpArr = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dict in responseObject) {
            JOTravelItem *item = [[JOTravelItem alloc]init];
            
            item.city = [dict valueForKey:@"city"];
            
            //NEED TO BE PARSED - "date": "2013-04-08T10:05:00.0000000+00:00"
            //item.date = [dict valueForKey:@"date"];
            
            item.days = [dict valueForKey:@"days"];
            item.departure = [dict valueForKey:@"departure"];
            item.destination = [dict valueForKey:@"destination"];
            item.hotelId = [dict valueForKey:@"hotellId"];
            item.price = [dict valueForKey:@"price"];
            item.remaining = [dict valueForKey:@"remaining"];
            item.roomDesc = [dict valueForKey:@"roomDesc"];
            
            item.deptTime = @"21";
            item.day = @"21";
            item.month = @"Oct";
            [tmpArr addObject:item];
        }
        self.itemsArray = tmpArr;
     
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure ALL!");
    }];
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
    return 3; //This need to be read in a smart way
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OurTableCell *cell = nil;
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"OurTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    if([self.nrRemainingArray objectAtIndex:indexPath.row] == [NSNumber numberWithInt:1])
    {
        cell.oneRemaining.hidden = false;
        cell.alert.hidden = false;
        cell.oneRemaining.transform = CGAffineTransformMakeRotation (3.14/4);
    }
    
    cell.destination.text = [self.destinationArray objectAtIndex:indexPath.row];
    cell.details.text = [self.detailArray objectAtIndex:indexPath.row];
    cell.month.text = [self.monthArray objectAtIndex:indexPath.row];
    cell.date.text = [NSString stringWithFormat:@"%@",[self.dayArray objectAtIndex:indexPath.row]];
    cell.duration.text = [self.durationArray objectAtIndex:indexPath.row];
    cell.origin.text = [self.originArray objectAtIndex:indexPath.row];
    cell.deptTime.text = [self.deptTimeArray objectAtIndex:indexPath.row];
    cell.price.text = [NSString stringWithFormat:@"%@:-",[self.priceArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
	return 28.0;
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
