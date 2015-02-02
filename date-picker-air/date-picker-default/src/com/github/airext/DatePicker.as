/**
 * Created by mobitile on 9/19/14.
 */
package com.github.airext
{
import com.github.airext.data.DatePickerAppearance;

import flash.system.Capabilities;

public class DatePicker
{
    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    public static function isSupported():Boolean
    {
        return false;
    }

    private static var instance:DatePicker;

    public static function getInstance():DatePicker
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
    //  Properties
    //
    //--------------------------------------------------------------------------

    //------------------------------------
    //  debug
    //------------------------------------

    public function get debug():Boolean
    {
        trace("DatePicker is not supported for " + Capabilities.os);

        return false;
    }

    public function set debug(value:Boolean):void
    {
        trace("DatePicker is not supported for " + Capabilities.os);
    }

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
        trace("DatePicker is not supported for " + Capabilities.os);
    }

    public function dispose():void
    {
        trace("DatePicker is not supported for " + Capabilities.os);
    }
}
}
