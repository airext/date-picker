//
//  ANXDatePickerConversionRoutines.h
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlashRuntimeExtensions.h"

@interface ANXDatePickerConversionRoutines : NSObject

+(NSNumber*) getBoolFrom: (FREObject) object forProperty: (NSString*) property;

+(NSNumber*) getNumberFrom: (FREObject) object forProperty: (NSString*) property;

+(NSString*) getStringFrom: (FREObject) object forProperty: (NSString*) property;

+(NSDate*) getDateFrom: (FREObject) object forProperty: (NSString*) property;

+(FREObject) convertNSStringToFREObject:(NSString*) string;
+(NSString*) convertFREObjectToNSString: (FREObject) string;

+(NSDate*) convertFREObjectToNSDate: (FREObject) date;

+(FREObject) convertBoolToFREObject: (BOOL) value;
+(BOOL) convertFREObjectToBool: (FREObject) value;

@end
