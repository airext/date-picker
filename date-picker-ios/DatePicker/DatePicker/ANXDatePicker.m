//
//  DatePicker.m
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXDatePicker.h"

@implementation ANXDatePicker

#pragma mark Shared Instance

static ANXDatePicker* _sharedInstance = nil;

+(ANXDatePicker*) sharedInstance
{
    if (_sharedInstance == nil)
    {
        _sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return _sharedInstance;
}

#pragma mark Properties

@synthesize context;

#pragma mark API Funcitons

-(BOOL) isSupported
{
    return true;
}

-(BOOL) open: (NSDate*) date withMode: (UIDatePickerMode) mode withTitle: (NSString*) title withSettings: (NSDictionary*) settings withAppearance: (NSDictionary*) appearance
{
    RMDateSelectionViewController *dateSelectionVC = [RMDateSelectionViewController dateSelectionController];
    dateSelectionVC.delegate = self;
    dateSelectionVC.titleLabel.text = title;
    
    //You can enable or disable blur, bouncing and motion effects
    dateSelectionVC.disableBouncingWhenShowing = [(NSNumber*)[appearance objectForKey:@"disableBouncingWhenShowing"] boolValue];
    dateSelectionVC.disableMotionEffects = [(NSNumber*)[appearance objectForKey:@"disableMotionEffects"] boolValue];
    //    dateSelectionVC.disableBlurEffects = [[(NSNumber*)[appearance objectForKey:@"disableBlurEffects"] boolValue];
    
    dateSelectionVC.hideNowButton = [(NSNumber*)[appearance objectForKey:@"hideNowButton"] boolValue];
    dateSelectionVC.backgroundTapsDisabled = [(NSNumber*)[appearance objectForKey:@"backgroundTapsDisabled"] boolValue];
    
    //You can also adjust colors (enabling the following line will result in a black version of RMDateSelectionViewController)
    //    if (false)
    //        dateSelectionVC.blurEffectStyle = UIBlurEffectStyleDark;
    
    //Enable the following lines if you want a black version of RMDateSelectionViewController but also disabled blur effects (or run on iOS 7)
    //dateSelectionVC.tintColor = [UIColor whiteColor];
    //dateSelectionVC.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
    //dateSelectionVC.selectedBackgroundColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    //You can access the actual UIDatePicker via the datePicker property
    dateSelectionVC.datePicker.date = date;
    dateSelectionVC.datePicker.datePickerMode = mode;
    dateSelectionVC.datePicker.minuteInterval = [(NSNumber*)[settings objectForKey:@"minuteInterval"] integerValue];
    dateSelectionVC.datePicker.minimumDate = [settings objectForKey:@"minimum"];
    dateSelectionVC.datePicker.maximumDate = [settings objectForKey:@"maximum"];
    
    //The example project is universal. So we first need to check whether we run on an iPhone or an iPad.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        //OK, running on an iPhone. The following lines demonstrate the two ways to show the date selection view controller on iPhones:
        //(Note: These two methods also work an iPads.)
        
        // 1. Just show the date selection view controller (make sure the delegate property is assigned)
        [dateSelectionVC show];
        
        // 2. Instead of using a delegate you can also pass blocks when showing the date selection view controller
        //[dateSelectionVC showWithSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        //    NSLog(@"Successfully selected date: %@ (With block)", aDate);
        //} andCancelHandler:^(RMDateSelectionViewController *vc) {
        //    NSLog(@"Date selection was canceled (with block)");
        //}];
    }
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        //OK, running on an iPad. The following lines demonstrate the four special ways of showing the date selection view controller on iPads:
        
        // 1. Show the date selection view controller from a particular view controller (make sure the delegate property is assigned).
        //    This method can be used to show the date selection view controller within popovers.
        //    (Note: We do not use self as the view controller, as showing a date selection view controller from a table view controller
        //           is not supported due to UIKit limitations.)
        //[dateSelectionVC showFromViewController:self.navigationController];
        
        // 2. As with the two ways of showing the date selection view controller on iPhones, we can also use a blocks based API.
        //[dateSelectionVC showFromViewController:self.navigationController withSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        //    NSLog(@"Successfully selected date: %@ (With block)", aDate);
        //} andCancelHandler:^(RMDateSelectionViewController *vc) {
        //    NSLog(@"Date selection was canceled (with block)");
        //}];
        
        // 3. Show the date selection view controller using a UIPopoverController. The rect and the view are used to tell the
        //    UIPopoverController where to show up.
        //        [dateSelectionVC showFromRect:[self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] inView:self.view];
        
        // 4. The date selectionview controller can also be shown within a popover while also using blocks based API.
        //[dateSelectionVC showFromRect:[self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] inView:self.view withSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        //    NSLog(@"Successfully selected date: %@ (With block)", aDate);
        //} andCancelHandler:^(RMDateSelectionViewController *vc) {
        //    NSLog(@"Date selection was canceled (with block)");
        //}];
    }
    
    return true;
}

#pragma mark - RMDAteSelectionViewController Delegates

- (void)dateSelectionViewController:(RMDateSelectionViewController *)vc didSelectDate:(NSDate *)aDate
{
    NSTimeInterval timestamp = [aDate timeIntervalSince1970];
    
    timestamp = timestamp * 1000;
    
    NSString* timestampAsString = [NSString stringWithFormat:@"%f", timestamp];
    
    FREDispatchStatusEventAsync(context, (const uint8_t*) "DatePicker.Select", (const uint8_t*) [timestampAsString UTF8String]);
}

- (void)dateSelectionViewControllerDidCancel:(RMDateSelectionViewController *)vc
{
    FREDispatchStatusEventAsync(context, (const uint8_t*) "DatePicker.Cancel", (const uint8_t*) "status");
}

@end
