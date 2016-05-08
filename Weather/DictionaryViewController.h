//
//  DictionaryViewController.h
//  Forecaster
//
//  Created by Tom Williamson on 5/7/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DictionaryViewController : UITableViewController

@property (strong, nonatomic) NSDictionary  *dictionary;
@property (copy, nonnull)     NSString      *mTitle;

@end
