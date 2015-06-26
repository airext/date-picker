package com.github.airext.datepicker.functions;

import com.adobe.fre.*;
import com.github.airext.DatePicker;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class SetDebugFunction implements FREFunction
{
    @Override
    public FREObject call(FREContext context, FREObject[] args)
    {
        try
        {
            DatePicker.debug = args[0].getAsBool();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }
}
