//
//  JOViewController.m
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOViewController.h"

#import "JOLastMinuteAPIClient.h"

@interface JOViewController ()
    @property (nonatomic, strong) NSArray *destinationArray;
    @property (nonatomic, strong) NSArray *originArray;
@end

@implementation JOViewController

- (void)viewDidLoad
{
    [[JOLastMinuteAPIClient sharedClient] getPath:@"/destinations" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.destinationArray = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
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
	return 5;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [NSString stringWithFormat:@"row: %d", row];
}

- (IBAction)PressedResmal:(id)sender
{
	self.currentButton = (UIButton *) sender;
	self.picker.hidden = false;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	
	self.currentButton.titleLabel.text = [NSString stringWithFormat:@"Row: %d", row];
	self.picker.hidden = true;
}


@end
