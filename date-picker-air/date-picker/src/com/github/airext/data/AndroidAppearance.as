/**
 * Created by Max Rozdobudko on 6/26/15.
 */
package com.github.airext.data
{
public class AndroidAppearance
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     * Special theme constant for {@link #AlertDialog(Context, int)}: use
     * the traditional (pre-Holo) alert dialog theme.
     */
    public static const THEME_TRADITIONAL:int = 1;

    /**
     * Special theme constant for {@link #AlertDialog(Context, int)}: use
     * the holographic alert theme with a dark background.
     */
    public static const THEME_HOLO_DARK:int = 2;

    /**
     * Special theme constant for {@link #AlertDialog(Context, int)}: use
     * the holographic alert theme with a light background.
     */
    public static const THEME_HOLO_LIGHT:int = 3;

    /**
     * Special theme constant for {@link #AlertDialog(Context, int)}: use
     * the device's default alert theme with a dark background.
     */
    public static const THEME_DEVICE_DEFAULT_DARK:int = 4;

    /**
     * Special theme constant for {@link #AlertDialog(Context, int)}: use
     * the device's default alert theme with a light background.
     */
    public static const THEME_DEVICE_DEFAULT_LIGHT:int = 5;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function AndroidAppearance()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  theme
    //-------------------------------------

    public var theme:int = 0;

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function toDTO():Object
    {
        var dto:Object =
        {
            theme : theme
        };

        return dto;
    }
}
}
