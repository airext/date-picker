date-picker
===========

AIR Native Extension for [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController).

### Usage

```as3
picker = new DatePicker();
picker.addEventListener(DatePickerEvent.SELECT, selectHandler);
picker.maximum = new Date(2015, 1);
picker.minimum = new Date(2013, 1);
picker.date = new Date();

private function selectHandler(event:DatePickerEvent):void
{
  trace(event.date); // <- selected date;
}
```
