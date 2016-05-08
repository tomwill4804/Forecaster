//
//  City+CoreDataProperties.h
//  Forecaster
//
//  Created by Nick Perkins on 5/6/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "City.h"

NS_ASSUME_NONNULL_BEGIN

@interface City (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *coordinates;
@property (nullable, nonatomic, retain) NSNumber *displayOrder;
@property (nullable, nonatomic, retain) NSString *summary;
@property (nullable, nonatomic, retain) NSString *icon;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *nearestStormDistance;
@property (nullable, nonatomic, retain) NSNumber *nearestStormBearing;
@property (nullable, nonatomic, retain) NSNumber *temperature;
@property (nullable, nonatomic, retain) NSDate *updatedAt;
@property (nullable, nonatomic, retain) NSString *zip;
@property (nullable, nonatomic, retain) NSNumber *precipIntensity;
@property (nullable, nonatomic, retain) NSNumber *precipProbability;
@property (nullable, nonatomic, retain) NSNumber *apparentTemperature;
@property (nullable, nonatomic, retain) NSNumber *dewPoint;
@property (nullable, nonatomic, retain) NSNumber *humidity;
@property (nullable, nonatomic, retain) NSNumber *windSpeed;
@property (nullable, nonatomic, retain) NSNumber *windBearing;
@property (nullable, nonatomic, retain) NSNumber *visibility;
@property (nullable, nonatomic, retain) NSNumber *cloudCover;
@property (nullable, nonatomic, retain) NSNumber *pressure;
@property (nullable, nonatomic, retain) NSNumber *ozone;

@end

NS_ASSUME_NONNULL_END
