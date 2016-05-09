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
    
    //
    //  set title
    //
    NSDate *now = [[NSDate alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH"];
    NSString *aDate = [formatter stringFromDate:now];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterNoStyle;
    NSNumber *hour = [numberFormatter numberFromString:aDate];
    NSNumber *limit = @18;
    if (hour < limit){
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-day"]];
        self.lookupButton.tintColor = [UIColor colorWithRed:23/255.0 green:77/255.0 blue:102/255.0 alpha:1.0];
        
    }else{
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-night"]];
        self.lookupButton.tintColor = [UIColor colorWithRed:59/255.0 green:31/255.0 blue:135/255.0 alpha:1.0];
    }

    self.navigationItem.title = @"Enter ZipCode";
    [self.zipCodeField becomeFirstResponder];
    
    
    
}

//
//  enable lookup if text in zipcode field
//
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if(self.zipCodeField.text.length >= 5 && range.length == 0)
    {
        self.lookupButton.enabled = NO;
        return NO;
    }
    self.lookupButton.enabled = YES;
    return YES;
    
//    NSUInteger length = self.zipCodeField.text.length - range.length + string.length;
//    
//    if (length >= 5) {
//        self.lookupButton.enabled = YES;
//    } else {
//        self.lookupButton.enabled = NO;
//    }
//    
//    return YES;
    
}


//
//  try and find city for this zipcode
//
-(IBAction)findButtonPushed:(id)sender{
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"City"
                                              inManagedObjectContext:self.managedObjectContext];
    self.city = (City*)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
    
    [self.city validateZip:self.zipCodeField.text delegate:self];
    
}


//
//  we are back from the zipcode lookup
//
-(void) cityUpdated:(City*) city {
    
    //
    //  see if we got an error
    //
    if(self.city.apidata.errorText) {
        
        UIAlertController * alertController =
        [UIAlertController alertControllerWithTitle:@"Invalid Zipcode"
                                            message:@"The zipcode you entered was incorrect, please try again."
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * okAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.city = nil;
        }];
        
        [alertController addAction:okAlert];
        
        [self presentViewController:alertController animated:YES completion:nil];

        //self.messageLabel.text = city.apidata.errorText;
        
    }
    
    //
    //  return to main view controller with new city built
    //
    else {
        [self performSegueWithIdentifier:@"unwindNewCity" sender:self];
    }
    
}


@end
