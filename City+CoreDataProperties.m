//
//  City+CoreDataProperties.m
//  Forecaster
//
//  Created by Nick Perkins on 5/6/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

@dynamic city;
@dynamic coordinates;
@dynamic displayOrder;
@dynamic summary;
@dynamic icon;
@dynamic latitude;
@dynamic longitude;
@dynamic name;
@dynamic nearestStormDistance;
@dynamic nearestStormBearing;
@dynamic temperature;
@dynamic updatedAt;
@dynamic zip;
@dynamic precipIntensity;
@dynamic precipProbability;
@dynamic apparentTemperature;
@dynamic dewPoint;
@dynamic humidity;
@dynamic windSpeed;
@dynamic windBearing;
@dynamic visibility;
@dynamic cloudCover;
@dynamic pressure;
@dynamic ozone;

@end
