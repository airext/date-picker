package com.github.airext.datepicker.fragments;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.widget.DatePicker;
import com.github.airext.datepicker.data.ExtraKeys;

import java.util.Calendar;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class DatePickerFragment extends DialogFragment implements DatePickerDialog.OnDateSetListener
{
    private boolean wasDateSelected = false;

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

        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);

        DatePickerDialog dialog = new DatePickerDialog(getActivity(), theme, this, year, month, day);

        return dialog;
    }

    @Override
    public void onDateSet(DatePicker view, int year, int month, int day)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, day);

        wasDateSelected = true;

        com.github.airext.DatePicker.dispatch("DatePicker.Select", String.valueOf(calendar.getTimeInMillis()));
    }

    @Override
    public void onDestroy()
    {
        super.onDestroy();

        if (!wasDateSelected)
        {
            com.github.airext.DatePicker.dispatchStatus("DatePicker.Cancel");
        }
    }
}