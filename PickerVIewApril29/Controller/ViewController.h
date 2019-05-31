//
//  ViewController.h
//  PickerVIewApril29
//
//  Created by user153543 on 4/29/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//returns the number of 'columns ' to display
@property (nonatomic) NSMutableArray *purchaseArray;

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;


@end

