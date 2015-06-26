package com.github.airext.datepicker.functions;

import android.app.DialogFragment;
import android.os.Bundle;
import com.adobe.fre.*;
import com.github.airext.datepicker.data.Appearance;
import com.github.airext.datepicker.data.DatePickerMode;
import com.github.airext.datepicker.data.ExtraKeys;
import com.github.airext.datepicker.data.Settings;
import com.github.airext.datepicker.fragments.DatePickerFragment;
import com.github.airext.datepicker.fragments.TimePickerFragment;
import com.github.airext.datepicker.helpers.ConversionRoutines;

import java.util.Date;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class OpenFunction implements FREFunction
{
    @Override
    public FREObject call(FREContext context, FREObject[] args)
    {
        try
        {
            Date date = ConversionRoutines.convertFREObjectToDate(args[0]);

            DatePickerMode mode = ConversionRoutines.convertFREObjectToDatePickerMode(args[1]);

            String title = ConversionRoutines.convertFREObjectToString(args[2]);

            Settings setting = ConversionRoutines.convertFREObjectToSettings(args[3]);

            Appearance appearance = ConversionRoutines.convertFREObjectToAppearance(args[4]);

            Bundle extras = new Bundle();

            if (date != null)
                extras.putLong(ExtraKeys.EXTRA_DATE, date.getTime());

            extras.putBoolean(ExtraKeys.EXTRA_USE_DARK_THEME, appearance.useDarkTheme());

            extras.putInt(ExtraKeys.EXTRA_THEME, appearance.getTheme());

            if (setting.getMaximum() != null)
                extras.putLong(ExtraKeys.EXTRA_MINIMUM, setting.getMaximum().getTime());

            if (setting.getMinimum() != null)
                extras.putLong(ExtraKeys.EXTRA_MAXIMUM, setting.getMinimum().getTime());

            extras.putInt(ExtraKeys.EXTRA_MINUTE_INTERVAL, setting.getMinuteInterval());

            switch (mode)
            {
                case Time :

                    DialogFragment timePickerFragment = new TimePickerFragment();
                    timePickerFragment.setArguments(extras);
                    timePickerFragment.show(context.getActivity().getFragmentManager(), "timePicker");

                    break;

                case Date :

                    DialogFragment datePickerFragment = new DatePickerFragment();
                    datePickerFragment.setArguments(extras);
                    datePickerFragment.show(context.getActivity().getFragmentManager(), "datePicker");

                    break;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }
}
