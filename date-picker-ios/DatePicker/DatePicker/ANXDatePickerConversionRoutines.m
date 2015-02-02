//
//  ANXDatePickerConversionRoutines.m
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXDatePickerConversionRoutines.h"

@implementation ANXDatePickerConversionRoutines

+(NSNumber*) getBoolFrom: (FREObject) object forProperty: (NSString*) property
{
    FREResult result;
    
    FREObject propertyValue;
    
    result = FREGetObjectProperty(object, (const uint8_t*) [property UTF8String], &propertyValue, NULL);
    
    if (result != FRE_OK)
        return [NSNumber numberWithBool:NO];
    
    uint32_t tempValue;
    
    result = FREGetObjectAsBool(propertyValue, &tempValue);
    
    if (result != FRE_OK)
        return [NSNumber numberWithBool:NO];;
    
    return [NSNumber numberWithBool:tempValue];
}

+(NSNumber*) getNumberFrom: (FREObject) object forProperty: (NSString*) property
{
    FREResult result;
    
    FREObject propertyValue;
    
    result = FREGetObjectProperty(object, (const uint8_t*) [property UTF8String], &propertyValue, NULL);
    
    if (result != FRE_OK)
        return nil;
    
    double tempValue;
    
    result = FREGetObjectAsDouble(object, &tempValue);
    
    if (result != FRE_OK)
        return nil;
    
    return [NSNumber numberWithDouble:tempValue];
}

+(NSString*) getStringFrom: (FREObject) object forProperty: (NSString*) property
{
    FREResult result;
    
    FREObject propertyValue;
    
    result = FREGetObjectProperty(object, (const uint8_t*) [property UTF8String], &propertyValue, NULL);
    
    if (result != FRE_OK)
        return nil;
    
    return [self convertFREObjectToNSString:propertyValue];
}

+(NSDate*) getDateFrom: (FREObject) object forProperty: (NSString*) property
{
    FREResult result;
    
    FREObject propertyValue;
    
    result = FREGetObjectProperty(object, (const uint8_t*) [property UTF8String], &propertyValue, NULL);

    if (result != FRE_OK)
        return nil;
    
    return [self convertFREObjectToNSDate:propertyValue];
}

+(FREObject) convertNSStringToFREObject:(NSString*) string
{
    if (string == nil) return NULL;
    
    const char* utf8String = string.UTF8String;
    
    unsigned long length = strlen( utf8String );
    
    FREObject result;
    FRENewObjectFromUTF8((uint32_t) length + 1, (const uint8_t*) utf8String, &result);
    
    return result;
}

+(NSString*) convertFREObjectToNSString: (FREObject) string
{
    FREResult result;
    
    uint32_t length = 0;
    const uint8_t* tempValue = NULL;
    
    result = FREGetObjectAsUTF8(string, &length, &tempValue);
    
    if (result != FRE_OK)
        return nil;
    
    return [NSString stringWithUTF8String: (char*) tempValue];
}


+(NSDate*) convertFREObjectToNSDate: (FREObject) date
{
    FREResult result;
    
    FREObject time;
    result = FREGetObjectProperty(date, (const uint8_t*) "time", &time, NULL);
    
    if (result != FRE_OK)
        return nil;
    
    NSTimeInterval timestamp;
    result = FREGetObjectAsDouble(time, &timestamp);
    
    if (result != FRE_OK)
        return nil;
    
    NSTimeInterval seconds = timestamp * 0.001;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *tempDate = [NSDate dateWithTimeIntervalSince1970: seconds];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    return [calendar dateByAddingComponents:comps toDate:tempDate options:0];
}

+(FREObject) convertBoolToFREObject: (BOOL) value
{
    FREObject result = NULL;
    
    if (value)
        FRENewObjectFromBool((uint32_t) 1, &result);
    else
        FRENewObjectFromBool((uint32_t) 0, &result);
    
    return result;
}

+(BOOL) convertFREObjectToBool: (FREObject) value
{
    uint32_t tempValue;
    
    FREResult result = FREGetObjectAsBool(value, &tempValue);
    
    if (result != FRE_OK)
        return NO;
    
    return tempValue > 0;
}

@end
