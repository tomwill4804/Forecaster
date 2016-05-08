//
//  City.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "City.h"


@implementation City

@synthesize apidata;
@synthesize delegate;
@synthesize doSave;

static int getZip = 1;
static int getForecast = 2;


//
//  validate a zip code
//
//  build APIData request
//
-(void)validateZip:(NSString*) zipcode delegate:(id<CityDelegate>) delegatex{
    
    self.apidata = [[APIData alloc] init];
    self.delegate = delegatex;
    
    NSString* req = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?components=postal_code:%@&sensor=false", zipcode];
    
    apidata.userType = getZip;
    [self.apidata startRequest:req delegate:self];
    
}


//
//  update the weather information for this city
//
//  build APIData request and start the request
//
-(void)updateForecast:(id<CityDelegate>) delegatex{
    
    self.apidata = [[APIData alloc] init];
    self.delegate = delegatex;
    
    NSString* req = [NSString stringWithFormat:@"https://api.forecast.io/forecast/b706a847fb62309a43d0c68ac494e4b4/%@", self.coordinates];
    
    apidata.userType = getForecast;
    [self.apidata startRequest:req delegate:self];

}

//
//  we are back from the apiData request
//
//  see if we got good zipcode info or good forecast info
//
-(void)gotAPIData:(APIData*)apidata{
    
    if(!self.apidata.errorText) {
        
        //
        //  process the zip code api call
        //
        if(self.apidata.userType == getZip) {
            
            NSString* status = self.apidata.dictionary[@"status"];
            if (![status isEqualToString:@"OK"]) {
                self.apidata.errorText = status;
            }
            
            else {
                NSDictionary *dict = self.apidata.dictionary[@"results"][0];
                
                if(dict) {
                    
                    //
                    //  extract fields we want from the dictionary
                    //
                    self.name = dict[@"formatted_address"];
                    NSString *match = [NSString stringWithFormat:@", "];
                    NSScanner *scanner = [NSScanner scannerWithString:self.name];
                    NSString *cityName;
                    [scanner scanUpToString:match intoString:&cityName];
                    self.city = cityName;
                    
                    NSDictionary *loc = dict[@"geometry"][@"location"];
                    self.latitude = loc[@"lat"];
                    self.longitude = loc[@"lng"];
                    self.coordinates = [NSString stringWithFormat:@"%@,%@", self.latitude, self.longitude];
                    self.updatedAt = [NSDate date];
                    
                }
            }
        }
        
        
        
        //
        //  process the forecast api call
        //
        else if(self.apidata.userType == getForecast) {
            
            NSString* status = self.apidata.dictionary[@"error"];
            if (status) {
                self.apidata.errorText = status;
            }
            
            else {
                NSDictionary *dict = self.apidata.dictionary[@"currently"];
                
                if(dict) {
                    
                    //
                    //  extract the fields we want from the data dictionary
                    //  and update our attributes (fields names must match)
                    //
                    
                    self.updatedAt = [NSDate date];
                    
                    NSArray* fields = @[@"summary",  @"icon", @"nearestStormDistance", @"nearestStormBearing", @"precipIntensity", @"precipProbability",
                        @"temperature", @"apparentTemperature", @"dewPoint", @"humidity",
                        @"windSpeed", @"windBearing", @"visibility", @"cloudCover",
                        @"pressure", @"ozone"];
                    
                    for (NSString* key in fields) {
                         [self setValue:dict[key] forKey:key];
                        
                    }
                }
            }
        }
        
        
        
        //
        //  see if we need to save the object
        //
        if(self.doSave && !self.apidata.errorText)
            [self save];
        
    }
    
    //
    //  let caller know we are done
    //
    [self.delegate cityUpdated:self];
    
}


//
//  save this object
//
-(void)save{
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}

@end
