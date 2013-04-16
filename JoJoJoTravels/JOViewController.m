//
//  JOViewController.m
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOViewController.h"

#import "JOLastMinuteAPIClient.h"
@property (nonatomic, strong) NSArray *departureAirports;
@interface JOViewController ()
    @property (nonatomic, strong) NSArray *destinationArray;
    @property (nonatomic, strong) NSArray *originArray;
@end

@implementation JOViewController

NSInteger pickerRow;

- (void)viewDidLoad
{
    [[JOLastMinuteAPIClient sharedClient] getPath:@"/destinations" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.destinationArray = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	NSMutableArray *airports = [NSMutableArray array];
	
	[airports addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Arlanda", @"name", @"ARN", @"code",nil]];
	[airports addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"Örebro", @"name", @"ÖRE", @"code",nil]];
	
        NSLog(@"Failure!");
    }];
    
    [[JOLastMinuteAPIClient sharedClient] getPath:@"/airports" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *tmpArray = [[NSMutableArray alloc]init];
        
        for (NSDictionary *dict in responseObject) {
            NSLog(@"%@ -> %@", [dict valueForKey:@"code"], [dict valueForKey:@"name"]);
            [tmpArray addObject:[dict valueForKey:@"name"]];
        }
        
        self.originArray = tmpArray;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure!");
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *background = [UIImage imageNamed: @"towel.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage: background];
	
    [self.view insertSubview: imageView atIndex:0];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	//Ska vara typ arrayens storlek
	return 6;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	//Skriv ut det värdet som finns för specifik nyckel
	return [NSString stringWithFormat:@"row: %d", row];
}

- (IBAction)PressedResmal:(id)sender
{
	self.currentButton = (UIButton *) sender;
	self.pickerView.hidden = false;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	//pickerRow = row;
	NSArray *repeatPickerData = self.picker.dataSource;
	UIPickerView *repeatPickerView = self.picker;
	
	row = [repeatPickerView selectedRowInComponent:0];
	NSString *data = [repeatPickerData objectAtIndex:row];
	//self.pickerView.hidden = true;
}

- (IBAction)didPressOkButtomn:(id)sender
{
	/*int row = [self.picker selectedRowInComponent:0];
	
	
	row = [self.picker selectedRowInComponent:0];
	NSString *data = [repeatPickerData objectAtIndex:row];
	[self.currentButton setTitle:[NSString stringWithFormat:@"Row: %@", [self.pickerViewArray objectAtIndex:selectedIndex]] forState:UIControlStateNormal];
*/
}

/*
-(void)getSelection
{
	NSLocale *usLocale = [[[NSLocale alloc]
						   initWithLocaleIdentifier:@"en_US"] autorelease];
	
	NSDate *pickerDate = [datePicker date];
	NSString *selectionString = [[NSString alloc]
								 initWithFormat:@"%@",
								 [pickerDate descriptionWithLocale:usLocale]];
	dateLabel.text = selectionString;
	[selectionString release];
}*/


@end
