//
//  OurTableCell.m
//  JoJoJoTravels
//
//  Created by Jonas Arvén on 4/15/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "OurTableCell.h"

@implementation OurTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
