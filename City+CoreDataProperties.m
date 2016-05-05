//
//  City+CoreDataProperties.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City+CoreDataProperties.h"

@implementation City (CoreDataProperties)

@dynamic name;
@dynamic temperature;
@dynamic zip;
@dynamic updatedAt;
@dynamic forecast;
@dynamic forecastLike;
@dynamic latitude;
@dynamic longitude;
@dynamic shortName;
@dynamic city;
@dynamic state;

@end
