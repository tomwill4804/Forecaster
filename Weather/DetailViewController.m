//
//  DetailViewController.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
        
    }
}

- (void)configureView {
   
    if (self.detailItem) {
    
        City *city = (City*)self.detailItem;
        NSDate *now = [[NSDate alloc]init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"HH"];
        NSString *aDate = [formatter stringFromDate:now];
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterNoStyle;
        NSNumber *hour = [numberFormatter numberFromString:aDate];
        NSNumber *limit = @18;
        if (hour < limit)
        {
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-day"]];
        }
        else
        {
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-night2"]];
        }
        
        self.navigationItem.title = city.city;
        
        self.iconView.image = [UIImage imageNamed:city.icon];
        self.conditionsLabel.text = city.summary;
        self.cityLabel.text = city.city;
        self.tempLabel.text = [NSString stringWithFormat:@"%ld\u00B0F", [city.temperature integerValue]];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        dateFormatter.doesRelativeDateFormatting = YES;
        NSString *time = [dateFormatter stringFromDate:city.updatedAt];
        self.updatedLabel.text = [NSString stringWithFormat:@"%@", time];

        
        
    }
    
}

- (void)viewDidLoad  {
    
    [super viewDidLoad];
    
    [self configureView];
    
}



@end
