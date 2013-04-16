//
//  JOLastMinuteAPIClient.m
//  JoJoJoTravels
//
//  Created by Johan Nenzén on 4/16/13.
//  Copyright (c) 2013 Johan Nenzén. All rights reserved.
//

#import "JOLastMinuteAPIClient.h"

@implementation JOLastMinuteAPIClient
+ (JOLastMinuteAPIClient *)sharedClient {
    static JOLastMinuteAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://travel-offers-api.apphb.com"];
        _sharedClient = [[JOLastMinuteAPIClient alloc] initWithBaseURL:url];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    // By default, the example ships with SSL pinning enabled for the app.net API pinned against the public key of adn.cer file included with the example. In order to make it easier for developers who are new to AFNetworking, SSL pinning$
    if ([[url scheme] isEqualToString:@"https"] && [[url host] isEqualToString:@"alpha-api.app.net"]) {
        
    }
    
    return self;
}
@end
