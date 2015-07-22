package com.github.airext.datepicker.fragments;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.TimePickerDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.widget.TimePicker;
import com.github.airext.DatePicker;
import com.github.airext.datepicker.R;
import com.github.airext.datepicker.data.ExtraKeys;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class TimePickerFragment extends DialogFragment implements TimePickerDialog.OnTimeSetListener
{
    private boolean wasTimeSelected = false;

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState)
    {
        final Calendar calendar = Calendar.getInstance();
        int theme = DatePickerDialog.THEME_DEVICE_DEFAULT_LIGHT;

        Bundle args = getArguments();

        if (args != null)
        {
            // theme

            if (args.containsKey(ExtraKeys.EXTRA_THEME) && args.getInt(ExtraKeys.EXTRA_THEME) > 0)
            {
                theme = args.getInt(ExtraKeys.EXTRA_THEME);
            }
            else if (args.containsKey(ExtraKeys.EXTRA_USE_DARK_THEME) && args.getBoolean(ExtraKeys.EXTRA_USE_DARK_THEME))
            {
                theme = DatePickerDialog.THEME_DEVICE_DEFAULT_DARK;
            }

            // date

            if (args != null && args.containsKey(ExtraKeys.EXTRA_DATE))
            {
                calendar.setTimeInMillis(args.getLong(ExtraKeys.EXTRA_DATE));
            }
        }

        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);

        return new TimePickerDialog(getActivity(), theme, this, hour, minute, DateFormat.is24HourFormat(getActivity()));
    }

    @Override
    public void onTimeSet(TimePicker view, int hourOfDay, int minute)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE), hourOfDay, minute);

        wasTimeSelected = true;

        DatePicker.dispatch("DatePicker.Select", String.valueOf(calendar.getTimeInMillis()));
    }

    @Override
    public void onDestroy()
    {
        super.onDestroy();

        if (!wasTimeSelected)
        {
            com.github.airext.DatePicker.dispatchStatus("DatePicker.Cancel");
        }
    }
}
