//
//  DatePicker.h
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RMDateSelectionViewController.h"

#import "FlashRuntimeExtensions.h"

@interface ANXDatePicker : NSObject <RMDateSelectionViewControllerDelegate>

#pragma mark Shared Instance

+(ANXDatePicker*) sharedInstance;

#pragma mark Properties

@property FREContext context;

@property BOOL debug;

#pragma mark API Funcitons

-(BOOL) isSupported;

-(BOOL) open: (NSDate*) date withMode: (UIDatePickerMode) mode withTitle: (NSString*) title withSettings: (NSDictionary*) settings withAppearance: (NSDictionary*) appearance;

@end
