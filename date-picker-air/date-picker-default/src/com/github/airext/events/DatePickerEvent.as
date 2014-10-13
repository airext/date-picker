/**
 * Created by mobitile on 9/20/14.
 */
package com.github.airext.events
{
import flash.events.Event;

public class DatePickerEvent extends Event
{
    public static const SELECT:String = "select";

    public static const CANCEL:String = "cancel";

    public function DatePickerEvent(type:String, date:Date, bubbles:Boolean = false, cancelable:Boolean = false)
    {
        super(type, bubbles, cancelable);

        _date = date;
    }

    private var _date:Date;
    public function get date():Date
    {
        return _date;
    }

    override public function clone():Event
    {
        return new DatePickerEvent(type, date, bubbles, cancelable)
    }
}
}
