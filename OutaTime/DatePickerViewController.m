//
//  TimePickerViewController.m
//  OutaTime
//
//  Created by Ben Gohlke on 2/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *importantDatesPicker;

@property (strong, nonatomic) NSArray *importantDatesArray;
@property (strong, nonatomic) NSArray *importantDatesLabelsArray;
//@property (strong, nonatomic) NSDictionary *importantDatesDictionary;

@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    // Set the views titel
    //
    self.title = @"Destination Date";
    
//    self.importantDatesDictionary =[[NSDictionary alloc] initWithObjects:@[@"07/04/1776", @"11/22/1963", @"07/20/1969", @"05/25/1977", @"07/03/1985", @"11/12/1955"] forKeys:@[@"Declaration of Independence", @"Kennedy Assassination", @"Moon Landing", @"Star Wars Release Date", @"Back to the Future Release Date", @"Flux Capacitor Created"]];
//    self.importantDatesLabelsArray = [[NSArray alloc] initWithArray:[self.importantDatesDictionary allKeys]];
    
    //
    // Set up our important dates
    //
    self.importantDatesArray = [[NSArray alloc] initWithObjects:@"", @"07/04/1776", @"11/22/1963", @"07/20/1969", @"05/25/1977", @"07/03/1985", @"11/12/1955", nil];
    self.importantDatesLabelsArray = [[NSArray alloc] initWithObjects:@"Custom", @"Declaration of Independence", @"Kennedy Assassination", @"Moon Landing", @"Star Wars Release", @"Back to the Future Release", @"Flux Capacitor Created", nil];
    
    //
    // Specifiy that DatePickerViewController is the delegate to handle the picker view methods
    // and that it is going to also be the data source for the picker.
    //
    self.importantDatesPicker.delegate = self;
    self.importantDatesPicker.dataSource = self;
    
    //
    // Set the text color for the UIDatePicker and the UIPickerView
    //
    [self.datePicker setValue:[UIColor whiteColor] forKey:@"textColor"];
    [self.importantDatesPicker setValue:[UIColor whiteColor] forKey:@"textColor"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //
    // 11. We need to call a method to tell the delegate that a destination date was chosen and pass the date from the
    //    datePicker object.
    //
    [self.delegate destinationDateWasChosen:self.datePicker.date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker View Components

//
// Set the number of columns for the picker view
//
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//
// Set the number of rows for the picker view
//
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.importantDatesLabelsArray.count;
}

//
// The data to return for the row and component
//
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.importantDatesLabelsArray[row];
}

//
// Get the data for the selected row
//
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //
    // First let's create a date formatter
    //
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //
    // Let's set a format for our date
    //
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:formatString];
    
    //
    // Get our date from the string representation
    //
    NSDate *importantDate = [[NSDate alloc] init];
    if ([self.importantDatesArray[row] isEqualToString:@""]) {
        importantDate = [NSDate date];
    } else {
        importantDate = [dateFormatter dateFromString:self.importantDatesArray[row]];
    }
    
    //
    // Set the date picker to the date that was chosen from the picker
    //
    [self.datePicker setDate:importantDate animated:true];
}

@end