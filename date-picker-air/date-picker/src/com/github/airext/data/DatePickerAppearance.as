/**
 * Created by mobitile on 9/20/14.
 */
package com.github.airext.data
{
import com.github.airext.core.date_picker;

import flash.system.Capabilities;

use namespace date_picker;

public class DatePickerAppearance
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DatePickerAppearance()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  useDarkTheme
    //-------------------------------------

    private var _useDarkTheme:Boolean = false;

    public function get useDarkTheme():Boolean
    {
        return _useDarkTheme;
    }

    public function set useDarkTheme(value:Boolean):void
    {
        _useDarkTheme = value;
    }

    //-------------------------------------
    //  ios
    //-------------------------------------

    private var _ios:RMDateSelectionViewControllerAppearance = new RMDateSelectionViewControllerAppearance();

    public function get ios():RMDateSelectionViewControllerAppearance
    {
        return _ios;
    }

    //-------------------------------------
    //  android
    //-------------------------------------

    private var _android:AndroidAppearance = new AndroidAppearance();

    public function get android():AndroidAppearance
    {
        return _android;
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    date_picker function getAppearance():Object
    {
        var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

        var dto:Object = null;

        if (Capabilities.manufacturer.indexOf("iOS") != -1)
        {
            dto = _ios.toDTO();
        }
        else if (Capabilities.manufacturer.indexOf("Android") != -1)
        {
            dto = _android.toDTO();
        }
        else
        {
            dto = {};
        }

        dto.useDarkTheme = _useDarkTheme;

        return dto;
    }
}
}
