//
//  DetailViewController.h
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *conditionsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedLabel;


@end

