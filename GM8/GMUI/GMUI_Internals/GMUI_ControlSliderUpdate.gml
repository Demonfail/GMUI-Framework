#define GMUI_ControlSliderUpdate
///GMUI_ControlSliderUpdate(Control ID)
///Updates the slider position according to its value (called when switching its value or initializing)

with (argument0) {
    if (!SliderVertical)
        SliderRelativeFinalXorY = (real(value)-ControlMinValue)*(RoomW-RoomX-SliderStartEndPadding*2)/(ControlMaxValue-ControlMinValue)+SliderStartEndPadding;
    else
        SliderRelativeFinalXorY = (real(value)-ControlMinValue)*(RoomH-RoomY-SliderStartEndPadding*2)/(ControlMaxValue-ControlMinValue)+SliderStartEndPadding;
    Slider_t = 0;
}

