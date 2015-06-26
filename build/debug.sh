#!/bin/bash

cp -R ../date-picker-air/date-picker-debug/bin-debug/DatePickerDebug-app.xml launch/DatePickerDebug-app.xml
cp -R ../date-picker-air/date-picker-debug/bin-debug/DatePickerDebug.swf launch/DatePickerDebug.swf

adt -package -target ipa-debug-interpreter -provisioning-profile $IOS_PROVISION -storetype pkcs12 -keystore $IOS_CERTIFICATE -storepass $IOS_CERTIFICATE_STOREPASS launch/DatePickerDebug.ipa launch/DatePickerDebug-app.xml -C launch DatePickerDebug.swf -extdir launch/ext -platformsdk /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/