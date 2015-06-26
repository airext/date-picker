date-picker ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)
===========

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)![Android](http://img.shields.io/badge/platform-android-green.svg)

This [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) allows using [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController) in AIR applications.

### Requrements
 * iOS 7.0 or greater.
 * Android 4.0 (API level 14) or greater. 

### Usage

```as3
var picker:DatePicker = new DatePicker();
picker.addEventListener(DatePickerEvent.SELECT, selectHandler);
picker.addEventListener(DatePickerEvent.CANCEL, cancelHandler);

private function selectHandler(event:DatePickerEvent):void
{
  trace(event.date); // <- selected date;
}

private function cancelHandler(event:DatePickerEvent):void
{
  trace("Canceled");
}

```

### Screenshots

![iPhone5 Protrait](http://airext.github.io/date-picker/screenshots/iphone5-portrait.png)

![Nexus4 Protrait Light](http://airext.github.io/date-picker/screenshots/nexus4-portrait-light.png)

### Limitation

* DateAndTime mode is not supported on Android
* Black theme is not supported on iOS
