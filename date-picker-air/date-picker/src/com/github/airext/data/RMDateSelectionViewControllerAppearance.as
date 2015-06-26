/**
 * Created by mobitile on 9/20/14.
 */
package com.github.airext.data
{
public class RMDateSelectionViewControllerAppearance
{
    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function RMDateSelectionViewControllerAppearance()
    {
        super();
    }

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    public var tintColor:Number;

    public var backgroundColor:Number;

    public var selectedBackgroundColor:Number;

    public var hideNowButton:Boolean;

    public var disableMotionEffects:Boolean;

    public var disableBouncingWhenShowing:Boolean;

    public var backgroundTapsDisabled:Boolean;

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function toDTO():Object
    {
        var dto:Object =
        {
            tintColor : tintColor,
            backgroundColor : backgroundColor,
            selectedBackgroundColor : selectedBackgroundColor,
            hideNowButton : hideNowButton,
            disableMotionEffects : disableMotionEffects,
            disableBouncingWhenShowing : disableBouncingWhenShowing,
            backgroundTapsDisabled : backgroundTapsDisabled
        };

        return dto;
    }
}
}
