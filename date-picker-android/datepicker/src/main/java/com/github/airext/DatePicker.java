package com.github.airext;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;
import com.github.airext.datepicker.ExtensionContext;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class DatePicker implements FREExtension
{
    //--------------------------------------------------------------------------
    //
    //  Class variables
    //
    //--------------------------------------------------------------------------

    public static boolean debug = false;

    public static FREContext context;

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    public static void dispatch(String code, String level)
    {
        context.dispatchStatusEventAsync(code, level);
    }

    public static void dispatchStatus(String code)
    {
        dispatch(code, "status");
    }

    public static void dispatchError(String code)
    {
        dispatch(code, "error");
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    @Override
    public void initialize()
    {
        Log.d("DatePicker", "initialize()");
    }

    @Override
    public FREContext createContext(String s)
    {
        Log.d("DatePicker", "createContext()");

        context = new ExtensionContext();

        return context;
    }

    @Override
    public void dispose()
    {
        Log.d("DatePicker", "dispose()");
    }
}
