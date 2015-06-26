package com.github.airext.datepicker.data;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public enum DatePickerMode
{
    Date, Time, DateAndTime;

    public static final DatePickerMode fromString(String name)
    {
        if (name == null)
        {
            return DateAndTime;
        }
        else
        {
            String nameInLowerCase = name.toLowerCase();

            if (nameInLowerCase.equals(Date.toString().toLowerCase()))
            {
                return Date;
            }
            else if (nameInLowerCase.equals(Time.toString().toLowerCase()))
            {
                return Time;
            }
            else
            {
                return DateAndTime;
            }
        }
    }
}
