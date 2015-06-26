#!/bin/bash

unzip -o date-picker.swc

unzip -o default/date-picker-default.swc -d default

adt -package -storetype pkcs12 -keystore $AIR_CERTIFICATE -storepass $AIR_CERTIFICATE_STOREPASS -target ane date-picker.ane extension.xml -swc date-picker.swc -platform iPhone-ARM library.swf libDatePicker.a -platformoptions platform.xml -platform default -C default library.swf

cp -R date-picker.ane ../date-picker-air/date-picker-debug/ane/date-picker.ane

cp -R date-picker.ane ../bin/date-picker.ane

mkdir -p launch/ext
cp -R date-picker.ane launch/ext/date-picker.ane
unzip -o launch/ext/date-picker.ane -d launch/ext

rm library.swf
rm catalog.xml

rm default/library.swf
rm default/catalog.xml