//
//  City.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "City.h"


@implementation City

//@dynamic apidata;
//@dynamic delegate;


-(void)validateZip:(NSString*) zipcode delegate:(id<CityDelegate>) delegate{
    
    self.apidata = [[APIData alloc] init];
    self.delegate = delegate;
    
    NSString* req = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:%@&sensor=false", zipcode];
    [self.apidata startRequest:req delegate:self];
    
}


-(void)updateWeather:(id<CityDelegate>) delegate{
    
    
}

-(void)gotAPIData:(APIData*)apidata{
    
    NSString* x = apidata.errorText;
    
    [self.delegate cityUpdated:self];
    
}

@end
