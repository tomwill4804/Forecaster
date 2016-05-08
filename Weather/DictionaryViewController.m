//
//  DictionaryViewController.m
//  Forecaster
//
//  Created by Tom Williamson on 5/7/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "DictionaryViewController.h"

@interface DictionaryViewController ()

@end

@implementation DictionaryViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = self.mTitle;
    
}


#pragma mark - Table view data source

//
//  one section for each dictionary entry
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dictionary.count;
}

//
//  one row for each section
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

//
//  title for the section is the dictionary key
//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *keys = [self.dictionary allKeys];
    NSString *key = [keys objectAtIndex:section];
    return key;
    
}


//
//  return cell for table
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dictCell" forIndexPath:indexPath];
    
    NSArray *values = [self.dictionary allValues];
    NSString *value = [values objectAtIndex:indexPath.section];
    
    //
    //  format cell text based on type of data in dictionary
    //
    if ([value isKindOfClass:[NSString class]]) {
    }
    
    else if([value isKindOfClass:[NSNumber class]]) {
        
        if (value == (void*)kCFBooleanFalse || value == (void*)kCFBooleanTrue) {
            value = [NSString stringWithFormat:@"%@", value ? @"Yes" : @"No"];
        }
        else
            value = [NSString stringWithFormat:@"%@", (NSNumber*)value];
    }
    else
        value = @" ";
    
    cell.textLabel.text = value;
    
    return cell;
    
}


@end
