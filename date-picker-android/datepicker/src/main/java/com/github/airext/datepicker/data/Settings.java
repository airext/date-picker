package com.github.airext.datepicker.data;

import java.util.Date;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class Settings
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public Settings(Date min, Date max, int interval)
    {
        super();

        this.minimum = min;
        this.maximum = max;
        this.minuteInterval = interval;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  minimum
    //-------------------------------------

    private Date minimum;

    public Date getMinimum()
    {
        return minimum;
    }

    //-------------------------------------
    //  maximum
    //-------------------------------------

    private Date maximum;

    public Date getMaximum()
    {
        return maximum;
    }

    //-------------------------------------
    //  minuteInterval
    //-------------------------------------

    private int minuteInterval;

    public int getMinuteInterval()
    {
        return minuteInterval;
    }

}
