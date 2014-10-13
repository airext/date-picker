//
//  ANXDatePickerFacade.m
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import "ANXDatePicker.h"

#import "ANXDatePickerFacade.h"

#import "ANXDatePickerConversionRoutines.h"

@implementation ANXDatePickerFacade

@end

#pragma API

FREObject ANXDatePickerIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    FREObject supported;
    
    FRENewObjectFromBool(1, &supported);
    
    return supported;
}

FREObject ANXDatePickerOpen(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
{
    FREObject ok;
    FRENewObjectFromBool(1, &ok);
    
    FREObject fail;
    FRENewObjectFromBool(0, &fail);
    
    FREResult result;
    
    // date
    
    NSDate* date = [ANXDatePickerConversionRoutines convertFREObjectToNSDate:argv[0]];
    
    // mode
    
    uint32_t modeLength;
    const uint8_t* modeString;
    result = FREGetObjectAsUTF8(argv[1], &modeLength, &modeString);
    
    if (result != FRE_OK)
        return fail;
    
    UIDatePickerMode mode;
    
    if (strcmp((const char *) modeString, (const char *) "date") == 0)
        mode = UIDatePickerModeDate;
    else if (strcmp((const char *) modeString, (const char *) "time") == 0)
        mode = UIDatePickerModeTime;
    else
        mode = UIDatePickerModeDateAndTime;
    
    // title
    
    NSString *title = [ANXDatePickerConversionRoutines convertFREObjectToNSString:argv[2]];
    
    // settings
    
    NSMutableDictionary* settings = [NSMutableDictionary dictionary];
    
    [settings setValue:[ANXDatePickerConversionRoutines getDateFrom:argv[3] forProperty:@"minimum"] forKey:@"minimum"];
    
    [settings setValue:[ANXDatePickerConversionRoutines getDateFrom:argv[3] forProperty:@"maximum"] forKey:@"maximum"];
    
    [settings setValue:[ANXDatePickerConversionRoutines getNumberFrom:argv[3] forProperty:@"minuteInterval"] forKey:@"minuteInterval"];
    
    // appearance
    
    NSMutableDictionary* appearance = [NSMutableDictionary dictionary];
    
    [appearance setValue:[ANXDatePickerConversionRoutines getBoolFrom:argv[4] forProperty:@"hideNowButton"] forKey:@"hideNowButton"];
    
    [appearance setValue:[ANXDatePickerConversionRoutines getBoolFrom:argv[4] forProperty:@"disableMotionEffects"] forKey:@"disableMotionEffects"];
    
    [appearance setValue:[ANXDatePickerConversionRoutines getBoolFrom:argv[4] forProperty:@"disableBouncingWhenShowing"] forKey:@"disableBouncingWhenShowing"];
    
    [appearance setValue:[ANXDatePickerConversionRoutines getBoolFrom:argv[4] forProperty:@"backgroundTapsDisabled"] forKey:@"backgroundTapsDisabled"];
    
    // open
    
    [[ANXDatePicker sharedInstance] open: date withMode: mode withTitle: title withSettings: settings withAppearance: appearance];
    
    return ok;
}

#pragma mark FRE ContextInitializer/ContextFinalizer

void ANXDatePickerContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    *numFunctionsToTest = 2;
    
    FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * (*numFunctionsToTest));
    
    func[0].name = (const uint8_t*) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &ANXDatePickerIsSupported;
    
    func[1].name = (const uint8_t*) "open";
    func[1].functionData = NULL;
    func[1].function = &ANXDatePickerOpen;
    
    *functionsToSet = func;
    
    [ANXDatePicker sharedInstance].context = ctx;
}

void ANXDatePickerContextFinalizer(FREContext ctx)
{
    [ANXDatePicker sharedInstance].context = nil;
}

#pragma mark FRE Initializer/Finalizer

void ANXDatePickerInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    NSLog(@"ANXDatePickerInitializer");
    
    *extDataToSet = NULL;
    
    *ctxInitializerToSet = &ANXDatePickerContextInitializer;
    *ctxFinalizerToSet = &ANXDatePickerContextFinalizer;
}

void ANXDatePickerFinalizer(void* extData)
{
    NSLog(@"ANXDatePickerFinalizer");
}