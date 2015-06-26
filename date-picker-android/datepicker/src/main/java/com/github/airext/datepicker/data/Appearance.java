package com.github.airext.datepicker.data;

/**
 * Created by Max Rozdobudko on 6/26/15.
 */
public class Appearance
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public Appearance(boolean useDarkTheme, int theme)
    {
        this._useDarkTheme = useDarkTheme;

        this.theme = theme;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  useDarkTheme
    //-------------------------------------

    public boolean _useDarkTheme;

    public boolean useDarkTheme()
    {
        return _useDarkTheme;
    }

    //-------------------------------------
    //  theme
    //-------------------------------------

    public int theme;

    public int getTheme()
    {
        return theme;
    }
}
