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

@property (weak, nonatomic) NSString *independenceDay;
@property (weak, nonatomic) NSString *kennedyAssassination;
@property (weak, nonatomic) NSString *moonLanding;
@property (weak, nonatomic) NSString *starWarsRelease;
@property (weak, nonatomic) NSString *back2FutureRelease;
@property (weak, nonatomic) NSString *fluxCapacitor;

@property (strong, nonatomic) NSArray *importantDatesArray;

- (IBAction)importantDateSelected:(UIButton *)sender;

@end

@implementation DatePickerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.independenceDay = @"07/04/1776";
    self.kennedyAssassination = @"11/22/1963";
    self.moonLanding = @"07/20/1969";
    self.starWarsRelease = @"05/25/1977";
    self.back2FutureRelease = @"07/03/1985";
    self.fluxCapacitor = @"11/12/1955";
    
    self.importantDatesArray = [[NSArray alloc] initWithObjects:self.starWarsRelease, self.independenceDay, self.kennedyAssassination, self.moonLanding, self.back2FutureRelease, self.fluxCapacitor, nil];
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

- (IBAction)importantDateSelected:(UIButton *)sender {
    // First let's create a date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // Let's set a format for our date
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    [dateFormatter setDateFormat:formatString];
    
    NSDate *importantDate = [dateFormatter dateFromString:self.importantDatesArray[sender.tag]];
    
    [self.datePicker setDate:importantDate animated:true];
}

@end