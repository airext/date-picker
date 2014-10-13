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
    public function DatePickerAppearance()
    {
        super();
    }

    private var _ios:RMDateSelectionViewControllerAppearance = new RMDateSelectionViewControllerAppearance();

    public function get ios():RMDateSelectionViewControllerAppearance
    {
        return _ios;
    }

    date_picker function getAppearance():Object
    {
        var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;

        if (Capabilities.manufacturer.indexOf("iOS") != -1)
            return _ios.toDTO();

        return null;
    }
}
}
