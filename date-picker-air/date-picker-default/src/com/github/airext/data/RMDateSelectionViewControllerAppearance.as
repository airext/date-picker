/**
 * Created by mobitile on 9/20/14.
 */
package com.github.airext.data
{
public class RMDateSelectionViewControllerAppearance
{
    public function RMDateSelectionViewControllerAppearance()
    {
        super();
    }

    public var tintColor:Number;

    public var backgroundColor:Number;

    public var selectedBackgroundColor:Number;

    public var hideNowButton:Boolean;

    public var disableMotionEffects:Boolean;

    public var disableBouncingWhenShowing:Boolean;

    public var backgroundTapsDisabled:Boolean;

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
        }

        return dto;
    }
}
}
