//
//  DatePicker.m
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXDatePicker.h"

#pragma mark Macros

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

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

@synthesize debug;

#pragma mark API Funcitons

-(BOOL) isSupported
{
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0");
}

-(BOOL) open: (NSDate*) date withMode: (UIDatePickerMode) mode withTitle: (NSString*) title withSettings: (NSDictionary*) settings withAppearance: (NSDictionary*) appearance
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        RMDateSelectionViewController *dateSelectionVC = [RMDateSelectionViewController dateSelectionController];
        dateSelectionVC.delegate = self;
        dateSelectionVC.titleLabel.text = title;
        
        dateSelectionVC.disableBouncingWhenShowing = [(NSNumber*)[appearance objectForKey:@"disableBouncingWhenShowing"] boolValue];
        dateSelectionVC.disableMotionEffects = [(NSNumber*)[appearance objectForKey:@"disableMotionEffects"] boolValue];
        
        dateSelectionVC.hideNowButton = [(NSNumber*)[appearance objectForKey:@"hideNowButton"] boolValue];
        dateSelectionVC.backgroundTapsDisabled = [(NSNumber*)[appearance objectForKey:@"backgroundTapsDisabled"] boolValue];
        
        //dateSelectionVC.blurEffectStyle = UIBlurEffectStyleDark;
        //dateSelectionVC.tintColor = [UIColor whiteColor];
        //dateSelectionVC.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        //dateSelectionVC.selectedBackgroundColor = [UIColor colorWithWhite:0.4 alpha:1];
        
        dateSelectionVC.datePicker.date = date;
        dateSelectionVC.datePicker.datePickerMode = mode;
        dateSelectionVC.datePicker.minuteInterval = [(NSNumber*)[settings objectForKey:@"minuteInterval"] integerValue];
        dateSelectionVC.datePicker.minimumDate = [settings objectForKey:@"minimum"];
        dateSelectionVC.datePicker.maximumDate = [settings objectForKey:@"maximum"];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            [dateSelectionVC show];
        }
        else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
        {
            UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            
            [dateSelectionVC showFromViewController:rootViewController];
        }
        
        return true;
    }
    else
    {
        if (debug)
        {
            NSLog(@"[DatePicker] Warn: Unsupported on current iOS version (iOS 7.0 or greate required).");
        }

        FREDispatchStatusEventAsync(context, (const uint8_t *) "DatePicker.Error", (const uint8_t*) "Unsupported on current platform.");
        
        return false;
    }
}

#pragma mark - RMDAteSelectionViewController Delegates

- (void)dateSelectionViewController:(RMDateSelectionViewController *)vc didSelectDate:(NSDate *)aDate
{
    NSTimeInterval seconds = [aDate timeIntervalSince1970];
    
    if (self.debug)
    {
        NSLog(@"[DatePicker] Info: Selected date is %@, Unix time is %f", aDate, seconds);
    }
    
    NSTimeInterval timestamp = seconds * 1000;
    
    NSString* timestampAsString = [NSString stringWithFormat:@"%f", timestamp];
    
    FREDispatchStatusEventAsync(context, (const uint8_t*) "DatePicker.Select", (const uint8_t*) [timestampAsString UTF8String]);
}

- (void)dateSelectionViewControllerDidCancel:(RMDateSelectionViewController *)vc
{
    FREDispatchStatusEventAsync(context, (const uint8_t*) "DatePicker.Cancel", (const uint8_t*) "status");
}

@end
