date-picker ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)
===========

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

This [AIR Native Extension](http://www.adobe.com/devnet/air/native-extensions-for-air.html) allows using [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController) in AIR applications.

### Requrements
 * iOS 7.0 or above

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