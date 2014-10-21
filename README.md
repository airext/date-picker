date-picker ![License MIT](http://img.shields.io/badge/license-MIT-lightgray.svg)
===========

![iOS](http://img.shields.io/badge/platform-ios-blue.svg)

AIR Native Extension for [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController).

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
