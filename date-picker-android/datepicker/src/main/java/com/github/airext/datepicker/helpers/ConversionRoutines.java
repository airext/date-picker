package com.github.airext.datepicker.helpers;

import com.adobe.fre.*;
import com.github.airext.datepicker.data.Appearance;
import com.github.airext.datepicker.data.DatePickerMode;
import com.github.airext.datepicker.data.Settings;

import java.util.Date;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class ConversionRoutines
{
    public static final Date convertFREObjectToDate(FREObject date) throws FREASErrorException, FREInvalidObjectException, FREWrongThreadException, FRENoSuchNameException, FRETypeMismatchException
    {
        if (date != null)
        {
            double time = date.getProperty("time").getAsDouble();

            return new Date((long) time);
        }
        else
        {
            return null;
        }
    }

    public static final String convertFREObjectToString(FREObject object) throws FREInvalidObjectException, FRETypeMismatchException, FREWrongThreadException
    {
        return object != null ? object.getAsString() : null;
    }

    public static final int convertFREObjectToInt(FREObject object) throws FREInvalidObjectException, FRETypeMismatchException, FREWrongThreadException
    {
        return object != null ? object.getAsInt() : 0;
    }

    public static final boolean convertFREObjectToBoolean(FREObject object) throws FREInvalidObjectException, FRETypeMismatchException, FREWrongThreadException
    {
        return object != null ? object.getAsBool() : false;
    }

    public static final DatePickerMode convertFREObjectToDatePickerMode(FREObject mode) throws FREInvalidObjectException, FRETypeMismatchException, FREWrongThreadException
    {
        if (mode != null)
        {
            String name = mode.getAsString();

            if (name == null)
            {
                return DatePickerMode.DateAndTime;
            }
            else if (name.equals("date"))
            {
                return DatePickerMode.Date;
            }
            else if (name.equals("time"))
            {
                return DatePickerMode.Time;
            }
            else
            {
                return DatePickerMode.DateAndTime;
            }
        }
        else
        {
            return null;
        }
    }

    public static final Settings convertFREObjectToSettings(FREObject object) throws FREASErrorException, FREInvalidObjectException, FREWrongThreadException, FRENoSuchNameException, FRETypeMismatchException
    {
        Date min = object != null ? convertFREObjectToDate(object.getProperty("minimum")) : null;
        Date max = object != null ? convertFREObjectToDate(object.getProperty("maximum")) : null;
        int interval = object != null ? object.getProperty("minuteInterval").getAsInt() : 0;

        return new Settings(min, max, interval);
    }

    public static final Appearance convertFREObjectToAppearance(FREObject object) throws FREASErrorException, FREInvalidObjectException, FREWrongThreadException, FRENoSuchNameException, FRETypeMismatchException
    {
        boolean useDarkTheme = object != null ? convertFREObjectToBoolean(object.getProperty("useDarkTheme")) : false;

        int theme = object != null ? convertFREObjectToInt(object.getProperty("theme")) : 0;

        return new Appearance(useDarkTheme, theme);
    }
}
