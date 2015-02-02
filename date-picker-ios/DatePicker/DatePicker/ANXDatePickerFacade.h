//
//  ANXDatePickerFacade.h
//  DatePicker
//
//  Created by Maxim on 10/13/14.
//  Copyright (c) 2014 Max Rozdobudko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlashRuntimeExtensions.h"

@interface ANXDatePickerFacade : NSObject

@end

#pragma API

FREObject ANXDatePickerIsSupported(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXDatePickerOpen(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXDatePickerGetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

FREObject ANXDatePickerSetDebug(FREContext context, void* functionData, uint32_t argc, FREObject argv[]);

#pragma mark FRE ContextInitializer/ContextFinalizer

void ANXDatePickerContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void ANXDatePickerContextFinalizer(FREContext ctx);

#pragma mark FRE Initializer/Finalizer

void ANXDatePickerInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void ANXDatePickerFinalizer(void* extData);