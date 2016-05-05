//
//  CityViewController.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()
    

@end

@implementation CityViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Add new city";
    
}

//
//  enable lookup if text in zip code field
//
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger length = self.zipCodeField.text.length - range.length + string.length;
    
    if (length > 0) {
        self.lookupButton.enabled = YES;
    } else {
        self.lookupButton.enabled = NO;
    }
    
    return YES;
    
}


//
//  try and find city for this zip code
//
-(IBAction)findButtonPushed:(id)sender{
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"City"
                                              inManagedObjectContext:self.managedObjectContext];
    City* city = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
    
    [city validateZip:self.zipCodeField.text delegate:self];
    
}

-(void) cityUpdated:(City*) city {
    
    if(city.apidata.errorText)
        self.messageLabel.text = city.apidata.errorText;
    
}


@end
