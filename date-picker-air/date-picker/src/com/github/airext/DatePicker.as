/**
 * Created by mobitile on 9/19/14.
 */
package com.github.airext
{
import com.github.airext.core.date_picker;
import com.github.airext.data.DatePickerAppearance;
import com.github.airext.enum.DatePickerMode;
import com.github.airext.events.DatePickerEvent;

import flash.events.ErrorEvent;
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;

use namespace date_picker;

[Event(name="select", type="com.github.airext.events.DatePickerEvent")]

[Event(name="cancel", type="com.github.airext.events.DatePickerEvent")]

[Event(name="error", type="flash.events.ErrorEvent")]

public class DatePicker extends EventDispatcher
{
    //--------------------------------------------------------------------------
    //
    //  Class constants
    //
    //--------------------------------------------------------------------------

    date_picker static const EXTENSION_ID:String = "com.github.airext.DatePicker";

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------

    private static var _context:ExtensionContext;

    private static function get context():ExtensionContext
    {
        if (_context == null)
        {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
        }

        return _context;
    }

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    public static function isSupported():Boolean
    {
        return context != null && context.call("isSupported");
    }

    private static var instance:DatePicker;

    public static function sharedInstance():DatePicker
    {
        if (instance == null)
        {
            instance = new DatePicker();
        }

        return instance;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DatePicker()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //------------------------------------
    //  date
    //------------------------------------

    private var _date:Date;

    public function get date():Date
    {
        return _date;
    }

    public function set date(value:Date):void
    {
        _date = value;
    }

    //------------------------------------
    //  mode
    //------------------------------------

    private var _mode:String;

    public function get mode():String
    {
        return _mode;
    }

    public function set mode(value:String):void
    {
        _mode = value;
    }

    //------------------------------------
    //  title
    //------------------------------------

    private var _title:String;

    public function get title():String
    {
        return _title;
    }

    public function set title(value:String):void
    {
        _title = value;
    }

    //------------------------------------
    //  minimum
    //------------------------------------

    private var _minimum:Date;

    public function get minimum():Date
    {
        return _minimum;
    }

    public function set minimum(value:Date):void
    {
        _minimum = value;
    }

    //------------------------------------
    //  maximum
    //------------------------------------

    private var _maximum:Date;

    public function get maximum():Date
    {
        return _maximum;
    }

    public function set maximum(value:Date):void
    {
        _maximum = value;
    }

    //------------------------------------
    //  minuteInterval
    //------------------------------------

    private var _minuteInterval:uint = 1;

    public function get minuteInterval():uint
    {
        return _minuteInterval;
    }

    public function set minuteInterval(value:uint):void
    {
        if (value <= 0 || 60 % value != 0)
            value = 1;

        _minuteInterval = value;
    }

    //------------------------------------
    //  appearance
    //------------------------------------

    private var _appearance:DatePickerAppearance = new DatePickerAppearance();

    public function get appearance():DatePickerAppearance
    {
        return _appearance;
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function open():void
    {
        var date:Date = _date || new Date();

        var mode:String = _mode || DatePickerMode.DATE_AND_TIME;

        var settings:Object =
        {
            minimum : _minimum,
            maximum : _maximum,
            minuteInterval : _minuteInterval
        };

        context.addEventListener(StatusEvent.STATUS, statusHandler);

        context.call("open", date, mode, _title, settings, _appearance.getAppearance());
    }

    public function dispose():void
    {
        context.removeEventListener(StatusEvent.STATUS, statusHandler);
    }

    //--------------------------------------------------------------------------
    //
    //  Handlers
    //
    //--------------------------------------------------------------------------

    private function statusHandler(event:StatusEvent):void
    {
        switch (event.code)
        {
            case "DatePicker.Select" :

                var timestamp:Number = parseFloat(event.level);

                _date = new Date();
                _date.time = timestamp;

                dispatchEvent(new DatePickerEvent(DatePickerEvent.SELECT, _date));

                dispose();

                break;

            case "DatePicker.Cancel" :

                dispatchEvent(new DatePickerEvent(DatePickerEvent.CANCEL, _date));

                dispose();

                break;

            case "DatePicker.Error" :

                dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, event.level));

                dispose();

                break;
        }
    }
}
}
