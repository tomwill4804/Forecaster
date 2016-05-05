//
//  City.h
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "APIData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CityDelegate <NSObject>

-(void)cityUpdated:(id)city;

@end


@interface City : NSManagedObject <APIDataDelegate>

@property (strong, nonatomic) APIData* apidata;
@property (strong, nonatomic) id<CityDelegate> delegate;
@property                     BOOL doSave;


-(void)validateZip:(NSString*) zipcode delegate:(id<CityDelegate>) delegate;
-(void)updateWeather:(id<CityDelegate>) delegate;

@end

NS_ASSUME_NONNULL_END

#import "City+CoreDataProperties.h"
