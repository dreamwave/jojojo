//
//  OurTableCell.h
//  JoJoJoTravels
//
//  Created by Jonas Arvén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OurTableCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *destination;
@property (nonatomic, strong) IBOutlet UILabel *details;
@property (nonatomic, strong) IBOutlet UILabel *month;
@property (nonatomic, strong) IBOutlet UILabel *date;
@property (nonatomic, strong) IBOutlet UILabel *duration;
@property (nonatomic, strong) IBOutlet UILabel *origin;
@property (nonatomic, strong) IBOutlet UILabel *deptTime;
@property (nonatomic, strong) IBOutlet UILabel *oneRemaining;
@property (nonatomic, strong) IBOutlet UIImageView *alert;
@property (nonatomic, strong) IBOutlet UILabel *price;

@end
