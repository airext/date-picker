package com.github.airext.datepicker;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.github.airext.datepicker.functions.GetDebugFunction;
import com.github.airext.datepicker.functions.IsSupportedFunction;
import com.github.airext.datepicker.functions.OpenFunction;
import com.github.airext.datepicker.functions.SetDebugFunction;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Max Rozdobudko on 6/25/15.
 */
public class ExtensionContext extends FREContext
{

    @Override
    public Map<String, FREFunction> getFunctions()
    {
        Map<String, FREFunction> functions = new HashMap<String, FREFunction>();

        functions.put("isSupported", new IsSupportedFunction());

        functions.put("getDebug", new GetDebugFunction());
        functions.put("setDebug", new SetDebugFunction());

        functions.put("open", new OpenFunction());

        return functions;
    }

    @Override
    public void dispose()
    {

    }
}
