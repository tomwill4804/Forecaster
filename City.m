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
//  build apiData request
//
-(void)validateZip:(NSString*) zipcode delegate:(id<CityDelegate>) delegate{
    
    self.apidata = [[APIData alloc] init];
    self.delegate = delegate;
    
    NSString* req = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?components=postal_code:%@&sensor=false", zipcode];
    
    apidata.userType = getZip;
    [self.apidata startRequest:req delegate:self];
    
}


//
//  update the weather information for this city
//
//  build apiData request and start the request
//
-(void)updateForecast:(id<CityDelegate>) delegate{
    
    
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
                    
                    self.name = dict[@"formatted_address"];
                    
                    NSDictionary *loc = dict[@"geometry"][@"location"];
                    self.latitude = loc[@"lat"];
                    self.longitude = loc[@"lng"];
                    self.coordinates = [NSString stringWithFormat:@"%@,%@", self.latitude, self.longitude];
                    
                }
            }
        }
        
        
        
        //
        //  process the forecast api call
        //
        else if(self.apidata.userType == getForecast) {
            
            
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
