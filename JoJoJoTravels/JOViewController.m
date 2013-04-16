//
//  JOViewController.m
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOViewController.h"

@interface JOViewController ()

@end

@implementation JOViewController

- (void)viewDidLoad
{
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

@end
