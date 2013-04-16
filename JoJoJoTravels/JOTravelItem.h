//
//  JOTravelItem.h
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/16/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JOTravelItem : NSObject

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *deptTime;

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSNumber *days;
@property (nonatomic, strong) NSString *departure;
@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSString *hotelId;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *remaining;
@property (nonatomic, strong) NSString *roomDesc;

@end
