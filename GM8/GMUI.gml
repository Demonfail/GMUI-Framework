#define _Test_Form
///_Test_Form() This interface is for the demo

// DEMO INTERFACE:

// Set optional grid settings
GMUI_GridSetNavigation(global.GMUIDirectionTypeVertical,vk_up,vk_down,vk_left,vk_right,true);

/*

    1. Create any groups and objects you like for each layer, defaulting to layer 0
    Note:   Controls have unique names across layers, 
            whereas group numbers are specific to the layer.
    
*/

// Set the layer to change settings on [This one is optional: Already defaults to layer 0]
GMUI_SetOnLayer(0);

// Right side group
GMUI_CreateGroup(1,      20,3,   global.GMUIAnchorTopRight);
GMUI_GroupSetSize(1,     18,4);
GMUI_GroupSetStyle(1, c_black, 0.2, c_black, 0.1, 0);

//GMUI_GroupSetSpriteMap(1, s2,s3,s4,s5,s6,s7,s8,s1,s9,false);

// Left side group
GMUI_CreateGroup(2,      2,3,    global.GMUIAnchorTopLeft);
GMUI_GroupSetFadeOnHide(2, room_speed/4, 0);

/*

    2. Create the controls, defaulting to layer 0 or the last layer created
    NOTE:   To switch layers, use GMUI_SwitchToLayer(#);

*/

with (GMUI_Add("Test1","textstring",            1,0,    16,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(20,0,0,0);
    GMUI_ControlSetInitValue("Select");
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetSprite(GMUIspr_input,0,1,0);
}

with (GMUI_Add("Test2", "textint",              0,0,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(5,0,-1000,1000);
    GMUI_ControlSetStyle(hsv(120,120,120),rgb(20,20,20),-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlAddToGroup(2);
}

with (GMUI_Add("Test3", "textdecimal",          0,3,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(10,10,-999,999);
    GMUI_ControlAddToGroup(2);
    //GMUI_ControlSetSpriteMap(s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
}

with (GMUI_Add("Test4", "intpicker",            0,6,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,-20,20);
    GMUI_ControlSetInitValue(-1);
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetHoverAction(_Hover_Int);
    GMUI_ControlSetHoverOffAction(_HoverOff_Int);
    //sprite_set_offset(GMUIspr_arrow,10,12);sprite_set_offset(GMUIspr_arrowup,10,0); // If vertical, offset should be centered
    //GMUI_ControlSetPicker(sprite_get_width(GMUIspr_arrowup) + 4,sprite_get_height(GMUIspr_arrowup) + 4,
    //    global.GMUIDirectionTypeVertical, GMUIspr_arrowup, GMUIspr_arrow);
        
    with (GMUI_ControlAddTooltip("-20 to 20.",global.GMUIAnchorLeft,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/4);
    }
}

with (GMUI_Add("TestButton", "textbutton",      3,9,    5,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Test_Button);
    GMUI_ControlSetButton("Test!", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
    GMUI_ControlAddToGroup(2);
}

with (GMUI_Add("PopupMenuButton", "textbutton",     1,7,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_PopupMenu_Button);
    GMUI_ControlSetButton("Show"+chr(13)+"Menu", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_purple, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("DebugButton", "textbutton",     1,3,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Debug_Button);
    GMUI_ControlSetButton("Debug", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_gray, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("DisableButton", "textbutton",   8,3,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Disable_Button);
    GMUI_ControlSetButton("Disable"+chr(13)+"Test",-1,-1,-1);
}

with (GMUI_Add("HideButton", "textbutton",      15,3,   5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Hide_Button);
    GMUI_ControlSetButton("Hide"+chr(13)+"Group",-1,-1,-1);
}

with (GMUI_Add("MoveButton", "textbutton",      22,3,   6,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1);
}

with (GMUI_Add("EnlargeButton", "textbutton",   30,3,   6,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Enlarge_Button);
    GMUI_ControlSetButton("Enlarge"+chr(13)+"Window",-1,-1,-1);
}

with (GMUI_Add("MoveButton2", "button",         18,0,   2,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("", GMUIspr_move, -1, -1);
    GMUI_ControlAddToGroup(1);
}

with (GMUI_Add("SwitchButton", "button",        -2,16,  4,2,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Switch_Button);
    GMUI_ControlSetSprite(GMUIspr_switch,0,1,0);
}

with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_Exit_Button);
    GMUI_ControlSetButton("x", -1, -1, -1);
    // (Example:) Minor adjustment so that the control isnt cut off by the room
    GMUI_ControlSetPositioning(-1,0,0,0);
    GMUI_ControlPersistentToLayer(1); // Test multi-layer
}



// Test slider
with (GMUI_Add("Slider", "slider",              16,12,  10,2,   global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeHorizontal);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
    
}
// Button to set slider to mid point
with (GMUI_Add("MidSlider", "button",           19,12,  2,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderMid_Button);
    GMUI_ControlSetButton("Mid",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}
// Button to set slider to snap or not
with (GMUI_Add("SnapSlider", "button",          23,12,  3,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderSnap_Button);
    GMUI_ControlSetButton("Snap",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}

// Display of slider value to the side
with (GMUI_Add("SliderVal", "label",            5,12,   2,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetText(string(round(GMUI_GetValue("Slider"))));
}

// Test checkbox and toggle
with (GMUI_Add("CheckBox", "checkbox",          4,12,   1,1,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetCheckboxSettings(1, c_lime, c_gray, global.GMUISlideRoundRect, $808080, $505050, room_speed/6);
    GMUI_ControlSetHoverAction(_Hover_Checkbox);
    GMUI_ControlSetHoverOffAction(_HoverOff_Checkbox);
    GMUI_ControlSetSprite(s10, 0, 0, 0);
    
    // Add a space at the end of the string to make sure it wraps. I know... but its Game Maker ;)
    with (GMUI_ControlAddTooltip("Checkbox!",global.GMUIAnchorBottom,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/6);
    }
}

with (GMUI_Add("Toggle", "toggle",              3,10,   3,2,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
}

with (GMUI_Add("SpritePicker", "spritepicker",  -10,10, 5,2,    global.GMUIAnchorBottom)) {
    GMUI_ControlAddOption(0, GMUIspr_arrowright);
    GMUI_ControlAddOption(2, GMUIspr_arrowup);
    GMUI_ControlAddOption(4, GMUIspr_arrowleft);
    GMUI_ControlAddOption(6, GMUIspr_arrow);
    GMUI_ControlSetPicker(sprite_get_width(GMUIspr_arrowleft) + 4,sprite_get_height(GMUIspr_arrowleft) + 4,
        global.GMUIDirectionTypeHorizontal, GMUIspr_arrowright, GMUIspr_arrowleft);
    GMUI_ControlSetInitValue(6);
}
// Example: overrides initial value:
GMUI_ControlSelectOption("SpritePicker",2);

//with (GMUI_Add("Graphic", "image",          -12,10, 2,2,    layer, global.GMUIAnchorBottom)) {
//    GMUI_ControlSetSpriteExt(s10, 0, 0, 0, 2, 2, c_white, 0.2);
//}


// Object click group test
/*

    NEW LAYER: 1 (Automatically switches setting layer to new layer

*/

GMUI_AddLayer(1,0,0);

GMUI_CreateGroup(3,          0,0,    global.GMUIAnchorTopLeft);


with (GMUI_Add("MenuInt", "intpicker",          0,0,    3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,0,9);
    GMUI_ControlSetInitValue(0);
    GMUI_ControlAddToGroup(3);
    GMUI_GroupHide(3,1,true);
}

// Switch back to make instructions on layer 0
GMUI_SetOnLayer(0);

with (GMUI_Add("MenuIntInstructions", "label",  20,21,  12,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetInitValue("Click square to open sub menu");
}


/*

    MENU EXAMPLES

*/


// Test Menu (Menu ID variable isn't used here... but could be if you want to)
var menuID; //-9,2 
menuID = GMUI_CreateMenu("Test Menu",   GMUI_CenterX(0, 18, global.GMUIAnchorTop) ,2,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu", true);
GMUI_MenuSetStyle("Test Menu", c_black, 0.25, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu", room_speed/4, 0);
GMUI_MenuSetHidePosition("Test Menu", -9, 6, easeExpOut, room_speed/2);
//GMUI_MenuSetActionIn("Test Menu",...)

with (GMUI_Add("CloseButton", "textbutton",   4,1,   4,1,    global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}

with (GMUI_Add("OpenButton", "textbutton",   -3,8,   8,1,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_PopupMenu2_Button);
    GMUI_ControlSetButton("Open Another",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}


// Test Menu 2
menuID = GMUI_CreateMenu("Test Menu 2",   -6,8,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu 2", true);
GMUI_MenuSetStyle("Test Menu 2", c_black, 0.25, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu 2", room_speed/4, 0);

with (GMUI_Add("CloseButton2", "textbutton",   4,1,   4,1,    global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

with (GMUI_Add("PopupTestButton","textbutton",  -3,8,   8,1,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Popup_Button);
    GMUI_ControlSetButton("Try Popup",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

with (GMUI_Add("ResponseLabel", "label", -8, 10, 16, 2, global.GMUIAnchorTop)) {
    // This value will be set by the popup
    GMUI_ControlSetFontStyle(fontNumeric,c_white,fa_center);
    GMUI_ControlAddToMenu("Test Menu 2");
}

// Test Popup
//global.GMUIPopupBlank = -1;global.GMUIPopupInformation = 0;global.GMUIPopupConfirm = 1;global.GMUIPopupThreeOptions = 2;
menuID = GMUI_CreatePopup("Test Popup",  -14,2,   28,12,   global.GMUIAnchorTop, global.GMUIPopupThreeOptions);
GMUI_PopupSetMessage("Test Popup", "Click an option to return to the previous screen!", 2, -1, -1);
GMUI_PopupSetAction("Test Popup", _PopupReturnAction);
GMUI_PopupSetStyle("Test Popup", c_white, 0.99, c_white, 0.75, true);
GMUI_PopupSetFadeOnHide("Test Popup", room_speed/8, 0);
GMUI_PopupSetHidePosition("Test Popup", -14, 0, easeExpOut, room_speed/4);
//todo: change the popup style

// Options to change default controls and actions:
// GMUI_PopupSetButton("Test Popup", which button, Text or "", graphic or -1, text align, text color on hover)

// Additional Options:
//with (GMUI_Add("Button", "textbutton", 20,3, 4,2, 0, global.GMUIAnchorBottomRight)) {
//GMUI_ControlAddToPopup("Test Popup");}
//GMUI_PopupSetClickOff("Test Popup", false); // False is default



#define _Debug_Button
// Show/hide debug for the first interface
if ((GMUIid(1)).DebugData)
    (GMUIid(1)).DebugData = false;
else
    (GMUIid(1)).DebugData = true;

#define _Disable_Button
GMUI_ControlDisable("TestButton",1-GMUI_ControlIsDisabled("TestButton"));

#define _Enlarge_Button
// Make window bigger

//show_message("Not implemented yet");

if (room == GMUIdemo)
    room_goto_next();

    GMUI_GridAdjust(ceil(room_width/(GMUII()).cellsize),ceil(room_height/(GMUII()).cellsize_h));

#define _Exit_Button
game_end();

#define _Hide_Button
GMUI_GroupHide(2, 0, 1-GMUI_ControlIsHidden("TestButton"));

#define _Hover_Checkbox

if (!GMUI_ControlIsHidden("CheckBox"))
    GMUI_ControlHideTooltip("CheckBox",false);


#define _Hover_Int

if (!GMUI_ControlIsHidden("Test4"))
    GMUI_ControlHideTooltip("Test4",false);


#define _HoverOff_Checkbox

GMUI_ControlHideTooltip("CheckBox",true);


#define _HoverOff_Int


GMUI_ControlHideTooltip("Test4",true);

#define _Move_Button
var MyButton,MyButtonText;

MyButton = GMUI_GetControl("MoveButton");

if (MyButton >= 0)
    MyButtonText = MyButton.ControlButtonText;
    
if (MyButtonText == "Move"+chr(13)+"Group") {
    with (MyButton) GMUI_ControlSetButton("Return"+chr(13)+"Group",-1,-1,-1);
    // Object is handling the group position here
    testmoving.moving = 1;
}
else {
    with (MyButton) GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1);
    testmoving.moving = 0;
    // Return the group to where it was
    GMUI_SetOnLayer(0);
    GMUI_GroupSetPosition(1,20,3,0,0);
}

#define _Popup_Button
// Actually show a popup

GMUI_ShowPopup("Test Popup",true,true);

#define _PopupClose_Button
//GMUI_ShowMenu("Test Menu",false,true);

GMUI_CloseMenu(true);

#define _PopupMenu_Button
GMUI_ShowMenu("Test Menu",true,true);

#define _PopupMenu2_Button
GMUI_ShowMenu("Test Menu 2",true,true);

#define _PopupReturnAction
// Show result
var str;

switch (GMUI_PopupGetResponse()) {
    case -1: str = "Cancel"; break;
    case 0: str = "No"; break;
    case 1: str = "Yes/Ok" break;
    default: str = "No response"; break;
}

with (GMUI_GetControl("ResponseLabel")) {
    GMUI_ControlSetText("Responded with: " + str);
}


#define _SliderMid_Button
var slider;
slider = GMUI_GetControl("Slider");

GMUI_SetValue("Slider",(slider.ControlMinValue+slider.ControlMaxValue)/2,2);

#define _SliderSnap_Button
var slider;
slider = GMUI_GetControl("Slider");

// FOR DEMO PURPOSES... MAINLY
slider.SliderSnap = 1 - slider.SliderSnap;

#define _SliderValue_Changed
GMUI_SetValue("SliderVal",string(round(GMUI_GetValue("Slider"))),global.GMUIDataTypeString);

#define _Switch_Button
//switch group positions

if (!global.Switched) {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),11,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, 2, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, anchoredRight, 3, easeElasticOut, 30);
    global.Switched = true;
}
else {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),20,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, anchoredRight, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, 2, 3, easeElasticOut, 30);
    global.Switched = false;
}

#define _Test_Button
// Demo Test Button action

// Get all the values and display them:
var t1,t2,t3,t4;
t1 = GMUI_GetValueString("Test1");
t2 = GMUI_GetValueString("Test2");
t3 = GMUI_GetValueString("Test3");
t4 = GMUI_GetValueString("Test4");
show_message("Result:
" + t1 + "
" + t2 + "
" + t3 + "
" + t4);

#define GMUI_SetControlDefaults
///GMUI_SetControlDefaults() Sets the default values for all controls if they are not specified in GMUI_Form

// ! NOTE ! These values must pass validation or else errors will occur!

// Set the default control styling (Background Color, Border color, Hover color, hover border/rect, hover alpha,
// overwrite color, overwrite alpha, select color, select alpha, 
// showcursor)
GMUI_ControlSetStyle(
    rgb(250,250,255),hsv(135,30,100),rgb(20,160,230),true,0.5,
    rgb(40,40,40),0.1,rgb(240,140,40),0.3,
    true
    );
    
// Default sprite options
GMUI_ControlSetSpriteExt(-1,0,0,0,1,1,c_white,1);
GMUI_ControlSetSpriteMap(-1,-1,-1,-1,-1,-1,-1,-1,-1,false);

// Default font style (font, font color, font align)
GMUI_ControlSetFontStyle(fontNumeric,rgb(42,42,42), fa_left);

// Set the default control attributes(id, Max string length/Whole number padding(KEEP @ 0!), max decimal (if applicable), Min value, Max value)
GMUI_ControlSetAttributes(0,0,0,999);

// Default group style can be set when called
ControlHasGroupStyle = false;



// Specific control initializations //

// Picker controls ( region width, region height, 
// direction type (see below), right/up sprite, left/down sprite )
GMUI_ControlSetPicker(
    sprite_get_width(GMUIspr_arrow) + 4,sprite_get_height(GMUIspr_arrow) + 4,
    global.GMUIDirectionTypeSideVertical,GMUIspr_arrowup,GMUIspr_arrow
    );
// Direction types: global.GMUIDirectionTypeHorizontal: 0, global.GMUIDirectionTypeVertical: 1, global.GMUIDirectionTypeSideVertical: 2


// Text Button control (Text or "", graphic in button or -1, button image sprite or -1, text alignment, hover color or -1)
GMUI_ControlSetButton("", -1, -1, -1);
    

#define GMUI_SetLayerDepths
///GMUI_SetLayerDepths() Creates a set of layers with their relative depth values from the GMUI default
// This is called by the Create script

layerDepth = depth;

// Each of the control layers are relative to this value, lowest layer on the bottom:
layerDepth_layers = layerDepth-1;

// If you really need more than 100 layers, you can change this (each layer may have tooltips or other objects):
layerDepth_maxLayers = 100;


// Display messages over all control layers (controls may have 3 depths per layer)
layerDepth_messages = layerDepth_layers - (layerDepth_maxLayers*3);

// Menus show over basic messages and windows
layerDepth_menus = layerDepth_messages - 1;

// Pop-ups show over menus, windows, messages, and layers (each menu may have tooltips or other objects)
// Warnings are for anything from menus to popups or anything


//remove these?
////layerDepth_popups = layerDepth_menus - 1;


////layerDepth_warnings = layerDepth_popups - 1;


#define GMUI_Settings
///GMUI_Settings(OptionalInterfaceArgument) Settings for GMUI - Do not delete! Modify to fit your preferences
///Called from the initialization of each GMUI interface. Argument can set specific settings depending on the interface.
// Don't change these values in runtime, only change them here.

// Required: Define the controls' object!
GMUI_controlobject = GMUI_control;

// Required: Snap the grid to the view position in the room
UIsnaptoview = true;
// Required: The view number to snap to
UIgridview = 0;

// Required: Surfaces are needed for listboxes and scrollable menus, but also draws the grid as a surface itself
UIEnableSurfaces = true;

// Required: Flexibility to add graphical effects settings to the controls: (currently unused)
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Initial depth (z-index) default value. Other objects will have depths relative to this
depth = -9999;

// Required: Other specific functionality settings that can be turned off if unwanted
GMUIRemoveExtraDecimalZeros = true;     // Trim extra zeroes in decimal-type controls
GMUIAllowDoubleSelect = true;           // If double selected, the control will overwrite the contents
GMUIEnableTabbing = true;               // Tab key will advance to the next control
GMUIEnableEnterKey = true;              // Enter key will deselect the control

// Required: Show a pop-up of the GMUI error message when it happens (default: false)
PopUpGMUIError = false;

// Required: Clear mouse actions when interacting with GMUI instances (default: false)
CaptureMouseEvents = false;


// Required: Allow setting debug data for testing
DebugData = false;



// Argument can be used optionally for different GMUI instances
var OptionalInterfaceName; OptionalInterfaceName = argument0;
switch (OptionalInterfaceName) {
    case _Test_Form:
        // Do Something
    break;
}




#define GMUI_DefaultActionCancel
// Set value of popup return to Cancel
(GMUII()).GMUI_menuResponse = -1;

GMUI_CloseMenu(true);

#define GMUI_DefaultActionNo
// Set value of popup return to No
(GMUII()).GMUI_menuResponse = 0;

GMUI_CloseMenu(true);

#define GMUI_DefaultActionOk
// Set value of popup return to Ok
(GMUII()).GMUI_menuResponse = 1;

GMUI_CloseMenu(true);

#define easeBounceOut
///easeBounceOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
/// Bounce Ease for moving controls smoothly

var t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (_t < ( 1 / 2.75 ) )
    return _c * (7.5625 *_t*_t) + _b;
else if (_t < ( 2 / 2.75 ) )
{
    _t -= (1.5/2.75);
    return _c * (7.5625 *_t*_t + .75 ) + _b;
}
else if (_t < ( 2.5 / 2.75 ) )
{
    _t -= (2.25/2.75);
    return _c * (7.5625 *_t*_t + .9375 ) + _b;
}
else
{
    _t -= (2.625/2.75);
    return _c * (7.5625 *_t*_t + .984375 ) + _b;
}

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeElasticOut
///easeElasticOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Elastic Ease for moving controls smoothly

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (_t == 1)
    return _b + _c;
    
_p = _d * .3;
_s = _p / 4;

return (_c * power( 2, -10 * _t ) * sin(((_t*_d)-_s) * (2*pi)/_p) + _c + _b );

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeExpIn
///easeExpIn(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Exponential Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return _c * power( 2, 10 * (_t/_d - 1) ) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeExpOut
///easeExpOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Exponential Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return _c * ( -power( 2, -10 * _t/_d ) + 1 ) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeInBack
///easeInBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Smooth overshot Ease for moving controls smoothly

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158;
_t = _t/_d;

return _c*(_t)*_t*((_s+1)*_t - _s) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeInOutBack
///easeInOutBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Smooth overshot Ease for moving controls smoothly

var _t,_tt,_b,_c,_d, _p;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158 * 1.525;
_t = _t/(_d/2);

if (_t < 1)
    return _c/2*((_t)*_t*((_s+1)*_t - _s)) + _b;

_t -= 2;
return _c/2*(_t*_t*((_s+1)*_t + _s) + 2) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeInOutSine
///easeInOutSine(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Sinusoidal Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return (-_c)/2 * (cos(pi*_t/_d) - 1) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define easeOutBack
///easeOutBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Smooth overshot Ease for moving controls smoothly

var _t,_tt,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158;
_t = _t/_d-1;

return _c*((_t)*_t*((_s+1)*_t + _s) + 1) + _b;

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

#define ease_CopyrightNotice
// This notice pertains to the scripts that start with "ease".
// The scripts used were modified to effectively work with Game Maker by Mark Palnau.
/*
 *
 * TERMS OF USE - EASING EQUATIONS
 * 
 * Open source under the BSD License. 
 * 
 * Copyright � 2001 Robert Penner
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
 */

#define GMUI_ControlSetFade
///GMUI_ControlSetFade("Control Name", Time, In (1) / Out (0) / Hover (2) )
///
/// will be moved to internals when done

#define GMUI_ControlSetFadeHover
///GMUI_ControlSetFadeHover("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,2);

#define GMUI_ControlSetFadeIn
///GMUI_ControlSetFadeIn("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,1);

#define GMUI_ControlSetFadeOut
///GMUI_ControlSetFadeOut("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,0);

#define GMUI_ControlTransitionStop
///GMUI_ControlTransitionStop()



#define GMUI_ControlTransitionToCell
///GMUI_ControlTransitionToCell("ControlName",Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument1);
_ActualY = GMUI_CellGetActualY(argument2);

GMUI_ControlTransitionToActual(argument0,_ActualX,_ActualY,argument3,argument4);

#define GMUI_ControlTransitionToActual
///GMUI_ControlTranstionToActual("ControlName",Grid X, Grid Y, Transition Script, Time)
///

var _ctrl, _GridX, _GridY;
_GridX = argument1;
_GridY = argument2;

// Retrieve _ctrl from the reference map
_ctrl = ds_map_find_value((GMUII()).GMUI_map,string(argument0));
if (string(_ctrl) == "0")
    return false;
    
// Check that the transition script is valid
if (!GMUI_IsScript(argument3))
    return false;

// Calculate coordinates and set the room positions and start transition
(_ctrl).T_t = 0;
(_ctrl).T_d = argument4;

(_ctrl).T_bx = (_ctrl).ActualX;
(_ctrl).T_by = (_ctrl).ActualY;

(_ctrl).T_cx = _GridX - (_ctrl).ActualX;
(_ctrl).T_cy = _GridY - (_ctrl).ActualY;

(_ctrl).TransitionScript = argument3;
(_ctrl).Transitioning = true;


#define GMUI_GroupTransitionStop
///GMUI_GroupTransitionStop(Layer Number, Group Number)



#define GMUI_GroupTransitionToCell
///GMUI_GroupTransitionToCell(Layer Number, Group Id, Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument2);
_ActualY = GMUI_CellGetActualY(argument3);

GMUI_GroupTransitionToActual(argument0, argument1,_ActualX,_ActualY,argument4,argument5);

#define GMUI_GroupTransitionToActual
///GMUI_GroupTransitionToActual(Layer Number, Group Id, Grid X, Grid Y, Transition Script, Time)
///

var _SCRIPT, _ctrl, _iid, _LayerNumber,  _GridX, _GridY;
_SCRIPT = GMUI_GroupTransitionToActual;
_iid = GMUII();
_LayerNumber = argument0;
_GroupNumber = argument1;
_GridX = argument2;
_GridY = argument3;

// Check that the transition script is valid
if (!GMUI_IsScript(argument4))
    return false;
    
(_iid).GMUI_groupTransitioning[_LayerNumber,_GroupNumber] = true;

// Call transition on all controls
var i,_relX,_relY,groupWidth,groupHeight,_setMaster;
groupWidth = (_iid).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
groupHeight = (_iid).GMUI_groupCellsH[_LayerNumber,_GroupNumber];

_setMaster = false;
for(i=0;i<ds_list_size((_iid).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    _ctrl = ds_list_find_value((_iid).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(_ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        _relX = (_ctrl).ActualX - (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
        _relY = (_ctrl).ActualY - (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
        // The master control will handle the group transition itself
        if (!_setMaster) {
            (_ctrl).T_bx_group = (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
            (_ctrl).T_by_group = (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
            (_ctrl).T_cx_group = _GridX - (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
            (_ctrl).T_cy_group = _GridY - (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
            (_ctrl).T_dx_group = _GridX;
            (_ctrl).T_dy_group = _GridY;
            
            (_iid).GMUI_groupTransitioningControl[_LayerNumber,_GroupNumber] = _ctrl;
            _setMaster = true;
        }
        
        (_ctrl).TransitioningGroup = true;
        
        GMUI_ControlTransitionToActual((_ctrl).valueName,_GridX+_relX,_GridY+_relY,argument4,argument5);
    }
    
}

// If no controls, the transition won't work.... for now?
if (!_setMaster) {
    GMUI_ThrowErrorDetailed("No Controls to move! (" + string(_LayerNumber) + "," + string(_GroupNumber) + ")", _SCRIPT);
    return false;
}

(_iid).GMUI_groupTransitioning[_LayerNumber,_GroupNumber] = true;

return true;



#define GMUI_LayerTransitionToXY
///GMUI_LayerTransitionToXY(Layer number, Room X, Room Y, Transition Script, Time)

var _Layer; _Layer = argument0;

if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Layer doesn't exist!", GMUI_LayerTransitionToXY);
    return false;
}

if (!GMUI_IsScript(argument3)) {
    GMUI_ThrowErrorDetailed("Script not found", GMUI_LayerTransitionToXY);
    return false;
}

with (GMUII()) {
    GMUI_grid_Transitioning[_Layer] = true;
    GMUI_grid_T_script[_Layer] = argument3;
    
    GMUI_grid_T_t[_Layer] = 0;
    
    if (argument4 > 0)
        GMUI_grid_T_d[_Layer] = argument4;
    else
        GMUI_grid_T_d[_Layer] = room_speed;
    
    GMUI_grid_T_bx[_Layer] = GMUI_grid_x[_Layer];
    GMUI_grid_T_by[_Layer] = GMUI_grid_x[_Layer];
    GMUI_grid_T_cx[_Layer] = argument1 - GMUI_grid_x[_Layer];
    GMUI_grid_T_cy[_Layer] = argument2 - GMUI_grid_y[_Layer];
    
    // Signal to instance that a layer is transitioning...
    GMUI_grid_Transition = true;
}

return true;

#define hsv
///hsv(hue, saturation, value) Shortcut for making an hsv based color
return make_color_hsv(argument0,argument1,argument2);


#define rgb
///rgb(red, green, blue) Shortcut for making a rgb based color
return make_color_rgb(argument0,argument1,argument2);


#define color_alpha
///color_alpha(color, alpha) Shortcut to set the color and alpha in one call
draw_set_color(argument0);
draw_set_alpha(argument1);

#define align
///align(left align, right align) Shortcut to set both horizontal and vertical align in one call
draw_set_halign(argument0);
draw_set_valign(argument1);

#define minmax
///minmax(original value, minimum value, maximum value) Shortcut to keep the value within the min & max range given
if (is_real(argument0))
    return min(max(argument0,argument1),argument2);
else
    return argument1;

#define surface_target
///surface_target(surface, width if created, height if created)
///Sets the target to the surface or creates it if it doesn't exist

var _Surface;

if (surface_exists(argument0)) {
    surface_set_target(argument0);
    _Surface = argument0;
}
else {
    _Surface = surface_create(argument1,argument2);
    surface_set_target(_Surface);
}

return _Surface;

#define GMUI_Add
///GMUI_Add("Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), Anchor)
///Adds a component(instance) to the GMUI grid at the current layer

return GMUI_AddToLayer((GMUII()).UIAddToLayer,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMUI_AddLayer
///GMUI_AddLayer(Layer Number,x offset, y offset)
/// Adds a new grid layer to GMUI for controls to exist on
// returns false on failure (bad params)

var _Layer;
_Layer = floor(argument0);

if (!is_real(argument1))
    return false;
if (!is_real(argument2))
    return false;
    
if (GMUI_LayerExists(_Layer))
    return false;
    
UIAddToLayer = _Layer;

// If the layer doesn't exist, add it to the list and create it
ds_list_add((GMUII()).GMUI_gridlist,_Layer);

// Add a group list to the layer in case its used
(GMUII()).GMUI_groupList[_Layer] = ds_list_create();
(GMUII()).GMUI_groupControlList[_Layer,0] = ds_list_create();

//Default
(GMUII()).GMUI_grid_w[_Layer] = ceil((GMUII()).UIgridwidth/(GMUII()).cellsize);
(GMUII()).GMUI_grid_h[_Layer] = ceil((GMUII()).UIgridheight/(GMUII()).cellsize_h);

// Assign
(GMUII()).GMUI_grid[_Layer] = ds_grid_create((GMUII()).GMUI_grid_w[_Layer],(GMUII()).GMUI_grid_h[_Layer]);
(GMUII()).GMUI_grid_x[_Layer] = argument1;
(GMUII()).GMUI_grid_y[_Layer] = argument2;

// Value to check if transitioning (The rest of the values are defined when called: GMUI_LayerTransitionToActual)
(GMUII()).GMUI_grid_Transitioning[_Layer] = false;

// If using surfaces, the draw update flag is set on the layer level
if ((GMUII()).UIEnableSurfaces) {
    (GMUII()).GMUI_gridSurface[_Layer] = noone;
    (GMUII()).GMUI_gridNeedsDrawUpdate[_Layer] = 1;
}


if ((GMUII()).UILayerTop < _Layer)
    (GMUII()).UILayerTop = _Layer;

return true;

#define GMUI_AddToLayer
///GMUI_AddToLayer(Layer, "Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), Anchor)
///Adds a component(instance) to the GMUI grid on the given layer

var _SCRIPT,_Layer,_Anchor,_CellX,_CellY,_CellWide,_CellHigh;
_SCRIPT = GMUI_AddToLayer;
_Layer = argument0;
_Anchor = argument7;
_CellX = argument3;
_CellY = argument4;
_CellWide = argument5;
_CellHigh = argument6;

// Check that the layer exists first
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("The layer does not exist for " + string(argument1),_SCRIPT);
    return -1;
}


// Check grid positioning first and assign after created
var gridW, gridH;
// Get the dimensions and round down for grids that have even grid sizes
gridW = GMUI_GridGetWidth(GMUII(),_Layer);
gridH = GMUI_GridGetHeight(GMUII(),_Layer);

//if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,gridW,gridH)) {
//    GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0) + " (" + string(argument1) + "," + string(_CellX) + ",...",_SCRIPT);
//    return -1;
//}

// Check that it hasn't already been created
if (ds_map_exists((GMUII()).GMUI_map,argument1)) {
    GMUI_ThrowErrorDetailed("The control name has already been defined for '" + string(argument1) + "'",_SCRIPT);
    show_error(GMUI_LastError(),false);
    return -1;
}


// Check for type and either reference provided instance or create a new one. MUST BE A VALID TYPE
var thetype,thecontrol;
if (is_string(argument2)) {  
    thecontrol = instance_create(0,0,(GMUII()).GMUI_controlobject); // Default is: GMUI_control , set in GMUI_Settings(...)
}
else {
    thecontrol = instance_create(0,0,argument2);
}

// Well... this problem should never happen.. in theory
if (!instance_exists(thecontrol))
    return -1;
else
    GMUI_ControlInit(thecontrol);
    
// Assign the grid instance to the control and layer and group
thecontrol.GMUIP = GMUII();
thecontrol.Layer = _Layer;
thecontrol.Group = 0;

// Add control to control list for reference
ds_list_add((GMUII()).GMUI_controlList,thecontrol);

// First the control type vars must be set
thetype = GMUI_ControlSetType(thecontrol,string(argument2));

// Then set the relative and actual position, and Anchor and IsAdjusted status
GMUI_ControlPosition(thecontrol,_CellX,_CellY,0,0,_Anchor);

thecontrol.valueName = argument1;
thecontrol.CellWide = _CellWide;
thecontrol.CellHigh = _CellHigh;
thecontrol.CellWideMax = gridW-_CellX;//_CellWide;
thecontrol.CellHighMax = gridH-_CellY;//_CellHigh;
thecontrol.depth = (GMUII()).layerDepth_layers-(_Layer*3)-(thetype=="tooltip");
thecontrol.persistent = (GMUII()).persistence; // This is kind of unnecessary but could be used at some point?

// Specific setup for particular types
if (thecontrol.ControlIsString) {
    thecontrol.value = "";
    thecontrol.valueString = "";
}

// Map the name to the instance
ds_map_add((GMUII()).GMUI_map,argument1,thecontrol);


// SET ALL DEFAULTS (set from the gmui controller):

// Set the default style properties
GMUI_ControlSetDefaultStyle(thecontrol);

// Set the default optional sprite override vars
GMUI_ControlSetDefaultSprite(thecontrol);

// Set the default optional flexible sprite map properties
GMUI_ControlSetDefaultSpriteMap(thecontrol);

// Set the default picker properties
GMUI_ControlSetDefaultPicker(thecontrol);
thecontrol.ControlFontAlign = fa_left; // Reset font align, just in case it was changed from the picker

// Set the default font style properties
GMUI_ControlSetDefaultFontStyle(thecontrol);

// Set the default attribute properies
GMUI_ControlSetDefaultAttributes(thecontrol);

// Set the default button properties
GMUI_ControlSetDefaultButton(thecontrol);

// The control has group style if it is the master control of the group
thecontrol.ControlHasGroupStyle = false;

// Override defaults for specific controls (Avoid defaults conflicts):

// Button style override
if (GMUI_GetDataType(thetype) == global.GMUIDataTypeButton) {
    thecontrol.ControlFontAlign = fa_center;
    thecontrol.ControlShowCursor = false;
}

// String length settings
if (GMUI_GetDataType(thetype) == global.GMUIDataTypeString) {
    thecontrol.ControlMaxStringLength = 1024;
}


return thecontrol;




#define GMUI_AddTooltipToControl
///GMUI_AddTooltipToControl(Control id, "message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, adjustment x [or -1], adjustment y [or -1])
///Adds a tooltip to the specified control

var _SCRIPT, _message, _direction, _adjX, _adjY, _relX, _relY, _cellX, _cellY, _newCtrl, _isVertical,
    _width, _height, _newwidth, _newheight, _actwidth, _actheight, _maxwidth, _maxheight, gcellsize, gcellsize_h;
_SCRIPT = GMUI_AddTooltipToControl;
_ctrl = argument0;
_message = argument1;
_direction = argument2;
_width = argument3;
_height = argument4;
_maxwidth = argument5;
_maxheight = argument6;
_adjX = max(0,argument7);
_adjY = max(0,argument8);

// Must be control
if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return -1;
}
// Must have real coordinates
if (!is_real(_adjX) || !is_real(_adjY)) {
    GMUI_ThrowErrorDetailed("Invalid coordinates",_SCRIPT);
    return -1;
}

if (_direction < 0 || _direction > 8) {
    GMUI_ThrowErrorDetailed("Invalid direction",_SCRIPT);
    return -1;
}

// Adjust sizing based on text given
draw_set_font(((_ctrl).GMUIP).ControlFont);
gcellsize = ((_ctrl).GMUIP).cellsize;
gcellsize_h = ((_ctrl).GMUIP).cellsize_h;

// Max must be at least the set size
_maxwidth = gcellsize*max(_maxwidth,_width);
_maxheight = gcellsize_h*max(_maxheight,_height);

// Compare string to the max (seems to not work so we'll just compare sizes anyway)
_actwidth = string_width_ext(_message,-1,_maxwidth);
_actheight = string_height_ext(_message,-1,_maxheight);

// Snap to the string width, unless it hits the max
if (_maxwidth > 0)
    _newwidth = ceil(min(_actwidth,_maxwidth)/gcellsize);
else {
    _newwidth = ceil(_actwidth/gcellsize);
    _maxwidth = _actwidth;
}
// Only enforce max if both max values are not set
if (_maxheight > 0 && _maxwidth <= 0)
    _newheight = floor(min(_actheight,_maxheight)/gcellsize_h);
else {
    _newheight = floor(_actheight/gcellsize_h);
    _maxheight = _actheight;   
}

_isVertical = false;

// Create the control to store the tooltip, creating it in an adjacent cell
if (_direction == global.GMUIAnchorBottom) {
    _relX = ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _relY = 0 - abs(_newheight) - 1;
    _isVertical = true;
}
else if (_direction == global.GMUIAnchorTop) {
    _relX = ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _relY = (_ctrl).CellHigh + 1;
    _isVertical = true;
}
else if (_direction == global.GMUIAnchorRight || _direction == global.GMUIAnchorTopRight || _direction == global.GMUIAnchorBottomRight) {
    _relX = 0 - abs(_newwidth) - 1;
    _relY = floor((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
else {// Left anchored (right side)
    _relX = (_ctrl).CellWide + 1;
    _relY = floor((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
_cellX = (_ctrl).CellX + _relX;
_cellY = (_ctrl).CellY + _relY;

// Add new control based on top-left position (updated on GMUI_ControlUpdateXY)
// Use GMUII to temporarily set the adding layer, then revert after
newCtrl = GMUI_AddToLayer((_ctrl).Layer,(_ctrl).valueName + "_tooltip","tooltip",_cellX,_cellY, _newwidth,_newheight,global.GMUIAnchorTopLeft);

with (newCtrl) {
    valueString = _message;
    Hidden = true;
    FadeAlpha = 0;
    FadeIn = max(ControlBackgroundAlpha,ControlHoverAlpha,ControlSelectAlpha,ControlOverwriteAlpha,ControlFontAlpha);
    
    // Set positioning to given relative amount and fit width to content
    GMUI_ControlSetPositioning(_adjX,_adjY,_actwidth,0);

    // Assign tooltip settings to control...
    TT_minx = _width;
    TT_miny = _height;
    TT_maxx = ceil(_maxwidth/gcellsize);
    TT_maxy = ceil(_maxheight/gcellsize_h);
    
    // Adjustable later?
    TT_arrowsize = 8;
    TT_yposition = gcellsize_h;
    if (_isVertical) {
        TT_xposition = floor(abs(_width)/2)*gcellsize - (gcellsize/2);
        TT_yposition -= 2;
    }
    else
        TT_xposition = gcellsize/2;
        
    
    TT_direction = _direction;
}

// Store position relative to the parent control
(newCtrl).TT_relativeCellX = _relX;
(newCtrl).TT_relativeCellY = _relY;

// Parent control stores the id
(_ctrl).TooltipId = newCtrl;

return newCtrl;


#define GMUI_CenterX
///GMUI_CenterX(Layer, Control Width Cells #, Anchor)
///Get X Cell of Anchor for centering on layer

var _Layer, _CellsWide, _Anchor, _CenterCell, _HalfWidth, _LayerWidth;
_Layer = argument0;
_CellsWide = argument1;
_Anchor = argument2;

_LayerWidth = GMUI_GridGetWidth(GMUII(),_Layer);

// Find middle of layer
_CenterCell = GMUI_GetAnchoredCellX(_LayerWidth, 0 ,global.GMUIAnchorTop)

// subtract half width from it and adjust relative if necessary
_HalfWidth = floor(_CellsWide / 2 + 0.5);


if (_Anchor == global.GMUIAnchorTop || _Anchor == global.GMUIAnchorBottom) {
    // Half-width accounts for the cell 0 added to the width.
    // (On even widths, 0 is left of the middle and 1 is right of the middle)
    return 0 - _HalfWidth;
}
else if (_Anchor == global.GMUIAnchorTopRight || _Anchor == global.GMUIAnchorRight || _Anchor == global.GMUIAnchorBottomRight)
    return _LayerWidth - _CenterCell + _HalfWidth - 1;
else
    return _CenterCell - _HalfWidth;

#define GMUI_CenterY
///GMUI_CenterY(Layer, Control Height Cells #, Anchor)
///Get X Cell of Anchor for centering on layer

var _Layer, _CellsWide, _Anchor, _CenterCell, _HalfHeight, _LayerHeight;
_Layer = argument0;
_CellsHigh = argument1;
_Anchor = argument2;

_LayerHeight = GMUI_GridGetHeight(GMUII(),_Layer);

// Find middle of layer
_CenterCell = GMUI_GetAnchoredCellY(_LayerHeight, 0 ,global.GMUIAnchorLeft)

// subtract half width from it and adjust relative if necessary
_HalfHeight = floor(_CellsHigh / 2 + 0.5);


// The Mid Y's else the Bottom Y's
if (_Anchor == global.GMUIAnchorLeft || _Anchor == global.GMUIAnchorRight) {
    // Half-height accounts for the cell 0 added to the height.
    // (On even height, 0 is top of the middle and 1 is bottom of the middle)
    return 0 - _HalfHeight;
}
else if (_Anchor == global.GMUIAnchorBottomLeft || _Anchor == global.GMUIAnchorBottom || _Anchor == global.GMUIAnchorBottomRight)
    return _LayerHeight - _CenterCell + _HalfHeight - 1;
else
    return _CenterCell - _HalfHeight;

#define GMUI_CloseMenu
///GMUI_CloseMenu(animate [bool])
///Close the current open menu

// Arguments
var _animate;
_animate = (argument0 > 0);

if ((GMUII()).GMUI_menuCurrent == 0)
    return false;
    

return GMUI_ShowMenuId((GMUII()).GMUI_menuCurrent,false,_animate);

#define GMUI_ControlFadeOut
///GMUI_ControlFadeOut("ControlName", speed in steps)
///Fade out a control

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        // Call fade down
        (_ctrl).FadeCalled = -1;
        (_ctrl).FadeTime = argument1;
        return true;
    }
}

#define GMUI_ControlAddOption
///GMUI_ControlAddOption(OptionKeyValue, OptionText/Sprite)
///Adds an option to the picker control

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlAddOption);
    return false;
}

// Initialize mapping if not yet set
if (!optionsInitialized) {
    OptionsMap = ds_map_create();
    OptionsMin = 0;
    OptionsMax = 0;
    OptionsFirst = argument0;
    OptionsLast = argument0;
    
    optionsInitialized = true;    
}

if (ControlType == "spritepicker" && !sprite_exists(argument1)) {
    GMUI_ThrowErrorDetailed("Sprite does not exist!", GMUI_ControlAddOption);
    return false;
}

if (is_real(argument0)) {
    if (!ds_map_exists(OptionsMap,argument0)) {
    
        ds_map_add(OptionsMap, argument0, argument1);
        
        // Need to double check this for GM:Studio
        OptionsFirst = ds_map_find_first(OptionsMap);
        OptionsLast = ds_map_find_last(OptionsMap);
        
        if (argument0 < OptionsMin)
            OptionsMin = argument0;
        else if (argument0 > OptionsMax)
            OptionsMax = argument0;
            
        return true;
    }
    else {
        GMUI_ThrowErrorDetailed("Key " + string(argument0) + " already exists", GMUI_ControlAddOption);
        return false;
    }
}

#define GMUI_ControlAddToGroup
///GMUI_ControlAddToGroup(group number)
///Adds control to a group if it exists in the layer

var SCRIPT, _Group, _Layer;
SCRIPT = GMUI_ControlAddToGroup;
_Group = argument0;

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowErrorDetailed("Invalid control",SCRIPT);
    return false;
}

// Validate
if (!is_real(_Group)) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
if (_Group <= 0) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
    
// Control must have a layer that exists (should always be the case)
// Layer value exists in the control
_Layer = Layer;
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Control in layer that doesn't exist: " + string(id),SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowErrorDetailed("Group "+string(_Group)+" doesn't exist for adding control: " + string(id),SCRIPT);
    return false;
}


// Add control to group's control list and assign to control
ds_list_add((GMUII()).GMUI_groupControlList[_Layer,_Group],id);
Group = _Group;

// The master control will handle drawing and transitioning of the group
if ((GMUIP).GMUI_groupMasterControl[_Layer,_Group] == -1 || (GMUIP).GMUI_groupMasterControl[_Layer,_Group] > id) {
    (GMUIP).GMUI_groupMasterControl[_Layer,_Group] = id;
}

GMUI_ControlPositionToGroup(id);


return true;
    
    

#define GMUI_ControlAddToMenu
///GMUI_ControlAddToMenu("menu name")
///Adds control to a group if it exists in the layer

var SCRIPT, _menuName;
SCRIPT = GMUI_ControlAddToMenu;
_menuName = string(argument0);

return GMUI_ControlAddToMenuType(SCRIPT,_menuName);
    

#define GMUI_ControlAddToPopup
///GMUI_ControlAddToPopup("popup name")
///Adds control to a group if it exists in the layer

var SCRIPT, _menuName;
SCRIPT = GMUI_ControlAddToPopup;
_menuName = string(argument0);

return GMUI_ControlAddToMenuType(SCRIPT,_menuName);
    

#define GMUI_ControlAddTooltip
///GMUI_ControlAddTooltip("message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, relative x [or -1], relative y [or -1])
///Adds a tooltip to the control

return GMUI_AddTooltipToControl(id,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);



#define GMUI_ControlCenterX
///GMUI_ControlCenterX("control name" or id)
///Centers the control in its layer horizontally

var _NameOrId, _Control;
_NameOrId = argument0;

// Retrieve control from the reference map
if (is_string(_NameOrId))
    _Control = ds_map_find_value((GMUII()).GMUI_map,_NameOrId);
else
    _Control = _NameOrId;
    
if (string(_Control) == "0") {
    GMUI_ThrowErrorDetailed("Control not found: " + string(_NameOrId), GMUI_ControlCenterX);
    return false;
}
else {
    // Center if control exists
    GMUI_ControlPosition((_Control).valueName,
        GMUI_CenterX((_Control).Layer, (_Control).CellWide, (_Control).Anchor),
        (_Control).RelativeCellY, (_Control).RelativeX, (_Control).RelativeY, (_Control).Anchor);
        
    if (((_Control).GMUIP).InitialDisable <= 0)
        GMUI_GridSetRegionsLayer((_Control).Layer);
        
    return true;
}

#define GMUI_ControlCenterY
///GMUI_ControlCenterY("control name" or id)
///Centers the control in its layer vertically

var _NameOrId, _Control;
_NameOrId = argument0;

// Retrieve control from the reference map
if (is_string(_NameOrId))
    _Control = ds_map_find_value((GMUII()).GMUI_map,_NameOrId);
else
    _Control = _NameOrId;
    
if (string(_Control) == "0") {
    GMUI_ThrowErrorDetailed("Control not found: " + string(_NameOrId), GMUI_ControlCenterY);
    return false;
}
else {
    // Center if control exists
    GMUI_ControlPosition((_Control).valueName, (_Control).RelativeCellX,
        GMUI_CenterY((_Control).Layer, (_Control).CellHigh, (_Control).Anchor),
        (_Control).RelativeX, (_Control).RelativeY, (_Control).Anchor);
        
    if (((_Control).GMUIP).InitialDisable <= 0)
        GMUI_GridSetRegionsLayer((_Control).Layer);
        
    return true;
}

#define GMUI_ControlDisable
///GMUI_ControlDisable("ControlName", Disable?)
///Disable or enable a control
// argument1 is to disable (1) or enable (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,string(argument0));
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        (_ctrl).Disabled = argument1;
        return true;
    }
}

#define GMUI_ControlDraw
///GMUI_ControlDraw(Draw the control [bool])
/// The actions done per step for a control added to the grid, along with drawing things

// STEP actions:

// Run transition action
if (Transitioning) {
    if (GMUI_IsScript(TransitionScript)) {
        if (Hovering)
            Hovering = false;
        if (TooltipId != -1)
            GMUI_ControlHide(TooltipId,1);
            
        if (T_t < T_d) {
            T_t += 1;
            ActualX = script_execute(TransitionScript,T_t,T_bx,T_cx,T_d);
            ActualY = script_execute(TransitionScript,T_t,T_by,T_cy,T_d);
            
            if (TransitioningGroup && (GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                (GMUIP).GMUI_groupActualX[Layer,Group] = script_execute(TransitionScript,T_t,T_bx_group,T_cx_group,T_d);
                (GMUIP).GMUI_groupActualY[Layer,Group] = script_execute(TransitionScript,T_t,T_by_group,T_cy_group,T_d);
            }
        }
        else {
            T_t = T_d;
            Transitioning = false;
            
            if (TransitioningGroup) {
                if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                    var _getGroupX,_getGroupY,_diffX,_diffY, _origRelCellX, _origRelCellY;
                    _diffX = (GMUIP).GMUI_groupActualX[Layer,Group]-GMUI_CellGetActualX(GMUI_GridGetCellXRoom(GMUIP,Layer,T_dx_group));
                    _diffY = (GMUIP).GMUI_groupActualY[Layer,Group]-GMUI_CellGetActualY(GMUI_GridGetCellYRoom(GMUIP,Layer,T_dy_group));
                    
                    // This part uses a left anchor temporarily
                    _getGroupX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]),global.GMUIAnchorDefault);
                    _getGroupY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]),global.GMUIAnchorDefault);
                    
                    _origRelCellX = (GMUIP).GMUI_groupRelativeCellX[Layer,Group];
                    _origRelCellY = (GMUIP).GMUI_groupRelativeCellY[Layer,Group];
                    
                    GMUI_GroupSetPositionAnchored(Layer,Group,_getGroupX,_getGroupY,
                        _diffX,_diffY,
                        global.GMUIAnchorDefault);
                    
                    // Reassigning original relative-to-anchor coordinates
                    (GMUIP).GMUI_groupRelativeCellX[Layer,Group] = _origRelCellX;
                    (GMUIP).GMUI_groupRelativeCellY[Layer,Group] = _origRelCellY;
                        
                    TransitioningGroup = false;
                }
            }
            else {
                CellX = GMUI_GridGetCellX(GMUIP,Layer,ActualX);
                CellY = GMUI_GridGetCellY(GMUIP,Layer,ActualY);
                
                GMUI_ControlSetPositioning(CellX*(GMUIP).cellsize,CellY*(GMUIP).cellsize_h,ActualW,ActualH);
            }            
        }
       
        // Update control draw location in the room
        NeedsPositionUpdate = true;
    }
    else {
        Transitioning = false;
    }
}

// Run fade in/out action
if (FadeCalled != 0) {
    // Fade in, else, fade out
    if (FadeCalled > 0) {
        if (FadeAlpha < FadeIn) {
            FadeAlpha += 1/FadeTime;
        }
        else {
            FadeAlpha = FadeIn;
            FadeCalled = 0;
        }
    }
    else {
        if (FadeAlpha > FadeOut) {
            FadeAlpha -= 1/FadeTime;
        }
        else {
            FadeAlpha = FadeOut;
            FadeCalled = 0;
        }
    }
    NeedsDrawUpdate = true;
}

// Set new position if the view offset has changed, or transitioning
if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    GMUI_GridUpdateLayer(GMUIP,Layer); //test, currently unused
}



// PROCESS INPUT //
// Don't process any input or drawing if hidden
if (!Hidden) {
    // Easing update if slider control
    if (ControlType == "slider") {
        if (HoldingTime == 1) {
            GMUI_ControlSliderMove(true);
        }
        else if (Slider_t < Slider_d && sliderComputed) {
            GMUI_ControlSliderMove(false);
            
            if (!SliderSmoothSnap)
                Slider_t = Slider_d;
        }
    }
    else if (ControlType == "toggle" || ControlType == "checkbox") {
        // Fade or Slide update if checkbox/toggle control
        if (Toggle_t < Toggle_d) {
            Toggle_t += 1;
            GMUI_GridUpdateLayer(GMUIP,Layer);
            if (string(value) == "0")
                ToggleRelativeXorY = ToggleDistance - (Toggle_c * Toggle_t);
            else if (string(value) == "1")
                ToggleRelativeXorY = Toggle_c * Toggle_t;
        }
    }
    if (Selected) {
        // Holding click event
        if (mouse_check_button(mb_left)) {
            HoldingTime += 1;            
            if (!Holding && HoldingTime > HoldingThreshold)
                Holding = true;
        }
        if (Holding) {
            if (mouse_check_button_released(mb_left)) {
                Holding = false;
                HoldingTime = 0;
            }
            else if (ControlType == "slider") {
                // Special case for slider: Holding will move the thumb
                GMUI_ControlSliderMove(true);
            }
        }
        
    
        // Filter keyboard string to type of input allowed
        if (ControlInput && (keyboard_lastkey > 20 || keyboard_lastkey == vk_backspace)) {
            if (keyboard_check(vk_anykey)) {
                //If 'Overwriting', then reset back to just selected
                if (DoubleSelected) {
                    if (string_length(keyboard_string) > 0 && string_length(GMUI_ControlFilterInput(ControlType,keyboard_lastchar)) > 0)
                        keyboard_string = string_copy(keyboard_string,string_length(keyboard_string),1);
                    else
                        keyboard_string = "";
                        
                    DoubleSelected = false;
                }
                else {
                    // On keypress, sanitize input per the type
                    keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
                    
                    // Max characters allowed for the control's string
                    if (ControlMaxStringLength > 0)
                        keyboard_string = string_copy(keyboard_string,1,ControlMaxStringLength);
                }
            }
            
            // Only does assignment of the value once the key is released (and not transitioning)
            if (Transitioning) {
                keyboard_string = valueString;
            }
            else if (keyboard_check_released(vk_anykey)) {
                // On release, we need to filter again incase somebody "fat-fingers" multiple keys fast enough to miss the first filter.. interesting.
                keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
                
                // Assign keyboard string as the value string
                valueString = keyboard_string;
                
                if (ControlIsNumeric) {
                    // As long as the string is valid, assign stripped zeros to value string, and then assign value
                    if (valueString != "." && valueString != "-") {
                        valueString = keyboard_string;
                        value = real(valueString);
                        if (ControlDataType == global.GMUIDataTypeInteger) {
                            value = round(value);
                        }
                        
                        // Found the change!
                        valueChangeDetected = 1;
                    }
                }
                else if (ControlIsString) {
                    value = valueString;
                }
            }
        }
    }
}

if (valueChangeDetected) {
    // This may need some checks on if it should be allowed to set value... we'll see
                
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}



// DRAW //
// Draw if set, and if using surfaces draw if an update is needed
if (argument0 == true) {
    // Call the draw actions for groups if in one and is set to draw
    if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
        if (!GroupHidden || FadeCalled != 0) {
            GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
        }
    }
    
    // Don't process any drawing if hidden or update not needed
    if (Hidden && FadeCalled == 0)
        return false;
        
    // When using surfaces, check if there actually needs to be a draw update before setting the target
    if ((GMUIP).UIEnableSurfaces) {//if (0) disable
        if (NeedsDrawUpdate) {
            if ((GMUIP).GMUI_gridNeedsDrawUpdate[Layer] == false) {
                //surface_free((GMUIP).GMUI_gridSurface[Layer])
                //draw_set_blend_mode(bm_subtract);
                draw_set_blend_mode_ext(bm_dest_color, bm_zero)
                color_alpha(c_white,0);
                draw_rectangle(0,0,(GMUIP).UIgridwidth,(GMUIP).UIgridheight,0);
                draw_set_blend_mode(bm_normal);
            }
            
            // Set the surface target if it exists, otherwise create it
            (GMUIP).GMUI_gridSurface[Layer] = surface_target((GMUIP).GMUI_gridSurface[Layer], (GMUIP).UIgridwidth, (GMUIP).UIgridheight);
            (GMUIP).GMUI_gridNeedsDrawUpdate[Layer] = true;
            NeedsDrawUpdate = false;
        }
        else
            return false;
    }
    
        
    // Draw the control based on the type and user-defined settings
    var padx, _BackgroundAlpha;
    padx = ControlPaddingX;
    _BackgroundAlpha = min(ControlBackgroundAlpha,FadeAlpha);
    _HoverAlpha = min(ControlHoverAlpha,FadeAlpha);
    _SelectAlpha = min(ControlSelectAlpha,FadeAlpha);
    _OverwriteAlpha = min(ControlOverwriteAlpha,FadeAlpha);
    _FontAlpha = min(ControlFontAlpha,FadeAlpha);
        
    // Start drawing the control (inputs and buttons)
    if (ControlInput || ControlPicker || ControlDataType == global.GMUIDataTypeButton || ControlType == "image") {
        if (ControlGraphicMapIsUsed) {
            GMUI_DrawSpriteBox(GMUIP,Layer,Group,0,1);
        }
        else if (sprite_exists(ControlGraphic)) {
            // Sprite has been substituted for the default drawing
            var subi; subi = ControlGraphicIndex;
            if (Hovering) subi = ControlGraphicHoveringIndex;
            if (Selected) subi = ControlGraphicSelectedIndex;
            
            draw_sprite_ext(ControlGraphic,subi,RoomX,RoomY,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,ControlGraphicAlpha);
        }
        else if (ControlType != "image") {
            // Background
            color_alpha(ControlBackgroundColor,_BackgroundAlpha);
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 0);
            
            // Border
            color_alpha(ControlBorderColor,_BackgroundAlpha);
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
        
    
            if (Hovering || Selected) {
                // Draw the hovering effect
                if (!Selected)
                    color_alpha(ControlHoverColor,_HoverAlpha);
                else
                    color_alpha(ControlSelectColor,_SelectAlpha);
                draw_rectangle(RoomX+1,RoomY+1,RoomW-1,RoomH-1, ControlHoverBorder);
            }
            
            if (DoubleSelected && ControlInput) {
                // Draw 'Overwrite' affect
                color_alpha(ControlOverwriteColor,_OverwriteAlpha);
                draw_rectangle(RoomX+2,RoomY+2,RoomW-2,RoomH-2,0);
            }
        }
    }
    else if (ControlType == "tooltip") {
        GMUI_ControlDrawTooltipById(id);
    }
    else if (ControlType == "slider") {
        GMUI_ControlDrawSlider(id);
    }
    else if (ControlType == "checkbox" || ControlType == "toggle") {
        GMUI_ControlDrawToggle(id);
    }
    
    
    
    // Draw special features for the other types
    // Picker types (integer, double, etc)
    if (ControlPicker) {
        // draw arrows (origin should be on the right/left and to the corner it is placed at)
        var _ax1,_ax2,_ay1,_ay2,_hh,_ax3;
        _ay1 = RoomY+2;
        if (ControlPickerDirection == global.GMUIDirectionTypeVertical) {
            _ax3 = RoomX+1;
            _ax1 = RoomX + (RoomW-RoomX)/2;
            _hh = ControlPickerHeight;
        }
        else {
            _ax1 = RoomW-2;
            _ax3 = _ax1-ControlPickerWidth+1;
            _hh = (RoomH-RoomY)/2;
        }
        if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal) {
            _ax2 = RoomX+2;
            _ay2 = _ay1;
        }
        else { // GMUIDirectionTypeSideVertical or GMUIDirectionTypeVertical
            _ax2 = _ax1;
            _ay2 = RoomH-2;
        }
        
        // Top arrow and bottom arrow
        draw_sprite_ext(ControlPickerSpriteRightOrUp,0,_ax1,_ay1,1,1,0,c_white,_BackgroundAlpha);
        draw_sprite_ext(ControlPickerSpriteLeftOrDown,0,_ax2,_ay2,1,1,0,c_white,_BackgroundAlpha);
        
        color_alpha(ControlHoverColor,_HoverAlpha);
        if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal) {
            if (HoveringDirection == global.GMUIHoveringDirection_Right)
                draw_rectangle(_ax3,RoomY+1,RoomW-1,RoomH,0);
            else if (HoveringDirection == global.GMUIHoveringDirection_Left)
                draw_rectangle(_ax2-1, RoomY+1, _ax2+ControlPickerWidth,RoomH,0);
        }
        else { //GMUIDirectionTypeSideVertical or GMUIDirectionTypeVertical
            if (HoveringDirection == global.GMUIHoveringDirection_Up)
                draw_rectangle(_ax3,RoomY+1,RoomW-1,RoomY+_hh,0);
            else if (HoveringDirection == global.GMUIHoveringDirection_Down)
                draw_rectangle(_ax3,RoomH-_hh,RoomW-1,RoomH,0);
        }
        
    }
    
    
    // Draw the text inside of the keyboard string or value
    var Text, dtx, midHeight;
    if (ControlInput) {
        if (Selected)
            Text = keyboard_string;
        else
            Text = valueString;
    }
    else if (ControlDataType == global.GMUIDataTypeButton) {
        Text = ControlButtonText;
    }
    else if (ControlDataType == global.GMUIDataTypeString) {
        Text = valueString;
    }
    else
        Text = "";
    
    // Default is for fa_left:
    dtx = RoomX + padx;    
    if (ControlFontAlign == fa_center)
        dtx = RoomX+(RoomW-RoomX)/2;
    else if (ControlFontAlign == fa_right)
        dtx = RoomW - padx;
    else if (ControlFontAlign != fa_left) {
        ControlFontAlign = (GMUIP).ControlFontAlign;
        GMUI_ThrowErrorDetailed("Invalid font align",GMUI_ControlDraw);
    }
    
    if (ActualH > 0)
        midHeight = ActualH / 2;
    else
        midHeight = CellHigh * (GMUIP).cellsize_h / 2;
        
    // Set control font and alignment
    draw_set_font(ControlFont);
    align(ControlFontAlign,ControlFontAlignV);
    
    // Specific controls may override display
    if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
        color_alpha(ControlButtonTextHoverColor,_FontAlpha);
    else
        color_alpha(ControlFontColor,_FontAlpha);
        
    // TEMPORARY SOLUTION FOR DISABLED CONTROLS! :
    if (Disabled)
        draw_set_alpha(_FontAlpha / 2);
        
    // Button with graphic inside
    if (ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlButtonGraphic)) {
            draw_sprite(ControlButtonGraphic,0,dtx, RoomY + midHeight);
            dtx += sprite_get_width(ControlButtonGraphic) + padx;
        }
    }
    
    // Draw value string or button text
    if (Text != "") {
        if (ControlShowValue) {
            if (ControlInteraction && ControlShowCursor && Selected && !DoubleSelected)
                Text = Text + "|";
                
            if (ControlType != "label")
                draw_text(dtx, RoomY + midHeight, Text);
            else
                draw_text_ext(dtx, RoomY + midHeight, Text, -1, RoomW-RoomX-padx*2);
        }
    }
    else if (ControlType == "spritepicker" && optionsInitialized) {
        // Special case for sprite picker
        var _spr; _spr = ds_map_find_value(OptionsMap,value);
        draw_sprite(_spr,0,
            dtx-(sprite_get_width(_spr)/2)+sprite_get_xoffset(_spr),
            RoomY+midHeight-(sprite_get_height(_spr)/2)+sprite_get_yoffset(_spr));
    }
    
    
    // Reset the surface if using one
    if ((GMUIP).UIEnableSurfaces) {
        surface_reset_target();
    }
}
//

#define GMUI_ControlDrawTooltip
///GMUI_ControlDrawTooltip("name of control with the tooltip")
/// Draw the control's tooltip

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowErrorDetailed("Control doesn't exist", GMUI_ControlDrawTooltip);
        return false;
    }
    else {
        GMUI_ControlDrawTooltipById((control).TooltipId);
    }
}

#define GMUI_ControlHide
///GMUI_ControlHide("ControlName", Hide?)
///Hide or show a control
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        (_ctrl).Hidden = argument1;
        if ((_ctrl).FadeOnHide) {
            if (argument1 > 0)
                GMUI_ControlFadeOut(argument0,(_ctrl).FadeTime);
            else
                GMUI_ControlFadeIn(argument0,(_ctrl).FadeTime);
        }
        return true;
    }
}

#define GMUI_ControlHideTooltip
///GMUI_ControlHideTooltip("ControlName that has tooltip", Hide?)
///Hide or show a control's tooltip
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl, _ctrlTT;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else if ((_ctrl).TooltipId == -1)
        return false;
    else {
        _ctrlTT = (_ctrl).TooltipId;
        GMUI_ControlHide(_ctrlTT,argument1);
        return true;
    }
}

#define GMUI_ControlFadeIn
///GMUI_ControlFadeIn("ControlName", speed in steps)
///Fade in a control to alpha value

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        // Call fade up
        (_ctrl).FadeCalled = 1;
        (_ctrl).FadeTime = argument1;
        return true;
    }
}

#define GMUI_ControlIsDisabled
///GMUI_ControlIsDisabled("ControlName")
///Is control of name disabled

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsDisabled()");
        return false;
    }
    else {
        return (control).Disabled;
    }
}

#define GMUI_ControlIsHidden
///GMUI_ControlIsHidden("ControlName")
///Is control of name hidden

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsHidden()");
        return false;
    }
    else {
        return (control).Hidden;
    }
}

#define GMUI_ControlPersistentToLayer
///GMUI_ControlPersistentToLayer(Layer persistent to)
///Allow the control to be enabled for all layers between the main layer, and the one provided

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlPersistentToLayer);
    return false;
}

if (GMUI_LayerExists(argument0)) {
    AdditionalLayer = argument0;
}

#define GMUI_ControlPosition
///GMUI_ControlPosition("control name" or id, cell x, cell y, relative x, relative y, Anchor)
///Set the relative positioning and sizing of the control within its cell

var _ctrl,_anchor,_CellX,_CellY,_gridW,_gridH;
_CellX = argument1;
_CellY = argument2;
_Anchor = argument5;

if (is_string(argument0))
    _ctrl = ds_map_find_value((GMUII()).GMUI_map,argument0);
else
    _ctrl = argument0;
    
if (!GMUI_IsControlID(_ctrl))
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlPosition);
    return false;
}
    
// Store the relative values provided that reference against the anchor position
if (_Anchor >= 0)
    (_ctrl).Anchor = _Anchor;
(_ctrl).RelativeCellX = _CellX;
(_ctrl).RelativeCellY = _CellY;

// Get the dimensions and round down for grids that have even grid sizes
_gridW = GMUI_GridGetWidth((_ctrl).GMUIP,(_ctrl).Layer);
_gridH = GMUI_GridGetHeight((_ctrl).GMUIP,(_ctrl).Layer);

// Check grid positioning if it is an interactable control
if ((_ctrl).ControlInteraction) {
    if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,_gridW,_gridH)) {
        GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0),"GMUI_ControlPosition");
        return false;
    }
}

// Relative is to the anchor, this position is the actual:
// The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
(_ctrl).CellX = GMUI_GetAnchoredCellX(_gridW,_CellX,_Anchor);
(_ctrl).CellY = GMUI_GetAnchoredCellY(_gridH,_CellY,_Anchor);

// Actual position based on its grid position
(_ctrl).ActualX = GMUI_CellGetActualX((_ctrl).CellX);
(_ctrl).ActualY = GMUI_CellGetActualY((_ctrl).CellY);

// Relative position is used if the boundary box should be adjusted, must be < cell size
(_ctrl).RelativeX = min(argument3,((_ctrl).GMUIP).cellsize - 1);
(_ctrl).RelativeY = min(argument4,((_ctrl).GMUIP).cellsize_h - 1);

// Store that this object has an adjusted position
if ((_ctrl).ActualW != 0 || (_ctrl).ActualH != 0 || (_ctrl).RelativeX != 0 || (_ctrl).RelativeY != 0)
    (_ctrl).IsAdjusted = true;
else
    (_ctrl).IsAdjusted = false;
    
if ((_ctrl).Group > 0) {
    GMUI_ControlPositionToGroup(_ctrl);
    if ((GMUII()).UIInterfaceSet)
        GMUI_GridSetRegionsLayer((_ctrl).Layer);
}
else
    (_ctrl).NeedsPositionUpdate = true;

return true;



#define GMUI_ControlSelectOption
///GMUI_ControlSelectOption("ControlName", key value)
///Safely set the value of a selection control using key value

with (GMUII())
{
    // Retrieve control from the reference map
    var _SCRIPT,_ctrl;
    _SCRIPT = GMUI_ControlSelectOption;
    _ctrl = ds_map_find_value(GMUI_map,argument0);
    
    if (string(_ctrl) == "0") {
        GMUI_ThrowErrorDetailed("Control not found: " + argument0,_SCRIPT);
    }
    else if ((_ctrl).optionsInitialized) {
        if (ds_map_exists((_ctrl).OptionsMap,argument1)) {
            (_ctrl).value = argument1;
            (_ctrl).valueString = string((_ctrl).value);
    
            // If script is assigned to value change, execute it
            if (GMUI_IsScript((_ctrl).ValueChangedActionScript)) {
                script_execute((_ctrl).ValueChangedActionScript);
            }
        }
        else
        {
            GMUI_ThrowErrorDetailed("Key value not defined",_SCRIPT);
        }
    }
    else {
        GMUI_ThrowErrorDetailed("Not yet initialized. No options for '" + argument0 + "'?",_SCRIPT);
    }
    
}

#define GMUI_ControlSetAttributes
///GMUI_ControlSetAttributes(max string length(or 0 for none), max decimal length (if applicable), min value, max value, )
///Set the attributes of the control for the different types (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetAttributes);
    return false;
}


    ControlMaxStringLength = argument0;
    ControlMaxDecimalLength = argument1; // If applicable
    ControlMinValue = argument2;
    ControlMaxValue = argument3;

return true;
    

#define GMUI_ControlSetButton
///GMUI_ControlSetButton(Text in button or "" , graphic inside button or -1 , font alignment or -1, text color on hover or -1)
///Set the picker values of the control (to override the defaults)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetButton);
    return false;
}

    ControlButtonText = string(argument0);
    
    if (sprite_exists(argument1))
        ControlButtonGraphic = argument1;
    else
        ControlButtonGraphic = -1;
    
    // Uses same alignment as set in font style
    if (argument2 != -1)
        ControlFontAlign = argument2;
        
    if (argument3 != -1)
    {
        ControlButtonTextHoveringOn = true;
        ControlButtonTextHoverColor = argument3;
    }
    else
    {
        ControlButtonTextHoveringOn = false;
        ControlButtonTextHoverColor = 0;
    }
    

return true;
    

#define GMUI_ControlSetButtonAction
///GMUI_ControlSetButtonAction(Action Script)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetButtonAction");
    return false;
}

if (script_exists(argument0)) {
    ActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetButtonAction");
}

return false;
    

#define GMUI_ControlSetCheckboxSettings
///GMUI_ControlSetCheckboxSettings(padding [pixels], color on, color off, outline shape/sprite, outline color on, outline color off, transition speed)
///Required to be called to set the SETTINGS of the checkbox

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetCheckboxSettings);
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!toggleInitialized) {
    toggleInitialized = true;
    
    TogglePadding = 0;
    ToggleSlideAlpha = 1;
    ToggleAlpha = 1;

    Toggle_t = 0;
    Toggle_d = room_speed;
    Toggle_c = 1/Toggle_d; // rate (calculated)
    
    // Percentage for alpha
    ToggleRelativeXorY = 0;
    ToggleDistance = 1;
    
    // Toggle_d must be greater than 0 to update correctly
    if (Toggle_d <= 0)
        Toggle_d = 1;
    
    ToggleOrientation = 0; // unused with checkbox
}

if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = true;
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    TogglePadding = argument0;

// Set toggle transition speed
if (argument6 >= 0) {
    Toggle_d = argument6;
    Toggle_c = 1/Toggle_d;
}


if (argument1 >= 0)
    ToggleColorOn = argument1;
if (argument2 >= 0)
    ToggleColorOff = argument2;
if (is_real(argument3)) {
    ToggleSlideShape = argument3; // Or sprite
    if (argument3 > 0 && !sprite_exists(argument3))
    ToggleSlideShape = -1;    
}
if (argument4 >= 0)
    ToggleSlideColorOn = argument4;
if (argument5 >= 0)
    ToggleSlideColorOff = argument5;

    

return true;
    

#define GMUI_ControlSetFadeOnHide
///GMUI_ControlSetFadeOnHide("ControlName" or id, speed in steps)
///Set the fade in/out when the control is hidden or not

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    
    if (string(_ctrl) == "0")
        return false;
    else {
        // Set the fade settings for when hiding or unhiding
        (_ctrl).FadeTime = argument1;
        (_ctrl).FadeOnHide = true;
        if ((_ctrl).Hidden)
            (_ctrl).FadeAlpha = 0;
        return true;
    }
}

#define GMUI_ControlSetFontStyle
///GMUI_ControlSetFontStyle(font, font color, font align)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetFontStyle);
    return false;
}

if (argument0 > -1)
    ControlFont = argument0;
if (argument1 > -1)
    ControlFontColor = argument1;
if (argument2 > -1)
    ControlFontAlign = argument2;
    
// Defaults that can be optional in the future
ControlFontAlpha = 1;
    
return true;
    

#define GMUI_ControlSetHoverAction
///GMUI_ControlSetHoverAction(Action Script)
///When hovering, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetHoverAction);
    return false;
}

if (script_exists(argument0)) {
    HoverActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetHoverAction);
}

return false;
    

#define GMUI_ControlSetHoverOffAction
///GMUI_ControlSetHoverOffAction(Action Script)
///When hovering off, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetHoverOffAction);
    return false;
}

if (script_exists(argument0)) {
    HoverOffActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetHoverOffAction);
}

return false;
    

#define GMUI_ControlSetInitValue
///GMUI_ControlSetInitValue(value)
///Set the 'default' value (value/string) for the control, but not the actual value


if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetInitValue);
    return false;
}

value = argument0;
valueString = string(argument0);

    
return true;

#define GMUI_ControlSetPicker
///GMUI_ControlSetPicker(picker width, picker height, picker direction, picker_right/up sprite, picker_left/down sprite)
///Set the picker values of the control (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPicker");
    return false;
}

    if (argument0 >= 0)
        ControlPickerWidth = argument0;
    if (argument1 >= 0)
        ControlPickerHeight = argument1;
    if (argument2 >= 0) {
        ControlPickerDirection = argument2;
        if (argument2 != global.GMUIDirectionTypeSideVertical)
            ControlFontAlign = fa_center;
    }
    
    if (sprite_exists(argument3))
        ControlPickerSpriteRightOrUp = argument3;
    if (sprite_exists(argument4))
        ControlPickerSpriteLeftOrDown = argument4;
    

return true;


#define GMUI_ControlSetPositioning
///GMUI_ControlSetPositioning( relative x, relative y, actual width, actual height )
///Set the relative positioning and sizing of the control within its cell

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPositioning");
    return false;
}

// Actual width and height has more exact mouse boundaries (0 for full), BUT only 1 control can be in the same cell block
ActualW = argument2;
ActualH = argument3;

// Relative position is used if the boundary box should be adjusted, must be < cell size
RelativeX = min(argument0,(GMUII()).cellsize - 1);
RelativeY = min(argument1,(GMUII()).cellsize_h - 1);

// Store that this object has an adjusted position
if (ActualW != 0 || ActualH != 0 || RelativeX != 0 || RelativeY != 0)
    IsAdjusted = true;
else
    IsAdjusted = false;
    

return true;



#define GMUI_ControlSetSelectingAction
///GMUI_ControlSetSelectingAction(Action Script)
///On initial selection, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetSelectingAction");
    return false;
}

if (script_exists(argument0)) {
    SelectingActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetSelectingAction");
}

return false;
    

#define GMUI_ControlSetSliderMovement
///GMUI_ControlSetSliderStyle(Movement script for slider)
///Set the script called when smoothly moving the slider

if (script_exists(argument0))
    SliderMovementScript = argument0;
    

#define GMUI_ControlSetSliderSettings
///GMUI_ControlSetSliderSettings(ticks amount, min value, max value, round values to ticks[bool], snap [bool], smooth adjust and snap[bool], vertical orientation[bool])
///Required to be called to set the SETTINGS of the slider

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!sliderInitialized) {
    sliderInitialized = true;
    
    // Default Computed values
    // (Values will be computed for the first time before drawn ['sliderComputed' variable])
    SliderStartEndPadding = 0;
    SliderMidPoint = 0;
    SliderQuarterPoint1 = 0;
    SliderQuarterPoint2 = 0;
    SliderTickDistance = 0;// (size compared to mid/quarter, compared to minumum distance between them, etc.)
    SliderSnapDistance = 1;// distance until it snaps to a tick
    SliderTickPoints[0] = 0;
    SliderTickInterval = 0; // not sure if will be used
    SliderRelativeFinalXorY = 0;
    SliderVertical = false;
    SliderRelativeXorY = SliderRelativeFinalXorY;
    SliderRelativePad = 0;
    Slider_t = 0;
    Slider_b = 0;
    Slider_c = 0;
    Slider_d = room_speed/4;
    
    SliderMovementScript = easeExpOut;
    SliderSnapScript = -1;
    
    // Slider_d must be greater than 0 to update correctly
    if (Slider_d <= 0) Slider_d = 1;
    
    // Default Style values
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_ltgray,0.9,c_dkgray,0.4,c_gray,1,c_gray,0.8);

    // Default Sizing values
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 0);
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    SliderTickAmount = argument0;
if (is_real(argument1))
    ControlMinValue = argument1;
if (is_real(argument2))
    ControlMaxValue = argument2;
if (argument3 >= 0)
    SliderRoundValuesToSnap = (argument3 > 0);
if (argument4 >= 0)
    SliderSnap = (argument4 > 0);
if (argument5 >= 0)
    SliderSmoothSnap = (argument5 > 0);
if (argument6 >= 0)
    SliderVertical = (argument6 > 0);


return true;
    

#define GMUI_ControlSetToggleSettings
///GMUI_ControlSetToggleSettings(padding [pixels], color on, color off, slide shape/sprite, slide color on, slide color off, transition speed, orientation, Toggle Thickness [cell decimal])
///Required to be called to set the SETTINGS of the toggle
//todo: create checkbox alias for this script (alpha value will utilize the toggle change vars)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetToggleSettings);
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!toggleInitialized) {
    toggleInitialized = true;
    
    TogglePadding = 0;
    ToggleOrientation = global.GMUIDirectionTypeHorizontal;
    ToggleRelativeXorY = 0;
    ToggleDistance = 0;
    
    ToggleThumbSize = 0;
    ToggleThickness = 0;
    ToggleThumbPad = 4;
    
    ToggleMidPoint = 0;
    
    ToggleSlideAlpha = 1;
    ToggleAlpha = 1;
    
    Toggle_t = 0;
    Toggle_c = 1; // rate (calculated)
    Toggle_d = room_speed;
    
    // Toggle_d must be greater than 0 to update correctly
    if (Toggle_d <= 0)
        Toggle_d = 1;
        
    NeedsPositionUpdate = true;
}

if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = true;
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    TogglePadding = argument0;
        
if (argument7 >= 0)
    ToggleOrientation = argument7;
    
if (argument8 >= 0)
    ToggleThickness = argument8;

// Set positions based on orientation
if (ToggleOrientation == global.GMUIDirectionTypeHorizontal) {
    // Set sizing
    ToggleThickness = min(ToggleThickness,CellWide - (ToggleThumbPad/(GMUIP).cellsize));
    if (ToggleThickness <= 0)
        ToggleThickness = min(CellWide,CellHigh);
        
    ToggleThumbSize = ToggleThickness*(GMUIP).cellsize;
    //ToggleThumbSize = RoomH - RoomY - ToggleThumbPad;
    ToggleInitialXorY = RoomX + TogglePadding;
    ToggleFinalXorY = RoomW - TogglePadding*2 - ToggleThumbSize + 1;
}
else {
    // Set sizing
    ToggleThickness = min(ToggleThickness,CellHigh - (ToggleThumbPad/(GMUIP).cellsize_h));
    if (ToggleThickness <= 0)
        ToggleThickness = min(CellWide,CellHigh);
        
    ToggleThumbSize = ToggleThickness*(GMUIP).cellsize_h;
    //ToggleThumbSize = RoomW - RoomX - ToggleThumbPad;
    ToggleInitialXorY = RoomY + TogglePadding;
    ToggleFinalXorY = RoomH - TogglePadding*2 - ToggleThumbSize + 1;
}

ToggleDistance = ToggleFinalXorY - ToggleInitialXorY;

// Set toggle transition speed
if (argument6 >= 0) {
    Toggle_d = argument6;
    Toggle_c = 1/Toggle_d * ToggleDistance;
}


if (argument1 >= 0)
    ToggleColorOn = argument1;
if (argument2 >= 0)
    ToggleColorOff = argument2;
if (is_real(argument3)) {
    ToggleSlideShape = argument3; // Or sprite
    if (argument3 > 0 && !sprite_exists(argument3))
    ToggleSlideShape = -1;    
}
if (argument4 >= 0)
    ToggleSlideColorOn = argument4;
if (argument5 >= 0)
    ToggleSlideColorOff = argument5;

    

return true;
    

#define GMUI_ControlSetSliderSize
///GMUI_ControlSetSliderSize(Slider width, Slider height, Slide height, end tick height [or 0], mid tick height [or 0], quarter tick height [or 0], tick height [or 0], Pixels of padding [or 0])
///Set the ONLY THE SIZING of the slider

// todo: needs default script, but will only be called if it is a slider control (default is 0 to 100)
if (!GMUI_IsControl() && id != GMUII()) {
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetSliderSize);
    return false;
}

if (!sliderInitialized) {
    GMUI_ThrowErrorDetailed("Must call GMUI_ControlSetSettings() first",GMUI_ControlSetSliderSize);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderThumbWidth = argument0;
if (argument1 >= 0)
SliderThumbHeight = argument1;
if (argument2 >= 0)
SliderSlideHeight = argument2;
if (argument3 >= 0)
SliderEndTickHeight = argument3;
if (argument4 >= 0)
SliderMidTickHeight = argument4;
if (argument5 >= 0)
SliderQuarterTickHeight = argument5;
if (argument6 >= 0)
SliderTickHeight = argument6;
if (argument7 >= 0) {
    SliderStartEndPadding = argument7;
    
    sliderComputed = false;
    
    // Adjustment to the padding will need to adjust the slider position
    if (argument7 > 0)
        GMUI_ControlSliderMove(false);
}

return true;


#define GMUI_ControlSetSliderStyle
///GMUI_ControlSetSliderStyle(tick style [0 for none], slider style [0 for none/use sprite], Slide bg color, Slide bg alpha, Slider color, Slider alpha, border color, border alpha, Select color, Select alpha, tick color, tick alpha)
///Set the ONLY THE STYLE of the slider
// Tick styles:
// 0: none (slider only)
// 1: Free (No horizontal line)
// 2: Single (Horizontal line)
// 3: Rounded rectangle region
// Slider styles:
// 0: Draw none, optionally use sprite script instead
// 1: Circle
// 2: PentagonUp
// 3: PentagonDown
// 4: Rectangle
// 5: Rounded Rectangle
// 6: hexagon

if (!GMUI_IsControl() && id != GMUII()) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSliderStyle);
    return false;
}

if (!sliderInitialized) {
    GMUI_ThrowErrorDetailed("Must call GMUI_ControlSetSettings() first",GMUI_ControlSetSliderSize);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderTickStyle = round(argument0);
if (argument1 >= 0)
SliderStyle = round(argument1);
if (argument2 >= 0)
SliderBackgroundColor = argument2;
if (argument3 >= 0)
SliderBackgroundAlpha = minmax(argument3,0,1);
if (argument4 >= 0)
SliderColor = argument4;
if (argument5 >= 0)
SliderAlpha = minmax(argument5,0,1);
if (argument6 >= 0)
SliderBorderColor = argument6;
if (argument7 >= 0)
SliderBorderAlpha = minmax(argument7,0,1);
if (argument8 >= 0)
SliderSelectColor = argument8;
if (argument9 >= 0)
SliderSelectAlpha = minmax(argument9,0,1);
if (argument10 >= 0)
SliderTickColor = argument10;
if (argument11 >= 0)
SliderTickAlpha = minmax(argument11,0,1);



return true;
    

#define GMUI_ControlSetSprite
///GMUI_ControlSetSprite(sprite, subimage, hover subimage, selected subimage)
///Replace the control drawing with a sprite instead

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSprite);
    return false;
}
    
    if (sprite_exists(argument0))
        ControlGraphic = argument0;
    else
        ControlGraphic = -1;
    
    if (is_real(argument1))
        ControlGraphicIndex = argument1;
    else
        ControlGraphicIndex = 0;
        
    if (is_real(argument2))
        ControlGraphicHoveringIndex = argument2;
    else
        ControlGraphicHoveringIndex = 0;
        
    if (is_real(argument3))
        ControlGraphicSelectedIndex = argument3;
    else
        ControlGraphicSelectedIndex = 0;

return true;


#define GMUI_ControlSetSpriteExt
///GMUI_ControlSetSpriteExt(sprite, subimage, hover subimage, selected subimage, xscale, yscale, color, alpha)
///Replace the control drawing with a sprite with extra parameters

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSpriteExt);
    return false;
}
    
    if (sprite_exists(argument0))
        ControlGraphic = argument0;
    else
        ControlGraphic = -1;
    
    if (is_real(argument1))
        ControlGraphicIndex = argument1;
    else
        ControlGraphicIndex = 0;
        
    if (is_real(argument2))
        ControlGraphicHoveringIndex = argument2;
    else
        ControlGraphicHoveringIndex = 0;
        
    if (is_real(argument3))
        ControlGraphicSelectedIndex = argument3;
    else
        ControlGraphicSelectedIndex = 0;
        
    if (is_real(argument4))
        ControlGraphicXScale = argument4;
    else
        ControlGraphicXScale = 1;
    
    if (is_real(argument5))
        ControlGraphicYScale = argument5;
    else
        ControlGraphicYScale = 1;
        
    if (is_real(argument6))
        ControlGraphicColor = argument6;
    else
        ControlGraphicColor = c_white;
    
    if (is_real(argument7))
        ControlGraphicAlpha = argument7;
    else
        ControlGraphicAlpha = 1;
        

return true;

#define GMUI_ControlSetSpriteMap
///GMUI_ControlSetSpriteMap(sprite top, sprite top right, right, bottom right, bottom, bottom left, left, top left, center, center fixed partial [1] / stretched[0])
///Replace the control drawing with a sprite map of each corner, side, and center

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSpriteMap);
    return false;
}

if (sprite_exists(argument0))
    ControlGraphicTop = argument0;
else
    ControlGraphicTop = -1;
    
if (sprite_exists(argument1))
    ControlGraphicTopRight = argument1;
else
    ControlGraphicTopRight = -1;

if (sprite_exists(argument2))
    ControlGraphicRight = argument2;
else
    ControlGraphicRight = -1;
    
if (sprite_exists(argument3))
    ControlGraphicBottomRight = argument3;
else
    ControlGraphicBottomRight = -1;
    
if (sprite_exists(argument4))
    ControlGraphicBottom = argument4;
else
    ControlGraphicBottom = -1;
    
if (sprite_exists(argument5))
    ControlGraphicBottomLeft = argument5;
else
    ControlGraphicBottomLeft = -1;
    
if (sprite_exists(argument6))
    ControlGraphicLeft = argument6;
else
    ControlGraphicLeft = -1;
    
if (sprite_exists(argument7))
    ControlGraphicTopLeft = argument7;
else
    ControlGraphicTopLeft = -1;
    
if (sprite_exists(argument8))
    ControlGraphicCenter = argument8;
else
    ControlGraphicCenter = -1;
    
if (is_real(argument9))
    ControlGraphicCenterIsFixed = !(argument9 < 1);
else
    ControlGraphicCenterIsFixed = 0;


ControlGraphicMapIsUsed = true; 

return true;

#define GMUI_ControlSetStyle
///GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, Select color, Select alpha, show cursor)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetStyle);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
ControlBackgroundColor = argument0;
if (argument1 >= 0)
ControlBorderColor = argument1;
if (argument2 >= 0)
ControlHoverColor = argument2;
if (argument3 >= 0)
ControlHoverBorder = argument3; // Draw a second border on hover (1), or rectangle over control (0)
if (argument4 >= 0)
ControlHoverAlpha = minmax(argument4,0,1);
if (argument5 >= 0)
ControlOverwriteColor = argument5;
if (argument6 >= 0)
ControlOverwriteAlpha = argument6;
if (argument7 >= 0)
ControlSelectColor = argument7;
if (argument8 >= 0)
ControlSelectAlpha = argument8;
if (argument9 >= 0)
ControlShowCursor = argument9;

    
// Defaults that can be optional in the future
ControlBackgroundAlpha = 1;

return true;
    

#define GMUI_ControlSetText
///GMUI_ControlSetText(string)
///Similar to setting the value for the label, but will adjust the height to fit as well


if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetText);
    return false;
}

var str_h;
str_h = string_height_ext(argument0,-1,CellWide*GMUIP.cellsize-ControlPaddingX*2);

CellHigh = minmax(ceil(str_h/GMUIP.cellsize_h),CellHigh,CellHighMax);

return GMUI_ControlSetInitValue(argument0);



#define GMUI_ControlSetValueChangedAction
///GMUI_ControlSetValueChangedAction(Action Script)
///On changed value, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetValueChangedAction);
    return false;
}

if (script_exists(argument0)) {
    ValueChangedActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowErrorDetailed("Invalid script argument", GMUI_ControlSetValueChangedAction);
}

return false;
    

#define GMUI_Create
///GMUI_Create(GMUI-compatible Object, Interface Script, cell size width [0: default], cell size height [0: default])

// Must be an object
if (!object_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Object provided doesn't exist", GMUI_Create);
    return -1;
}

// Initialize
with (instance_create(0,0,argument0)) {
    return GMUI_CreateEvent(argument1, argument2, argument3);
}

#define GMUI_CreateGroup
///GMUI_CreateGroup(group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to the current GMUI layer that controls can be put into

return GMUI_CreateGroupInLayer((GMUII()).UIAddToLayer,argument0,argument1,argument2,argument3);

#define GMUI_CreateGroupInLayer
///GMUI_CreateGroupInLayer(layer number, group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to a GMUI layer that controls can be put into


// Arguments
var _groupNumber,_CellX,_CellY,_layerNumber,_Anchor;
_layerNumber = argument0;
_groupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_Anchor = argument4;


// Validate
if (!is_real(_groupNumber) || !is_real(_layerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowError("Invalid parameters for GMUI_CreateGroup");
    return -1;
}

if (_groupNumber <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return -1;
}

if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_ThrowError("Layer " + string(_layerNumber) + " doesn't exist. GMUI_CreateGroup");
    return -1;
}

// Create group; add to GMUI group list and create a control list
ds_list_add((GMUII()).GMUI_groupList[_layerNumber],_groupNumber);

with (GMUII()) {
    GMUI_groupControlList[_layerNumber,_groupNumber] = ds_list_create();

    // Set defaults
    GMUI_groupRelativeX[_layerNumber,_groupNumber] = 0;
    GMUI_groupRelativeY[_layerNumber,_groupNumber] = 0;
    GMUI_groupGraphicMapIsUsed[_layerNumber,_groupNumber] = false;
    // Default sprite map values
    GMUI_groupGraphicTop[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottom[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenter[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenterIsTiled[_layerNumber,_groupNumber] = false;
    
    // Set position
    GMUI_groupCellX[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_layerNumber),_CellX,_Anchor);
    GMUI_groupCellY[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_layerNumber),_CellY,_Anchor);
    GMUI_groupActualX[_layerNumber,_groupNumber] = GMUI_CellGetActualX(GMUI_groupCellX[_layerNumber,_groupNumber]);
    GMUI_groupActualY[_layerNumber,_groupNumber] = GMUI_CellGetActualY(GMUI_groupCellY[_layerNumber,_groupNumber]);
    GMUI_groupCellsW[_layerNumber,_groupNumber] = 1;
    GMUI_groupCellsH[_layerNumber,_groupNumber] = 1;
    GMUI_groupRelativeCellX[_layerNumber,_groupNumber] = _CellX;
    GMUI_groupRelativeCellY[_layerNumber,_groupNumber] = _CellY;
    GMUI_groupAnchor[_layerNumber,_groupNumber] = _Anchor;
    GMUI_groupTransitioning[_layerNumber,_groupNumber] = false;
    GMUI_groupMasterControl[_layerNumber,_groupNumber] = -1;
    GMUI_groupSettingsMap[_layerNumber,_groupNumber] = -1;
}


return GMUII();


#define GMUI_CreateMenu
///GMUI_CreateMenu (menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_CellX,_CellY;
_SCRIPT = GMUI_CreateMenu;
_CellX = argument1;
_CellY = argument2;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
GMUI_CreateMenuType(_SCRIPT,string(argument0),_CellX,_CellY,argument3,argument4,argument5);

#define GMUI_CreatePopup
///GMUI_CreatePopup (popup name, cell# x, cell# y, cells wide, cells high, Anchor, global.GMUIPopup...)
///Adds a popup to a GMUI layer that has typical control options for prompt


// Arguments
var _SCRIPT,_CellX,_CellY,_menu,_name;
_SCRIPT = GMUI_CreatePopup;
_CellX = argument1;
_CellY = argument2;
_name = string(argument0);


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
_menu = GMUI_CreateMenuType(_SCRIPT,_name,_CellX,_CellY,argument3,argument4,argument5);

if (_menu > -1) {
    switch (argument6) {
        case global.GMUIPopupInformation:
            // Button with "Ok"
            with (GMUI_Add("GMUIPopupOkBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Ok",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
        case global.GMUIPopupConfirm:
            // Buttons Yes / No
            with (GMUI_Add("GMUIPopupYesBtn"+string(_menu), "textbutton", 10,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Yes",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupNoBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionNo)
                GMUI_ControlSetButton("No",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
        case global.GMUIPopupThreeOptions:
            // Buttons Yes / No / Cancel
            with (GMUI_Add("GMUIPopupYesBtn"+string(_menu), "textbutton", 15,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionOk)
                GMUI_ControlSetButton("Yes",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupNoBtn"+string(_menu), "textbutton", 10,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionNo)
                GMUI_ControlSetButton("No",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            with (GMUI_Add("GMUIPopupCancelBtn"+string(_menu), "textbutton", 5,3, 4,2, global.GMUIAnchorBottomRight)) {
                GMUI_ControlSetButtonAction(GMUI_DefaultActionCancel)
                GMUI_ControlSetButton("Cancel",-1,-1,-1);
                GMUI_ControlAddToPopup(_name);
            }
            break;
    }
    
    return _menu;
}
else {
    GMUI_ThrowErrorDetailed("Unable to create popup "+_name,_SCRIPT);
    return -1;
}


#define GMUI_CreateWarning
///GMUI_CreateWarning (warning name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a popup to a GMUI layer that has typical control options for prompt


// Arguments
var _SCRIPT,_CellX,_CellY;
_SCRIPT = GMUI_CreateWarning;
_CellX = argument1;
_CellY = argument2;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Call to create a menu that returns the menu number
GMUI_CreateMenuType(_SCRIPT,string(argument0),_CellX,_CellY,argument3,argument4,argument5);

#define GMUI_Destroy
///GMUI_Destroy()
///Only call this when you want to remove all traces of this GMUI instance, including the object itself and all its controls

var gmuiid;

gmuiid = GMUIself();

if (gmuiid != -1) {
    GMUI_DestroyNumber(gmuiid);
}
else {
    GMUI_ThrowErrorDetailed("Unable to destroy grid. called from ID: " + string(gmuiid), GMUI_Destroy);
}

#define GMUI_DestroyNumber
///GMUI_Destroy(GMUI number)
///Only call this when you want to remove all traces of the GMUI instance provided, including the object itself


with (argument0) {

    // Needs to destroy all controls
    var c, ctrl;
    for(c=0;c<ds_list_size(GMUI_controlList);c+=1) {
        // Get the control id
        ctrl = ds_list_find_value((GMUII()).GMUI_controlList,c);
        
        if (instance_exists(ctrl)) {
            with (ctrl) {
                if (optionsInitialized) {
                    ds_map_destroy(OptionsMap);
                }
                instance_destroy();
            }
        }
    }
    
    ds_list_destroy(GMUI_controlList);
    
    
    // For each layer, clear its group lists, control lists, and surfaces
    var i,l,j,g;
    for(i=0;i<ds_list_size(GMUI_gridlist);i+=1) {
        l = ds_list_find_value(GMUI_gridlist,i);
        if (GMUI_StudioCheckDefined(l)) {
            // Remove the groups
            for (j=0;j<ds_list_size(GMUI_groupList[l]);j+=1) {
                g = ds_list_find_value(GMUI_groupList[l],j);
                ds_list_destroy(GMUI_groupControlList[l,g]);
            }
            
            if (surface_exists(GMUI_gridSurface[l])) {
                surface_free(GMUI_gridSurface[l]);
            }
            
            ds_grid_destroy(GMUI_grid[l]);
        }
    }
    
    ds_list_destroy(GMUI_gridlist);
    
    
    
    ds_map_destroy(GMUI_menu_map);
    
    ds_map_destroy(GMUI_popup_map);
    
    ds_map_destroy(GMUI_warnings_map);
    
    ds_map_destroy(GMUI_map);
    
    
    // will need to destroy surfaces if used
    
    
    
    // Destroy the object when done
    RemovingGMUI = true;
    instance_destroy();
}

#define GMUI_DrawEvent
///GMUI_GridDraw()
///Actions done to operate the grid, executed by the GMUI object in the draw event


// Count down initial disable before executing actions
if (GMUI_GridEnabled())
{
    //do grid stuff:
    
    // Assign mouse values here to easily switch out later if needed
    var MX, MY, inRegion, onDirection, mouseHor, mouseVert, ctrlObject, clickOffEvent, mouseEvent;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    mouseEvent = true;
    
    // Check if the mouse has moved before checking for any changed selections
    if (MX != mouse_px || MY != mouse_py) {
        // Find if there is a control at that position on the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);
        
        if (ctrlObject != -1) {
            if (DebugData) TestHoverObject = ctrlObject;
            
            if (previousHoveringControl != -1 && ctrlObject != previousHoveringControl) {
                (previousHoveringControl).Hovering = 0;
                (previousHoveringControl).HoveringDirection = 0;
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            
            if (!ctrlObject.Disabled && !ctrlObject.NonClickable) {
                ctrlObject.Hovering = 0;
                ctrlObject.HoveringDirection = 0;
                
                if (!ctrlObject.IsAdjusted) {
                    inRegion = true;
                }
                else if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY)) {
                    inRegion = true;
                }
                    
                
                if (inRegion) {
                    // The picker controls have a region on the sides for up/down
                    if (ctrlObject.ControlPicker)
                    {
                        onDirection = GMUI_MouseInSpecialRegion(ctrlObject,MX,MY);
                        
                        if (onDirection != global.GMUIHoveringDirection_None) {
                            ctrlObject.HoveringDirection = onDirection;
                        }
                        else {
                            ctrlObject.Hovering = 1;
                            GMUI_GridUpdateLayer(ctrlObject.GMUIP,ctrlObject.Layer); //test
                        }
                            
                    }
                    else {
                        ctrlObject.Hovering = 1;
                        GMUI_GridUpdateLayer(ctrlObject.GMUIP,ctrlObject.Layer); //test
                    }
                    
                    // Set the hovering control and execute optional hover action if set
                    if (ctrlObject != previousHoveringControl) {
                        HoveringControl = ctrlObject;
                        previousHoveringControl = ctrlObject;
                        
                        if (GMUI_IsScript(ctrlObject.HoverActionScript)) {
                            script_execute((ctrlObject).HoverActionScript);
                        }
                    }
                }
                
            }
        }
        else if (HoveringControl != -1) {
            if (previousHoveringControl != -1) {
            global.test = previousHoveringControl;
            GMUI_GridUpdateLayer(previousHoveringControl.GMUIP,previousHoveringControl.Layer); //test
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            GMUI_ResetControlStatus("Hovering",id);
            HoveringControl = -1;
        }
    
    
        // Reset previous position
        mouse_px = MX;
        mouse_py = MY;
    }
    
    // Mouse click on grid
    if (mouse_check_button_pressed(mb_left)) {
        GMUI_ResetControlStatus("Selected",id);
        
        // Check if we are looking at a menu, and if this is a click outside of it first
        clickOffEvent = false;
        if (UILayer >= GMUI_menu_layer && UILayer < GMUI_menu_layer + GMUI_menuLastId) {
            if (GMUI_groupClickOff[UILayer,GMUI_menuCurrent]) {
                if (!GMUI_MouseInGroupRegion(GMUI_menuCurrent,UILayer)) {
                    GMUI_ShowMenuId(GMUI_menuCurrent,false,true);
                    clickOffEvent = true;
                }
            }
        }
        
        if (!clickOffEvent) {
            // Find if there is a control at that position with the current layer
            ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);
    
            if (ctrlObject != -1) {
                if ((!ctrlObject.Disabled) && (!ctrlObject.NonClickable) && (!ctrlObject.Hidden)) {
                    if (ctrlObject.IsAdjusted) {
                        if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY))
                            inRegion = true;
                    }
                    else
                        inRegion = true;
                    
                    if (inRegion) {
                        GMUI_GridUpdateLayer(ctrlObject.GMUIP,ctrlObject.Layer); //test
                        // Switch between special types, general input types, and other controls
                        if (ctrlObject.ControlPicker) {
                            switch (ctrlObject.HoveringDirection) {
                                case global.GMUIHoveringDirection_Up:
                                case global.GMUIHoveringDirection_Right:
                                    if (ctrlObject.ControlType == "intpicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"integer");
                                    else if (ctrlObject.ControlType == "doublepicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"double");
                                    else if (ctrlObject.optionsInitialized) {
                                        if (ctrlObject.value == ctrlObject.OptionsLast)
                                            ctrlObject.value = ctrlObject.OptionsFirst;
                                        else
                                            ctrlObject.value = ds_map_find_next(ctrlObject.OptionsMap,ctrlObject.value);
                                    }
                                    break;
                                case global.GMUIHoveringDirection_Left:
                                case global.GMUIHoveringDirection_Down:
                                    if (ctrlObject.ControlType == "intpicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"integer");
                                    else if (ctrlObject.ControlType == "doublepicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"double");
                                    else if (ctrlObject.optionsInitialized) {
                                        if (ctrlObject.value == ctrlObject.OptionsFirst)
                                            ctrlObject.value = ctrlObject.OptionsLast;
                                        else
                                            ctrlObject.value = ds_map_find_previous(ctrlObject.OptionsMap,ctrlObject.value);
                                    }
                                    break;
                                case global.GMUIHoveringDirection_None:
                                    if (ctrlObject.ControlInput)
                                        GMUI_GridSelect(ctrlObject);
                                    break;
                            }
                        }
                        else if (ctrlObject.ControlSelectable) {
                            // Normal input controls
                            GMUI_GridSelect(ctrlObject);
                        }
                        else if (ctrlObject.ControlType == "checkbox" || ctrlObject.ControlType == "toggle") {
                            GMUI_SetValue(ctrlObject.valueName,1-ctrlObject.value,"integer");
                        }
                        else if (ctrlObject.ActionScript != -1) {
                            // Control buttons clicked
                            GMUI_ControlActionScript(ctrlObject);
                        }
                        else
                            mouseEvent = false;
                        // If enabled, consume the mouse event if triggered
                        if (mouseEvent && CaptureMouseEvents)
                            mouse_clear(mb_left);
                        
                    }
                }
    
            }
            
        }
    }
    
    // Any key event will trigger a set value on a selected control in GMUI_ControlDraw; navigate to next...
    if (SelectedControl != -1) {
        if (GMUI_NavigateNextControl(true)) {
            GMUI_GridNextControl(true);
        }
        else if (GMUI_NavigateNextControl(false)) {
            GMUI_GridNextControl(false);
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected",id);
        }
    }
    
    // The grid offset has changed, all controls must update their position if not drawn on surfaces
    if (UIsnaptoview && !UIEnableSurfaces) {
        if (previousXOffset != view_xview[UIgridview] || previousYOffset != view_yview[UIgridview]) {
            GMUI_ResetControlStatus("Position",id);
            previousXOffset = view_xview[UIgridview];
            previousYOffset = view_yview[UIgridview];
        }
    }
    
    
    // Draw surface layers, and/or adjust a transitioning layer
    if (GMUI_grid_Transition || UIEnableSurfaces) {
        // Loop through each layer
        var _i, _l;
        for(_i=0;_i<ds_list_size(GMUI_gridlist);_i+=1) {
            // Check for transition
            _l = ds_list_find_value(GMUI_gridlist,_i);
            
            if (GMUI_StudioCheckDefined(_l)) {
                if (GMUI_grid_Transitioning[_l]) {
                    GMUI_grid_Transition = true;
                    
                    if (GMUI_grid_T_t[_l] < GMUI_grid_T_d[_l]) {
                        GMUI_grid_T_t[_l] += 1;
                        GMUI_grid_x[_l] = script_execute(GMUI_grid_T_script[_l],GMUI_grid_T_t[_l],GMUI_grid_T_bx[_l],GMUI_grid_T_cx[_l],GMUI_grid_T_d[_l]);
                        GMUI_grid_y[_l] = script_execute(GMUI_grid_T_script[_l],GMUI_grid_T_t[_l],GMUI_grid_T_by[_l],GMUI_grid_T_cy[_l],GMUI_grid_T_d[_l]);
                    }
                    else {
                        GMUI_grid_T_t[_l] = GMUI_grid_T_d[_l];
                        GMUI_grid_Transitioning[_l] = false;
                        GMUI_grid_Transition = false;
                    }
                    // Need to redraw the layers of surfaces if enabled
                    if (UIEnableSurfaces) {
                        GMUI_gridNeedsDrawUpdate[_l] = 1;
                    }
                }
                
                if (surface_exists(GMUI_gridSurface[_l])) {
                    draw_surface(GMUI_gridSurface[_l],GMUI_grid_x[_l],GMUI_grid_y[_l]);
                    // Reset update flag
                    if (GMUI_gridNeedsDrawUpdate[_l])
                        GMUI_gridNeedsDrawUpdate[_l] = false; 
                }
            }
        }
        
        // Need to redraw each step if not using surfaces
        if (!UIEnableSurfaces) {
            GMUI_ResetControlStatus("Position",id);
        }
    }
    
    // If using surfaces, we need to draw each layer here
    
    
    
    // Check if the room size has changed to move any anchored controls positions?
    

}


#define GMUI_DrawDebug
// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
if (DebugData && !RemovingGMUI) {

    var gridW,gridH,w,h,xoffset,yoffset;
    gridW = GMUI_GridGetWidth(GMUII(),0);
    gridH = GMUI_GridGetHeight(GMUII(),0);
    
    xoffset = GMUI_GridViewOffsetX(GMUII());
    yoffset = GMUI_GridViewOffsetY(GMUII());
    
    // draw the grid lines 
    color_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,yoffset,w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,(GMUII()).UIgridheight+yoffset);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset,(GMUII()).UIgridwidth+xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset);
    }
    
    // draw the errors
    if (GMUI_ErrorNumber > 0) {
        color_alpha(c_red,0.5);
        align(fa_center,fa_bottom);
        draw_text(view_wview[0]/2+xoffset,view_hview[0]-64+yoffset,string(GMUI_ErrorNumber) + ".) " + GMUI_LastError());
    }
    
    var groupId, layer, i, m, ff, ffo;
    
    // draw the group boundaries
    color_alpha(c_green,0.5);
    for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
        layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
        if (layer >= (GMUII()).GMUI_menu_layer)
            color_alpha(c_lime,0.25);
        
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupList[layer]);j+=1) {
            groupId = ds_list_find_value((GMUII()).GMUI_groupList[layer],j);
            
            draw_rectangle(
                (GMUII()).GMUI_groupActualX[layer,groupId] + (GMUII()).GMUI_grid_x[layer] + xoffset,
                (GMUII()).GMUI_groupActualY[layer,groupId] + (GMUII()).GMUI_grid_y[layer] + yoffset,
                (GMUII()).GMUI_groupActualX[layer,groupId] + 
                    (GMUII()).GMUI_groupCellsW[layer,groupId]*(GMUII()).cellsize + (GMUII()).GMUI_grid_x[layer] + xoffset,
                (GMUII()).GMUI_groupActualY[layer,groupId] + 
                    (GMUII()).GMUI_groupCellsH[layer,groupId]*(GMUII()).cellsize_h + (GMUII()).GMUI_grid_y[layer] + yoffset,
                true);
        }
    }
    
    // draw control lines
    color_alpha(c_red,0.8);
    with (GMUI_controlobject) {
        if (ControlType == "label" && GMUIP == GMUII()) {
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
        }
    }
    /*ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) != "0") {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    draw_
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }*/
    

}

#define GMUI_GetControl
///GMUI_GetControl("ControlName")
///Return the control id back to use in user code

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return -1;
    else
        return control;
}

#define GMUI_GetCurrentLayer
///GMUI_GetCurrentLayer()
///Returns the layer number currently viewed for the current GMUI instance

return (GMUII()).UILayer;

#define GMUI_GetValue
///GMUI_GetValue("ControlName")
///Return the value of a control back to use in user code

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return 0;
    else
        return (control).value;
}

#define GMUI_GetValueString
///GMUI_GetValueString("ControlName")
///Return the value string of a control back to use in user code

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return 0;
    else
        return (control).valueString;
}

#define GMUI_GridSetNavigation
///GMUI_GridSetNavigation(direction that navigates, back key, forward key, alternate back key [or -1], alternate forward key [or -1], allow tab)
///Set the controls that can navigate through the list
// Called by the GMUI instance in the form or otherwise

var _navdir, _back, _forward, _backalt, _forwardalt, _allowtab;
_navdir = minmax(argument0,0,2); // 3 and 2 count as the same
_back = argument1;
_forward = argument2;
_backalt = argument3;
_forwardalt = argument4;
_allowtab = argument5;

GMUI_navigateDirection = _navdir;
GMUI_backKey = _back;
GMUI_forwardKey = _forward;
GMUI_backAltKey = _backalt;
GMUI_forwardAltKey = _forwardalt;
GMUI_enableTab = _allowtab;

#define GMUI_GroupHide
///GMUI_GroupHide(group number, layer number, Hide(1) or show(0))
/// Hide all of the controls within the specified group

var _Group, _Layer, _Hide, i, ctrl;
_Group = argument0;
_Layer = argument1;
_Hide = argument2;

// Change the value for each of the controls within the group
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_Layer,_Group]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_Layer,_Group],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists layer, group: (" + _Layer + "," + _Group + ")",GMUI_GroupHide);
    }
    else {
        GMUI_ControlHide(ctrl,_Hide);
    }
}

#define GMUI_GroupSetClickOff
///GMUI_GroupSetClickOff(Group, Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

var _Group, _Layer, _clickOff;
_Layer = UIAddToLayer;
_Group = argument0;
_clickOff = (argument1 > 0);

(GMUII()).GMUI_groupClickOff[_Layer,_Group] = _clickOff;

return true;

#define GMUI_GroupSetFadeOnHide
///GMUI_GroupSetFadeOnHide(Group Number, Speed in steps, Fade Mode [0: alpha-sequential, 1: all-together])
///Set the fade in/out when the control is hidden or not
///Fade Mode: 0 = fade dimmest last, 1 = fade all together

// Arguments
var _SCRIPT,_LayerNumber,_GroupNumber,_Speed,_FadeMode, _ctrl;
_SCRIPT = GMUI_GroupSetFadeOnHide;
_LayerNumber = UIAddToLayer;
_GroupNumber = argument0;
_Speed = max(0,argument1);
_FadeMode = argument2;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist", _SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber), _SCRIPT);
    return false;
}

// Check that the UI has been fully run, otherwise create the values map
if (!UIInterfaceSet) {
    if (GMUI_groupSettingsMap[_LayerNumber,_GroupNumber] == -1) {
        GMUI_groupSettingsMap[_LayerNumber,_GroupNumber] = ds_map_create();
    }
    
    ds_map_add(GMUI_groupSettingsMap[_LayerNumber,_GroupNumber], "FadeSpeed", _Speed);
    ds_map_add(GMUI_groupSettingsMap[_LayerNumber,_GroupNumber], "FadeMode", _Speed);
    return true;
}

// Set fade on hide rule for all controls
if (ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]) <= 0) {
    GMUI_ThrowErrorDetailed("Must create controls first! For group: " + string(_GroupNumber) + ", layer " + string(_LayerNumber), _SCRIPT);
    return false;
}
    
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        GMUI_ControlSetFadeOnHide(ctrl,_Speed);
        ctrl.FadeMode = _FadeMode;
    }
}

return true;

#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var _SCRIPT,_LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY;
_SCRIPT = GMUI_GroupSetPosition;
_LayerNumber = (GMUII()).UIAddToLayer;
_GroupNumber = argument0;
_CellX = argument1;
_CellY = argument2;
_AdjustmentX = argument3;
_AdjustmentY = argument4;

// Validate
if (!is_real(_GroupNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber),_SCRIPT);
    return false;
}

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_LayerNumber, _GroupNumber, _CellX, _CellY, _AdjustmentX, _AdjustmentY, (GMUII()).GMUI_groupAnchor[_LayerNumber,_GroupNumber]);



#define GMUI_GroupSetPositionActual
///GMUI_GroupSetPositionActual(Layer Number, Group Number, x, y)
///Set a group to a position in the room by x, y

var _LayerNumber, _GroupNumber, _xcord, _ycord, _adjx, _adjy, _offsetx, _offsety;
_LayerNumber = argument0;
_GroupNumber = argument1;
_xcord = argument2;
_ycord = argument3;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_xcord) || !is_real(_ycord)) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionActual");
}

_offsetx = GMUI_GridViewOffsetX(GMUII());
_offsety = GMUI_GridViewOffsetY(GMUII());

_adjx = _xcord - _offsetx - GMUI_CellGetActualX(GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord));
_adjy = _ycord - _offsety - GMUI_CellGetActualY(GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord));


// Set position by default anchor (topleft), and adjustment to the given coordinates
GMUI_GroupSetPositionAnchored(_LayerNumber,_GroupNumber,GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord),GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord),_adjx,_adjy,0);

#define GMUI_GroupSetSize
///GMUI_GroupSetSize(Group, cells wide, cells high)
///Set the cell size of the group

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_layerNumber = UIAddToLayer;
_groupNumber = argument0;
_CellsW = argument1;
_CellsH = argument2;


GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;

#define GMUI_GroupSetSpriteMap
///GMUI_GroupSetSpriteMap(Group, sprite top, sprite top right, right, bottom right, bottom, bottom left, left, top left, center, center fixed partial [1] / stretched[0])
///Replace the group drawing with a sprite map of each corner, side, and center

// Arguments
var _SCRIPT,_LayerNumber,_GroupNumber;
_SCRIPT = GMUI_GroupSetSpriteMap;
_LayerNumber = UIAddToLayer;
_GroupNumber = argument0;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",_SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber),_SCRIPT);
    return false;
}


if (sprite_exists(argument1))
    (GMUII()).GMUI_groupGraphicTop[_LayerNumber,_GroupNumber] = argument1;
else
    (GMUII()).GMUI_groupGraphicTop[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument2))
    (GMUII()).GMUI_groupGraphicTopRight[_LayerNumber,_GroupNumber] = argument2;
else
    (GMUII()).GMUI_groupGraphicTopRight[_LayerNumber,_GroupNumber] = -1;

if (sprite_exists(argument3))
    (GMUII()).GMUI_groupGraphicRight[_LayerNumber,_GroupNumber] = argument3;
else
    (GMUII()).GMUI_groupGraphicRight[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument4))
    (GMUII()).GMUI_groupGraphicBottomRight[_LayerNumber,_GroupNumber] = argument4;
else
    (GMUII()).GMUI_groupGraphicBottomRight[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument5))
    (GMUII()).GMUI_groupGraphicBottom[_LayerNumber,_GroupNumber] = argument5;
else
    (GMUII()).GMUI_groupGraphicBottom[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument6))
    (GMUII()).GMUI_groupGraphicBottomLeft[_LayerNumber,_GroupNumber] = argument6;
else
    (GMUII()).GMUI_groupGraphicBottomLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument7))
    (GMUII()).GMUI_groupGraphicLeft[_LayerNumber,_GroupNumber] = argument7;
else
    (GMUII()).GMUI_groupGraphicLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument8))
    (GMUII()).GMUI_groupGraphicTopLeft[_LayerNumber,_GroupNumber] = argument8;
else
    (GMUII()).GMUI_groupGraphicTopLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument9))
    (GMUII()).GMUI_groupGraphicCenter[_LayerNumber,_GroupNumber] = argument9;
else
    (GMUII()).GMUI_groupGraphicCenter[_LayerNumber,_GroupNumber] = -1;
    
if (is_real(argument10))
    (GMUII()).GMUI_groupGraphicCenterIsFixed[_LayerNumber,_GroupNumber] = !(argument10 < 1);
else
    (GMUII()).GMUI_groupGraphicCenterIsFixed[_LayerNumber,_GroupNumber] = 0;
    
    

(GMUII()).GMUI_groupGraphicMapIsUsed[_LayerNumber,_GroupNumber] = true;
        

return true;

#define GMUI_GroupSetStyle
///GMUI_GroupSetStyle(Group, Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)
///Set the style of the controls that will be used for new controls (to override the defaults)
var _SCRIPT, _Layer, _Group;
_SCRIPT = GMUI_GroupSetStyle;
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return false;
}

_Layer = UIAddToLayer;
_Group = argument0;

// Map values if interface is not done being created
if (!GMUII().UIInterfaceSet) {
    if ((GMUII()).GMUI_groupSettingsMap[_Layer,_Group] == -1) {
        (GMUII()).GMUI_groupSettingsMap[_Layer,_Group] = ds_map_create();
    }
    
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BackgroundColor", argument1);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BackgroundAlpha", argument2);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BorderColor", argument3);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BorderAlpha", argument4);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "IsRoundRect", argument5);

    return true;
}

// Get master control for menu if it exists
if ((GMUII()).GMUI_groupMasterControl[UIAddToLayer,_Group] == -1) {
    GMUI_ThrowErrorDetailed("A control is needed to set style: " + _menuName, _SCRIPT);
    return false;
}

// Call group style assign
with ((GMUII()).GMUI_groupMasterControl[UIAddToLayer,_Group]) {
    // If any values are given as negative numbers, those values will remain as the control default [Not set in Demo]
    
    if (argument1 >= 0)
    GroupBackgroundColor = argument1;
    if (argument2 >= 0)
    GroupBackgroundAlpha = minmax(argument2,0,1);
    if (argument3 >= 0)
    GroupBorderColor = argument3;
    if (argument4 >= 0)
    GroupBorderAlpha = minmax(argument4,0,1);
    if (argument5 >= 0)
    GroupIsRoundRect = minmax(argument5,0,1);
    
    
    ControlHasGroupStyle = true;
}

return true;
    

#define GMUI_Init
///GMUI_Init() Call this initialization script before creating any GMUI interfaces
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! TRY TO EDIT THE OBJECTS INSTEAD!
//
// Copyright 2017-2018 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

// SET THIS VALUE TO TRUE IF RUNNING IN GAME MAKER 8.x
global.GMUIGameMaker8 = true;


// Index of global GMUI's
global.GMUIii = 0;


// Common GMUI values:

// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position
global.GMUIAnchorRight = 1;
global.GMUIAnchorTopRight = 2;
global.GMUIAnchorTop = 3;
global.GMUIAnchorTopLeft = 4;
global.GMUIAnchorLeft = 5;
global.GMUIAnchorBottomLeft = 6;
global.GMUIAnchorBottom = 7;
global.GMUIAnchorBottomRight = 8;
global.GMUIAnchorCenter = 9;
global.GMUIAnchorDefault = global.GMUIAnchorTopLeft;

// Hovering directions for special controls
global.GMUIHoveringDirection_None = 0;
global.GMUIHoveringDirection_Right = 1;
global.GMUIHoveringDirection_Up = 2;
global.GMUIHoveringDirection_Left = 3;
global.GMUIHoveringDirection_Down = 4;

// Direction types
global.GMUIDirectionTypeHorizontal = 0;
global.GMUIDirectionTypeVertical = 1;
global.GMUIDirectionTypeSideVertical = 2;
global.GMUIDirectionTypeBoth = 3;

// Control datatypes
global.GMUIDataTypeString = 0;
global.GMUIDataTypeInteger = 1;
global.GMUIDataTypeDecimal = 2;
global.GMUIDataTypeButton = 3;
global.GMUIDataTypeInfo = 4;
global.GMUIDataTypeBoolean = 5;

// PopupTypes
global.GMUIPopupBlank = -1;
global.GMUIPopupInformation = 0;
global.GMUIPopupConfirm = 1;
global.GMUIPopupThreeOptions = 2;

// Slide shapes
global.GMUISlideNone = -1;
global.GMUISlideLine = -2;
global.GMUISlideRect = -3;
global.GMUISlideRoundRect = -4;
global.GMUISlideFullRoundRect = -5;


// If studio, run the script to create enum versions of these
if (!global.GMUIGameMaker8) {
GMUI_InitStudio();
}



#define GMUI_IsMenuOpen
///GMUI_IsMenuOpen() Returns how many menus are open for the current interface

return (GMUII()).GMUI_menuCurrent;

#define GMUI_MenuSetClickOff
///GMUI_MenuSetClickOff("menu name", Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

var SCRIPT, _menuName, _menuNumber, _Layer, _clickOff;
SCRIPT = GMUI_MenuSetClickOff;
_menuName = string(argument0);
_clickOff = (argument1 > 0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _menuName,SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

(GMUII()).GMUI_groupClickOff[_Layer,_menuNumber] = _clickOff;

return true;

#define GMUI_MenuSetHidePosition
///GMUI_MenuSetHidePosition("menu name", Cell X, Cell Y, transition_script [or -1], speed in steps)
// Sets menu position to come from and go to when shown or hidden

// Get menu number and check its valid
var _MenuName, _MenuNumber, _prevLayer, _result;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,GMUI_MenuSetHidePosition);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetHidePosition(_MenuNumber,argument1,argument2,argument3,argument4);

UIAddToLayer = _prevLayer;
return _result;

#define GMUI_MenuSetFadeOnHide
///GMUI_MenuSetFadeOnHide("Menu Name", Speed in steps, Fade Mode [0: alpha-sequential, 1: all-together])
///Set the fade in/out when the menu is hidden or not
///Fade Mode: 0 = fade dimmest last, 1 = fade all together

// Arguments
var _SCRIPT,_MenuName,_MenuNumber,_Speed,_FadeMode, _prevLayer, _result;
_SCRIPT = GMUI_MenuSetFadeOnHide;
_MenuName = argument0;
_Speed = max(0,argument1);
_FadeMode = argument2;

// Get menu number and check its valid
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,_SCRIPT);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetFadeOnHide(_MenuNumber,_Speed,_FadeMode);

UIAddToLayer = _prevLayer;
return _result;

#define GMUI_MenuSetPosition
///GMUI_MenuSetPosition("menu name", Cell X, Cell Y, X Adjustment, Y Adjustment)
// Sets menu position

// Get menu number and check its valid
var _MenuName, _MenuNumber, _MenuLayer;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,GMUI_MenuSetPosition);
    return false;
}

_MenuLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_MenuLayer, _MenuNumber, argument1, argument2, argument3, argument4, (GMUII()).GMUI_groupAnchor[_MenuLayer,_MenuNumber]);


#define GMUI_MenuSetStyle
///GMUI_MenuSetStyle("menu name", Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)

var _SCRIPT, _MenuName, _MenuNumber, _result, _prevLayer;
_SCRIPT = GMUI_MenuSetStyle;
_MenuName = string(argument0);

// Get menu number and check its valid
_MenuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _MenuName,_SCRIPT);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result =  GMUI_GroupSetStyle(_MenuNumber, argument1, argument2, argument3, argument4, argument5);

UIAddToLayer = _prevLayer;
return _result;

#define GMUI_MouseInGroupRegion
///GMUI_MouseInGroupRegion(group number, layer number)
///Returns if the mouse is in the bounds of the group

var SCRIPT,_Group, _Layer, _mouseCellX, _mouseCellY;
SCRIPT = GMUI_MouseInGroupRegion;
_Group = argument0;
_Layer = argument1;

// Check the parameters
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_Layer) + " doesn't exist",SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowErrorDetailed("Group " + string(_Group) + " doesn't exist on layer " + string(_Layer),SCRIPT);
    return false;
}

_mouseCellX = GMUI_GridGetMouseCellX(GMUII());
_mouseCellY = GMUI_GridGetMouseCellY(GMUII());

if (_mouseCellX < (GMUII()).GMUI_groupCellX[_Layer,_Group] || _mouseCellY < (GMUII()).GMUI_groupCellY[_Layer,_Group] || 
    _mouseCellX > (GMUII()).GMUI_groupCellX[_Layer,_Group] + (GMUII()).GMUI_groupCellsW[_Layer,_Group] ||
    _mouseCellY > (GMUII()).GMUI_groupCellY[_Layer,_Group] + (GMUII()).GMUI_groupCellsH[_Layer,_Group]) {
    return false;
}

return true;

#define GMUI_PopupGetResponse
///GMUI_PopupGetResponse()
///Get the returning value from the popup selection

return (GMUII()).GMUI_menuResponse;

#define GMUI_PopupSetClickOff
///GMUI_PopupSetClickOff("popup name", Click off to close [1] or not [0])
///This option allows the user to click outside of the menu to close it

var SCRIPT, _menuName, _menuNumber, _Layer, _clickOff;
SCRIPT = GMUI_PopupSetClickOff;
_menuName = string(argument0);
_clickOff = (argument1 > 0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

(GMUII()).GMUI_groupClickOff[_Layer,_menuNumber] = _clickOff;

return true;

#define GMUI_PopupSetButton
///GMUI_PopupSetButton("popup name", )
///This option allows the user to click outside of the menu to close it

//todo: put above: GMUI_PopupSetButton("Test Popup", which button, Text or "", graphic or -1, text align, text color on hover)

var SCRIPT, _menuName, _menuNumber, _Layer, _clickOff;
SCRIPT = GMUI_PopupSetClickOff;
_menuName = string(argument0);
_clickOff = (argument1 > 0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

//(GMUII()).GMUI_groupClickOff[_Layer,_menuNumber] = _clickOff;

//todo: Call GMUI_ControlSetButton with whichever button it is


return true;

#define GMUI_PopupSetAction
///GMUI_PopupSetAction("popup name", Script to execute)
///Action to execute after responding to the popup

var _SCRIPT, _menuName, _menuNumber;
_SCRIPT = GMUI_PopupSetAction;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

(GMUII()).GMUI_groupAction[GMUI_GetMenuLayer(GMUII(),_menuNumber),_menuNumber] = argument1;

return true;

#define GMUI_PopupSetHidePosition
///GMUI_PopupSetHidePosition("popup name", Cell X, Cell Y, transition_script [or -1], speed in steps)
// Sets popup position to come from and go to when shown or hidden

// Get popup number and check its valid
var _MenuName, _MenuNumber;
_MenuName = string(argument0);
_MenuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _MenuName,GMUI_PopupSetHidePosition);
    return false;
}


// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetHidePosition(_MenuNumber,argument1,argument2,argument3,argument4);

UIAddToLayer = _prevLayer;
return _result;

#define GMUI_PopupSetMessage
///GMUI_PopupSetMessage("popup name", "Message", # of Padding Cells, font [or -1], color [or -1])
///Creates a message label inside of the popup

var _G, _SCRIPT, _menuNumber, _Layer, _menuName, _message, _pad, _wcells, _hcells;
_G = GMUII();
_SCRIPT = GMUI_PopupSetMessage;
_menuName = string(argument0);
_message = string(argument1);
_pad = max(0,argument2);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((_G).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(_G,_menuNumber);

// Calculate location for label
_wcells = (_G).GMUI_groupCellsW[_Layer,_menuNumber] - _pad * 2;
_hcells = 2;

// Create label
with (GMUI_Add("GMUIPopupMessage" + string(_menuNumber), "label", _pad, _pad, _wcells, _hcells, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetText(_message);
    GMUI_ControlSetFontStyle(argument3,argument4,fa_left);
    GMUI_ControlAddToPopup(_menuName);
}

return true;

#define GMUI_PopupSetFadeOnHide
///GMUI_PopupSetFadeOnHide("Popup Name", Speed in steps, Fade Mode [0: alpha-sequential, 1: all-together])
///Set the fade in/out when the menu is hidden or not
///Fade Mode: 0 = fade dimmest last, 1 = fade all together

// Arguments
var SCRIPT,_MenuName,_MenuNumber,_Speed,_FadeMode;
SCRIPT = GMUI_PopupSetFadeOnHide;
_MenuName = argument0;
_Speed = max(0,argument1);
_FadeMode = argument2;

// Get menu number and check its valid
_MenuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _MenuName,SCRIPT);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetFadeOnHide(_MenuNumber,_Speed,_FadeMode);

UIAddToLayer = _prevLayer;
return _result;

#define GMUI_PopupSetStyle
///GMUI_PopupSetStyle("popup name", Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)

var _SCRIPT, _menuName, _menuNumber, _prevLayer;
_SCRIPT = GMUI_PopupSetStyle;
_menuName = string(argument0);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

// Set style with the popup, temporary change to setting layer
_prevLayer = (GMUII()).UIAddToLayer;
(GMUII()).UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_menuNumber);

_result =  GMUI_GroupSetStyle(_menuNumber, argument1, argument2, argument3, argument4, argument5);

(GMUII()).UIAddToLayer = _prevLayer;
return _result;

#define GMUI_SetForm
/// GMUI_SetForm(name of form script)
/// Playbook to create all of the UI component objects for the project
//
// PLEASE READ THE MANUAL ONLINE FOR INSTRUCTIONS ON HOW TO USE GMUI!
//
// Called by GMUI_Create. Argument can be used optionally to have different
// forms for different GMUI instances to use:
var OptionalInterfaceName; OptionalInterfaceName = argument0;

//
//
// Syntax: GMUI_Add("Name", "Type String", 
//                  cell# x, cell# y, cells wide (min 1), cells high (min 1), 
//                  Layer**, Anchor***)


// Cell#'s start at 0 and increment by 1 for each size of cell over the x & y axis
// ** Layer can be used to show pop-up or slide windows and disable lower layers temporarily (0 is default)
// *** See GMUI_Init for Anchor codes. E.g.: AnchorBottomRight will be determined by cells away from room width/height (0=default)

// Types: textint, textdecimal, textstring, button , slider , dropdown , custom*
// * To use custom, type the object name you would like to use as a reference to the GMUI cell
// Note: MUST BE VALID TYPE NAME. If not, it will default to an 'X'

// Assign names to the controls to reference in your code
// e.g. SizeSlider = GMUI_Add("SizeSlider",...), then use: GMUI_GetValue("SizeSlider");

// Custom controls should call Create: GMUI_ControlInit, Draw: GMUI_ControlDraw

//GMUI_Add("New1" , GMUI_custom , 0 , 0 , 1 , 1 , 0 , 0 , 1 , 0 , AnchorTopLeft );
// gmuiaddlabel ()

//Group can be used move, disable, or hide a set of controls from within the same layer
//...

if (is_real(OptionalInterfaceName)) {
    if (OptionalInterfaceName > -1) {
        if (script_exists(OptionalInterfaceName)) {
            script_execute(OptionalInterfaceName);
        }
        else {
            GMUI_ThrowError("Form doesn't exist");
        }
    }
}

#define GMUI_SetOnLayer
///GMUI_SetOnLayer(Layer number)
/// Switches the layer to create / modify on

// Arguments
var _SCRIPT,_LayerNumber;
_SCRIPT = GMUI_SetOnLayer;
_LayerNumber = argument0;

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",_SCRIPT);
    return false;
}

// Check that the interface has been set, if not it may still be running the interface script
UIAddToLayer = _LayerNumber;

return true;


#define GMUI_SetValue
///GMUI_SetValue("ControlName", value, value type - string:0, integer:1, decimal:2)
///Set the value of a control to GMUI to reference in user code (GMUI_GetValue)

with (GMUII())
{
    // Retrieve control from the reference map
    var control,a2,c,_invalid;
    control = ds_map_find_value(GMUI_map,argument0);
    _invalid = false;
    
    a2 = string(argument2);
    // If integer or decimal, we will need to do some work to convert the string to an acceptable format
    if (a2 == "0" || string_lower(a2) == "string")
    {
        (control).value = string_copy(string(argument1),0,(control).ControlMaxStringLength);
        (control).valueString = (control).value;
    }
    else if (a2 == "1" || string_lower(a2) == "integer" || string_lower(a2) == "int")
    {
        (control).value = minmax(round(real(argument1)),(control).ControlMinValue,(control).ControlMaxValue);
        (control).valueString = string((control).value);
    }
    else if (a2 == "2" || string_lower(a2) == "double")
    {
        (control).value = minmax(real(argument1),(control).ControlMinValue,(control).ControlMaxValue);
        // Remove any trailing zeros if option is turned on, otherwise use simple format
        var formatValue,c,z,strLenFmtVal;
        formatValue = string_format((control).value,(control).ControlMaxStringLength,(control).ControlMaxDecimalLength);
        
        if (GMUIRemoveExtraDecimalZeros && formatValue != "0")
        {
            z = 0;
            strLenFmtVal = string_length(formatValue);
            for (c=0;c<=strLenFmtVal;c+=1) {
                if (string_char_at(formatValue,strLenFmtVal-c) == '0')
                    z += 1;
                else
                    break;
            }
            formatValue = string_copy(formatValue,0,strLenFmtVal-z);
            if (string_char_at(formatValue,string_length(formatValue)) == '.')
            formatValue = string_copy(formatValue,0,string_length(formatValue)-1);
        }
        (control).valueString = formatValue;
    }
    else
    {
        GMUI_ThrowErrorDetailed("Unknown value type",GMUI_SetValue);
        _invalid = true;
    }
    
    // If not a string, check if we need to update a slider or toggle
    if (a2 != "0" && string_lower(a2) != "string") {
        if ((control).ControlType == "slider") {
            GMUI_ControlSliderUpdate(control);
        }
        else if ((control).ControlType == "checkbox" || (control).ControlType == "toggle") {
            GMUI_ControlToggleUpdate(control);
        }
    }
    
    // If a value was set and a script is assigned to value change, execute it
    if (!_invalid && GMUI_IsScript((control).ValueChangedActionScript)) {
        script_execute((control).ValueChangedActionScript);
    }
}

#define GMUI_ShowMenu
///GMUI_ShowMenu("menu name", show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT,_menuName,_animate, _show, _menuNumber;
_SCRIPT = GMUI_ShowMenu;
_menuName = string(argument0);
_show = (argument1 > 0);
_animate = argument2;

// Get menu number
_menuNumber = ds_map_find_value((GMUII()).GMUI_menu_map,_menuName);

if (string(_menuNumber) == "0")
    return false;
    

return GMUI_ShowMenuId(_menuNumber,_show,_animate);

#define GMUI_ShowMenuId
///GMUI_ShowMenuId(menu id, show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT, _GMUII, _animate, _show, _menuNumber, _layerNumber, _masterControl;
_SCRIPT = GMUI_ShowMenu;
_GMUII = GMUII();

if (!is_real(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid menu id", _SCRIPT);
    return false;
}

_menuNumber = argument0;
_show = (argument1 > 0);
_animate = argument2;

if (string(_menuNumber) == "0")
    return false;

_layerNumber = GMUI_GetMenuLayer(_GMUII,_menuNumber);

_masterControl = (_GMUII).GMUI_groupMasterControl[_layerNumber,_menuNumber];

// Switch to menu layer or back, calling animate script if set
if (_show) {
    (_GMUII).GMUI_menuOpenCount += 1;
    GMUI_SwitchToMenu(_GMUII,_menuNumber);
    
    if (_animate && (_masterControl).T_hspeed_group > 0) {
        GMUI_GroupTransitionToActual(_layerNumber, _menuNumber, 
            (_masterControl).T_px_group, (_masterControl).T_py_group, 
            (_masterControl).T_hscript_group, (_masterControl).T_hspeed_group);
    }
    (_masterControl).GroupHidden = false;
}
else {
    GMUI_SwitchToLayer((_masterControl).PreviousMenuLayer);
    (_GMUII).GMUI_menuCurrent = (_masterControl).PreviousMenu;
    
    // Save location before hidden
    //(_masterControl).T_px_group = round(GMUI_groupActualX[_layerNumber,_menuNumber]);
    //(_masterControl).T_py_group = round(GMUI_groupActualY[_layerNumber,_menuNumber]);
    
    // Move to hidden position if set
    if ((_masterControl).T_hspeed_group > 0) {
        if (_animate) {
            GMUI_GroupTransitionToActual(_layerNumber, _menuNumber, 
                (_masterControl).T_hx_group, (_masterControl).T_hy_group, 
                (_masterControl).T_hscript_group, (_masterControl).T_hspeed_group);
        }
        else
            GMUI_GroupSetPositionActual(_layerNumber, _menuNumber, (_masterControl).T_px_group, (_masterControl).T_py_group);
    }
    
    // If there is an post-action, execute it
    if (script_exists((_GMUII).GMUI_groupAction[_layerNumber,_menuNumber])) {
        script_execute((_GMUII).GMUI_groupAction[_layerNumber,_menuNumber]);
    }
    
    (_masterControl).GroupHidden = true;
    
    //if ((GMUII()).GMUI_menuPrevious != 0) {
    //    if (!instance_exists())
    //        GMUI_ThrowErrorDetailed("Menu master control doesn't exist for menu " + string((GMUII()).GMUI_menuPrevious),_SCRIPT);
    //    else if (GMUI_layerNumberExists(((GMUII()).GMUI_groupMasterControl[_layerNumber,_menuNumber])).PreviousMenuLayer) {
    //        
    //    }
    //}
}


GMUI_GroupHide(_menuNumber, _layerNumber, !_show);


//
return true;

#define GMUI_ShowPopup
///GMUI_ShowPopup("popup name", show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT,_popupName, _animate, _show, _popupNumber;
_SCRIPT = GMUI_ShowPopup;
_popupName = string(argument0);
_show = (argument1 > 0);
_animate = argument2;

// Get menu number
_popupNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_popupName);

if (string(_popupNumber) == "0")
    return false;


return GMUI_ShowPopupId(_popupNumber,_show,_animate);

#define GMUI_ShowPopupId
///GMUI_ShowPopupId(popup id, show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT, _GMUII, _animate, _show, _popupNumber, _masterControl;
_SCRIPT = GMUI_ShowPopupId;
_GMUII = GMUII();

if (!is_real(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid popup id", _SCRIPT);
    return false;
}

_popupNumber = argument0;
_show = (argument1 > 0);
_animate = argument2;

if (string(_popupNumber) == "0")
    return false;


// Call the show menu to handle the layer switch
GMUI_ShowMenuId(_popupNumber, _show, _animate);


#define GMUI_SwitchToLayer
///GMUI_SwitchToLayer(Layer number)
///Switches the active layer

// Arguments
var SCRIPT,_LayerNumber;
SCRIPT = GMUI_SwitchToLayer;
_LayerNumber = argument0;

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",SCRIPT);
    return false;
}

// If still running the interface script, also switch the creating on layer
if (!(GMUII()).UIInterfaceSet) {
    GMUI_SetOnLayer(_LayerNumber);
}


(GMUII()).UILayerPrevious = (GMUII()).UILayer;
(GMUII()).UILayer = _LayerNumber;

// .... Disable hovering and selection on all controls


return true;


#define GMUI_TypeDecimal
///GMUI_TypeDecimal()
///Returns the decimal data type

return global.GMUIDataTypeDecimal;

#define GMUI_TypeInt
///GMUI_TypeInt()
///Returns the integer data type

return global.GMUIDataTypeInteger;

#define GMUI_TypeString
///GMUI_TypeString()
///Returns the string data type

return global.GMUIDataTypeString;

#define GMUIid
///GMUIid(number)
///Returns the GMUI object instance with the given GMUI number and sets current grid ref to it
// Usage: with (GMUIid(1)) { do something; }
// Alternate Usage: if (GMUIid(1)) { call GMUI commands; }

if (!is_real(argument0))
    return -1;

if (argument0 > 0 && argument0 <= global.GMUIii) {
    if (instance_exists(global.GMUIiid[argument0])) {
        // Change current GMUI to this one:
        global.GMUIiid[0] = global.GMUIiid[argument0];
        return global.GMUIiid[argument0];
    }
}

return -1;

#define GMUIself
///GMUIself()
///Returns id of the GMUI object instance or -1 if not
// Usage: with (GMUIself()) { do something; }
// Alternate Usage: if (GMUIself()) { call GMUI commands; }

var _gmuii,_G;
_gmuii = -1;

for (_G=1;_G<=global.GMUIii;_G+=1) {
    if (id = global.GMUIiid[_G]) {
        _gmuii = _G;
        break;
    }
}

if (_gmuii > -1) {
    // Change current GMUI to this one:
    global.GMUIiid[0] = id;
    return global.GMUIiid[0];
}

return -1;

#define GMUI_CellGetActualX
///GMUI_CellGetActualX(X Cell #);
/// Internal: Return the actual X of the cell number

return argument0 * ((GMUII()).cellsize);

#define GMUI_CellGetActualY
///GMUI_CellGetActualY(Y Cell #);
/// Internal: Return the actual Y of the cell number

return argument0 * ((GMUII()).cellsize_h);

#define GMUI_ControlActionScript
///GMUI_ControlActionScript(control object) Runs the script assigned to the control, if there is one

if (!GMUI_IsControlID(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ActionScript");
    return false;
}

if ((argument0).ActionScript == -1) {
    GMUI_ThrowError("Action for " + (argument0).valueName +" not implemented");
}
else if (!script_exists((argument0).ActionScript)) {
    GMUI_ThrowError("Invalid script assigned to " + (argument0).valueName + " : " + string((argument0).ActionScript));
}
else {
    script_execute((argument0).ActionScript);
    return true;
}

return false;

#define GMUI_ControlAddToMenuType
///GMUI_ControlAddToMenuType(script [menu type], "menu name")
///Adds control to a group if it exists in the layer

var SCRIPT, _menuName, _menuNumber, _Layer;
SCRIPT = argument0;
_menuName = string(argument1);

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowErrorDetailed("Invalid control",SCRIPT);
    return false;
}

// Get menu number and check its valid
switch (SCRIPT) {
    case GMUI_ControlAddToPopup:
        _menuNumber = ds_map_find_value((GMUIP).GMUI_popup_map,_menuName);
        break;
    case GMUI_ControlAddToMenu:
    default:
        _menuNumber = ds_map_find_value((GMUIP).GMUI_menu_map,_menuName);
        break;
}


if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Menu doesn't exist: " + _menuName,SCRIPT);
    return false;
}

// Control must have a layer that exists (should always be the case)
// Layer value exists in the control
_Layer = GMUI_GetMenuLayer(GMUIP,_menuNumber);
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Control in layer that doesn't exist: " + string(id),SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_menuNumber)) {
    GMUI_ThrowErrorDetailed("Menu "+ _menuName +" doesn't exist for adding control: " + string(valueName),SCRIPT);
    return false;
}

// Assign the control to the menu layer; master control will be reassigned to the exact menu layer (instead of -1)
depth = GMUI_MenuControlDepth(GMUIP,_menuNumber,ControlType) - 1;
Layer = _Layer;

// Finally call the layer and group of the menu to add the control to
if (!GMUI_ControlAddToGroup(_menuNumber))
    return false;

// Menus hidden by default if not on that layer
if ((GMUIP).UILayer < (GMUIP).GMUI_menu_layer || (GMUIP).UILayer != (GMUIP).GMUI_menuCurrent) {
    GMUI_GroupHide(_menuNumber,_Layer,true);
    GroupHidden = true;
}

return true;
    
    

#define GMUI_ControlDrawGroup
///GMUI_ControlDrawGroup(GMUI instance, Layer, Group, Alpha, FadeMode [0 or 1])
///Draws the group if set to do any drawing - Called by master control of group

var _GMUII, _layer, _group, gx, gy, gw, gh, _fadeMode;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_alpha = argument3;
_fadeMode = round(minmax(argument4,0,1));

// Draw the selected group if set from the form
if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group]) {
    GMUI_DrawSpriteBox(_GMUII,_layer,_group,1,_alpha);
}            

if (ControlHasGroupStyle) {
    var x1,x2,y1,y2,xoffset,yoffset,alphadiff;
    xoffset = GMUI_GridViewOffsetX(GMUII());
    yoffset = GMUI_GridViewOffsetY(GMUII());
    
    x1 = (GMUII()).GMUI_groupActualX[_layer,_group] + (GMUII()).GMUI_grid_x[_layer] + xoffset;
    y1 = (GMUII()).GMUI_groupActualY[_layer,_group] + (GMUII()).GMUI_grid_y[_layer] + yoffset;
    x2 = (GMUII()).GMUI_groupActualX[_layer,_group] + 
            (GMUII()).GMUI_groupCellsW[_layer,_group]*(GMUII()).cellsize + (GMUII()).GMUI_grid_x[_layer] + xoffset;
    y2 = (GMUII()).GMUI_groupActualY[_layer,_group] + 
            (GMUII()).GMUI_groupCellsH[_layer,_group]*(GMUII()).cellsize_h + (GMUII()).GMUI_grid_y[_layer] + yoffset;
    alphadiff = GroupBackgroundAlpha - GroupBorderAlpha;
    // Background
    color_alpha(GroupBackgroundColor,min(GroupBackgroundAlpha, _alpha+(alphadiff*(alphadiff<0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,false);
    else
        draw_rectangle(x1,y1,x2,y2,false);
        
    // Border
    color_alpha(GroupBorderColor,min(GroupBorderAlpha, _alpha-(alphadiff*(alphadiff>0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,true);
    else
        draw_rectangle(x1,y1,x2,y2,true);
        
}

#define GMUI_ControlDrawTooltipById
///GMUI_ControlDrawTooltipById(id of tooltip control object)
/// Draw the control as a tooltip

var _tt_id;
_tt_id = argument0;

with (_tt_id) {
    var _txt, cx, cy, cwx, chy, minx, maxx, miny, maxy, padx, pady;
    _txt = valueString;
    cx = RoomX;
    cy = RoomY;
    cwx = RoomW;
    chy = RoomH;
    padx = ControlPaddingX;
    pady = ControlPaddingY;
    
    // Draw the area
    color_alpha(ControlBackgroundColor,min(ControlBackgroundAlpha,FadeAlpha));
    draw_rectangle(cx, cy, cwx+padx*2, chy, 0);
    
    
    // Draw point based on the direction of the tooltip (relative to the parent control)
    // Points are drawn: left corner, right corner, then top
    switch (TT_direction) {
        case global.GMUIAnchorLeft:
            draw_triangle(cx,max(cy,cy+TT_yposition-TT_arrowsize),cx,min(cy+TT_yposition+TT_arrowsize,chy),cx-TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorRight:
            draw_triangle(cwx+padx*2+1,max(cy,cy+TT_yposition-TT_arrowsize),cwx+padx*2+1,min(cy+TT_yposition+TT_arrowsize,chy),cwx+padx*2+1+TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorBottom:
        case global.GMUIAnchorBottomRight:
        case global.GMUIAnchorBottomLeft:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),chy,min(cx+TT_xposition+TT_arrowsize,cwx),chy,cx+TT_xposition,chy+TT_yposition,0);
            break;
        case global.GMUIAnchorTop:
        case global.GMUIAnchorTopLeft:
        case global.GMUIAnchorTopRight:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),cy,min(cx+TT_xposition+TT_arrowsize,cwx),cy,cx+TT_xposition,cy-TT_yposition,0);
            break;
    }
    
    // Set control color, font, and alignment
    color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    draw_set_font(ControlFont);
    align(ControlFontAlign,ControlFontAlignV);
    
    var _dtx, _midHeight;
    _dtx = cx + padx;
    
    draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
    
    //debug
    //color_alpha(c_red,0.15)
    //draw_rectangle(cx, cy, CellWide*(GMUII()).cellsize, chy, 1)
    //draw_rectangle(cx, cy, cwx, chy, 1)
}

#define GMUI_ControlDrawSlider
///GMUI_ControlDrawSlider(id of slider control object)
/// Draw the control as a slider

var _tt_id, _SCRIPT;
_tt_id = argument0;
_SCRIPT = GMUI_ControlDrawSlider;

// todo: check if sizes change for the control, re-calculate these variables (update flag)

with (_tt_id) {
    // If this happens, GMUI has a bug
    if (ControlType != "slider") {
        GMUI_ThrowErrorDetailed("Control Type is not slider!",_SCRIPT);
        return false;
    }
    
    // Assign drawing vars
    var cx, cp, cy, cw, ch, cwx, cwx2, chy, chy2, cworh, RoomWorH, SC, SA;
    cx = RoomX;
    cy = RoomY;
    if (!SliderVertical)
        cp = cx+SliderStartEndPadding;
    else
        cp = cy+SliderStartEndPadding;

    cw = RoomW-cx;
    ch = RoomH-cy;
    cwx = RoomW;
    cwx2 = (RoomX+RoomW)/2;
    chy = RoomH;
    chy2 = (RoomY+RoomH)/2;
    
    // Compute the locations of all drawn elements
    if (!sliderComputed) {
        if (!SliderVertical) {
            RoomWorH = RoomW;
            cworh = cw;
        }
        else {
            RoomWorH = RoomH;
            cworh = ch;
        }
            
        SliderTickDistance = (cworh - (SliderStartEndPadding*2)) / max(SliderTickAmount - 1, 1);
        SliderMidPoint = cworh/2;
        SliderQuarterPoint1 = SliderMidPoint/2 + SliderStartEndPadding/2;
        SliderQuarterPoint2 = cworh - SliderQuarterPoint1;
        SliderSnapDistance = SliderTickDistance/2;
        
        for (i = 0; i < SliderTickAmount; i+=1) {
            SliderTickPoints[i] = SliderStartEndPadding + i*SliderTickDistance;
            
            // If it conflicts with another tick that should be drawn, set to -1 to not draw
            if (i == 0 || i == SliderTickAmount) {
                if (SliderEndTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
            else if (SliderTickPoints[i] == SliderMidPoint) {
                if (SliderMidTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
            else if (SliderTickPoints[i] == SliderQuarterPoint1 || SliderTickPoints[i] == SliderQuarterPoint2) {
                if (SliderQuarterTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
        }
        
        SliderSnapDistance = SliderTickPoints[i-1] - SliderTickPoints[i-2];
        
        // Check if the slider position is within the padding amount
        GMUI_ControlSliderUpdate(id);
        SliderRelativeFinalXorY = minmax(SliderRelativeFinalXorY,SliderStartEndPadding,RoomWorH-SliderStartEndPadding);
        SliderRelativeXorY = SliderRelativeFinalXorY;
        Slider_t = Slider_d;
        
        sliderComputed = true;
    }
    
    // Draw the slider region first, based on type
    if (SliderTickStyle == 2 || SliderTickStyle == 3) {
        color_alpha(SliderBackgroundColor,SliderBackgroundAlpha);
    }
    switch (SliderTickStyle) {
        case 1: // Free (No horizontal line)
        
            break;
        case 2: // Single (Horizontal line)
            if (!SliderVertical)
                draw_line(cp,chy2,cwx-SliderStartEndPadding,chy2);
            else
                draw_line(cwx2,cp,cwx2,chy-SliderStartEndPadding);
            break;
        case 3: // Rounded rectangle region
            if (!SliderVertical)
                draw_roundrect(cp,chy2-SliderSlideHeight/2,cwx-SliderStartEndPadding,chy2+SliderSlideHeight/2,false);
            else
                draw_roundrect(cwx2-SliderSlideHeight/2,cp,cwx2+SliderSlideHeight/2,chy-SliderStartEndPadding,false);
            break;
        case 0: // none (slider only), or sprite
        default:
            
            break;
    }
    
    // If 0 draw none, optionally use sprite script instead
    if (SliderTickStyle > 0) {
        // Set the properties of the ticks
        color_alpha(SliderTickColor,SliderTickAlpha);
        
        if (SliderTickHeight > 0 && SliderTickDistance > 1) {
            if (!SliderVertical) {
                for (i = 0; i < SliderTickAmount; i+=1) {
                    if (SliderTickPoints[i] >= 0) {
                        draw_line(cx+SliderTickPoints[i],chy2-SliderTickHeight,cx+SliderTickPoints[i],chy2+SliderTickHeight);
                    }
                }
            }
            else {
                for (i = 0; i < SliderTickAmount; i+=1) {
                    if (SliderTickPoints[i] >= 0) {
                        draw_line(cwx2-SliderTickHeight,cy+SliderTickPoints[i],cwx2+SliderTickHeight,cy+SliderTickPoints[i]);
                    }
                }
            }
        }
        
        // Draw the special ticks
        if (!SliderVertical) {
            if (SliderEndTickHeight > 0) {
                draw_line(cp,chy2-SliderEndTickHeight,cp,chy2+SliderEndTickHeight);
                draw_line(cwx-SliderStartEndPadding,chy2-SliderEndTickHeight,cwx-SliderStartEndPadding,chy2+SliderEndTickHeight);
            }
            
            if (SliderMidTickHeight > 0) {
                draw_line(cx+SliderMidPoint,chy2-SliderMidTickHeight,cx+SliderMidPoint,chy2+SliderMidTickHeight);
            }
            
            if (SliderQuarterTickHeight > 0) {
                draw_line(cx+SliderQuarterPoint1,chy2-SliderQuarterTickHeight,cx+SliderQuarterPoint1,chy2+SliderQuarterTickHeight);
                draw_line(cx+SliderQuarterPoint2,chy2-SliderQuarterTickHeight,cx+SliderQuarterPoint2,chy2+SliderQuarterTickHeight);
            }
        }
        else {
            if (SliderEndTickHeight > 0) {
                draw_line(cwx2-SliderEndTickHeight,cp,cwx2+SliderEndTickHeight,cp);
                draw_line(cwx2-SliderEndTickHeight,chy-SliderStartEndPadding,cwx2+SliderEndTickHeight,chy-SliderStartEndPadding);
            }
            
            if (SliderMidTickHeight > 0) {
                draw_line(cwx2-SliderMidTickHeight,cy+SliderMidPoint,cwx2+SliderMidTickHeight,cy+SliderMidPoint);
            }
            
            if (SliderQuarterTickHeight > 0) {
                draw_line(cwx2-SliderQuarterTickHeight,cy+SliderQuarterPoint1,cwx2+SliderQuarterTickHeight,cy+SliderQuarterPoint1);
                draw_line(cwx2-SliderQuarterTickHeight,cy+SliderQuarterPoint2,cwx2+SliderQuarterTickHeight,cy+SliderQuarterPoint2);
            }
        }
    }
    else if (0) {
    //not yet implemented
    }
    
    // Check if selected or not
    //todo: implement
    SC = SliderColor;
    SA = SliderAlpha;
    
    // Draw slider based on type
    switch (SliderStyle) {
        case 1: // Circle
        
            break;
        case 2: // PentagonUp
            if (!SliderVertical) {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_primitive_end();
            }
            else {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,SliderAlpha);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,SliderAlpha);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,SliderAlpha);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,SliderAlpha);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,SliderAlpha);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,SliderAlpha);
                draw_primitive_end();
            }
            break;
        case 3: // PentagonDown
            if (!SliderVertical) {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(-1+cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
                draw_primitive_end();
            }
            else {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,SliderBorderAlpha);
                draw_primitive_end();
            }
            break;
        case 4: // Rectangle
        //SliderThumbWidth
        //SliderThumbHeight
        //SliderRelativeX
        //SliderRelativeFinalX
        // slider location????
            //draw_rectangle(
            break;
        case 5: // Rounded Rectangle
        
            break;
        case 6: // Hexagon
        
            break;
    }
    
    //user defined (move these to the step portion? controldraw?)
    //SliderRoundToSnap = (argument4 > 0);
    //SliderSnap = (argument5 > 0);
    //SliderSmoothSnap = (argument6 > 0);
    
    // implement these above:
    //SliderBorderColor = argument6;
    //SliderBorderAlpha = minmax(argument7,0,1);
    //SliderSelectColor = argument8;
    //SliderSelectAlpha = minmax(argument9,0,1);
    
    
    
    //todo: drawing the value in/below the control may be an option later on?
    
    //color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    
    //var _dtx, _midHeight;
    //_dtx = cx + padx;
    
    //draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
}

#define GMUI_ControlDrawToggle
///GMUI_ControlDrawToggle(id of toggle control object)
/// Draw the control as a toggle

var _tt_id, _SCRIPT;
_tt_id = argument0;
_SCRIPT = GMUI_ControlDrawToggle;

with (_tt_id) {
    // If this happens, GMUI has a bug
    if (ControlType == "toggle") {
        // Draw toggle control
        //var cpx,cpx2,cpy,cpy2,chh,cx2,cw2,cy2,ch2,chw2,chy2,
        var chh, cx1, cy1, cx2, cy2, cxrp, cyrp, _tt, _tp, TSC,TSA,deg,degp,d;
        if (ToggleOrientation == global.GMUIDirectionTypeHorizontal) {
            
            // new:
            chh = ceil((RoomH - RoomY) / 2); // half height
            cx1 = RoomX + TogglePadding;
            cy1 = RoomY;
            cx2 = RoomW - TogglePadding;
            cy2 = RoomH;
            // for full rounded:
            cxrp = chh;
            cyrp = 1;
            
            deg = 90;
        }
        else {
            
            chh = ceil((RoomW - RoomX) / 2); // half height
            cx1 = RoomX;
            cy1 = RoomY + TogglePadding;
            cx2 = RoomW;
            cy2 = RoomH - TogglePadding;
            // for full rounded:
            cxrp = 1;
            cyrp = chh;
            
            deg = 0;
        }
        
        degp = 2; // degree precision for half circle
        _tp = ToggleThumbPad; // padding between 'thumb' and slide edge
        _tt = ToggleThumbSize; // width/height of the 'thumb'
        
        if (Toggle_t < Toggle_d) {
            TSC = merge_color(ToggleSlideColorOff,ToggleSlideColorOn,ToggleRelativeXorY/(ToggleFinalXorY-ToggleInitialXorY));
        }
        else if (value)
            TSC = ToggleSlideColorOn;
        else
            TSC = ToggleSlideColorOff;
            
        TSA = ToggleSlideAlpha;
        
        // Draw slide region
        draw_set_color(TSC);
        draw_set_alpha(TSA);
        switch (ToggleSlideShape) {
            case global.GMUISlideNone: // -1 Custom (No slide)
                break;
            case global.GMUISlideLine: // -2 Single (Horizontal line)
                draw_line(cx1+chh,cy1+chh,cx2-chh,cy2-chh);
                break;
            case global.GMUISlideRect: // -3
                draw_rectangle(cx1,cy1,cx2,cy2,0);
                break;
            case global.GMUISlideRoundRect: // -4
                draw_roundrect(cx1,cy1,cx2,cy2,0);
                break;
            case global.GMUISlideFullRoundRect: // -5
                draw_rectangle(cx1+cxrp,cy1+cyrp-(global.GMUIGameMaker8 <= 0),cx2-cxrp,cy2-cyrp,0);
                
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx1+chh,cy1+chh,TSC,TSA);
                for (d=deg; d <= deg+180; d+=degp) {
                    draw_vertex_color(cx1+chh+lengthdir_x(chh,d),cy1+chh+lengthdir_y(chh,d),TSC,TSA);
                }
                draw_primitive_end();
                
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx2-chh,cy2-chh,TSC,TSA);
                for (d=deg; d <= deg+180; d+=degp) {
                    draw_vertex_color(cx2-chh+lengthdir_x(chh,d+180),cy2-chh+lengthdir_y(chh,d+180),TSC,TSA);
                }
                draw_primitive_end();
                
                break;
            case 0: // none (slider only), or sprite
            default:
                break;
        }
        
        // Draw toggle thumb
        if (Toggle_t < Toggle_d)
            draw_set_color(merge_color(ToggleColorOff,ToggleColorOn,ToggleRelativeXorY/(ToggleFinalXorY-ToggleInitialXorY)));
        else if (value)
            draw_set_color(ToggleColorOn);
        else
            draw_set_color(ToggleColorOff);
        draw_set_alpha(ToggleAlpha);
        
        if (ToggleOrientation == global.GMUIDirectionTypeHorizontal)
            cx1 += ToggleRelativeXorY;
        else
            cy1 += ToggleRelativeXorY;
        
        // For now, just draw the shape that corresponds to the slide shape
        if (ToggleSlideShape >= global.GMUISlideRect) {
            draw_rectangle(cx1+_tp, cy1+_tp, cx1+_tt-_tp, cy1+_tt-_tp, 0);
        }
        else if (ToggleSlideShape == global.GMUISlideRoundRect) {
            draw_roundrect(cx1+_tp, cy1+_tp, cx1+_tt-_tp, cy1+_tt-_tp, 0);
        }
        else if (ToggleSlideShape == global.GMUISlideFullRoundRect) {
            draw_circle(cx1+chh,cy1+chh-(global.GMUIGameMaker8 <= 0),chh-_tp,0);
        }
        else {
            if (ToggleOrientation == global.GMUIDirectionTypeHorizontal)
                draw_roundrect(cpx+tp+chh/2, cpy+tp+chh, cpx-tp+chh, cpy-tp+chh, 0);
            else
                draw_roundrect(cpx+tp+chh, cpy+tp+chh/2, cpx-tp+chh*1.5, cpy-tp+chh*1.5, 0);
        }
        
    }
    else if (ControlType == "checkbox") {
        // Draw checkbox control
        var TSC,TA,TC,SII;
        TC = ToggleColorOff;
        if (Toggle_t < Toggle_d) {
            TSC = merge_color(ToggleSlideColorOff,ToggleSlideColorOn,ToggleRelativeXorY);
            GMUI_GridUpdateLayer(GMUIP,Layer);
        }
        else if (value)
            TSC = ToggleSlideColorOn;
        else
            TSC = ToggleSlideColorOff;
        TA = ToggleAlpha;
        // Draw box
        if (ToggleSlideShape >= 0) {
            draw_sprite(ToggleSlideShape,0, RoomX + TogglePadding, RoomY + TogglePadding);
        }
        else {
            draw_set_color(TSC);
            draw_set_alpha(TA);
            draw_rectangle(RoomX + TogglePadding, RoomY + TogglePadding, RoomW - TogglePadding, RoomH - TogglePadding, 0);
            draw_set_color(TC);
            draw_rectangle(RoomX + TogglePadding, RoomY + TogglePadding, RoomW - TogglePadding, RoomH - TogglePadding, 1);
        }
        
        // Draw check
        if (ControlGraphic > -1) {
            if (value) {
                if (Hovering)
                    SII = ControlGraphicHoveringIndex;
                else if (Selected)
                    SII = ControlGraphicSelectedIndex;
                else
                    SII = ControlGraphicIndex;
                draw_sprite_ext(ControlGraphic, SII, RoomX + TogglePadding, RoomY + TogglePadding, 1,1,0,c_white, ToggleRelativeXorY);
            }
        }
        else {
            draw_set_color(ToggleColorOn);
            draw_set_alpha(ToggleRelativeXorY);
            draw_rectangle(RoomX+TogglePadding+3, RoomY+TogglePadding+3, RoomW-TogglePadding-3, RoomH-TogglePadding-3, 0);
        }
    }
    else {
        GMUI_ThrowErrorDetailed("Control Type is not toggle/checkbox!",_SCRIPT);
        return false;
    }
    
    return true;
    
    
}

#define GMUI_ControlInit
///GMUI_ControlInit(control object to instantiate)
/// Initialize the values to use with a GMUI control
// These values are controlled by the GMUI controller, and if commented, they are actually intialized by the Add script.

var i; i = argument0;

if (!instance_exists(i))
    return false;
    
// The parent GMUI Instance
i.GMUIP = -1;

// Previous menu if control is in a menu
i.PreviousMenu = 0;
i.PreviousMenuLayer = 0;


i.Hovering = 0;
i.Selected = 0;
i.DoubleSelected = 0;
i.Holding = 0;
i.HoldingTime = 0;
i.HoldingThreshold = 5; // Steps before a click is registed as a holding click

i.ControlType = "";
i.ControlDataType = global.GMUIDataTypeString; // Default (0)

i.NeedsPositionUpdate = false;
i.NeedsDrawUpdate = false;

// Redundant control options based on the datatype
i.ControlIsNumeric = false;
i.ControlIsString = true;
i.ControlInput = false;
i.ControlPicker = false;

i.ControlShowValue = true;
i.ControlInteraction = true;
i.ControlSelectable = true;

// For specific controls
i.checkMouseX = 0;
i.checkMouseY = 0;
i.HoveringDirection = 0; // 0 = middle/none (HoveringDirection_None), HoveringDirection_Right=1;HoveringDirection_Up=2;HoveringDirection_Left=3;HoveringDirection_Down=4;
i.toggleInitialized = true; // default skip toggle values
i.optionsInitialized = true; // default skip option values

// Control Status
i.Disabled = 0;
i.Hidden = 0;

// Group Status (if master control)
i.GroupHidden = false;

// NonClickable may be used when a control is moving, for instance. It does not show disabled, but will not register a click
i.NonClickable = 0;

// Custom Actions
i.ActionScript = -1;
i.HoverActionScript = -1;
i.HoverOffActionScript = -1;
i.SelectingActionScript = -1;
i.DeselectActionScript = -1;
i.ValueChangedActionScript = -1;

// All of these values are set when added ::

// Layer can disable the control if a higher layer is opened (0 is default)
//Layer = 0;
// Control can be added to an additional layer and work in both and any layers in-between
i.AdditionalLayer = -1;

// Group allows actions for a group of controls, such as disabling, moving, and hiding (0 is no-group)
//Group = 0;

// Cells work like the room grid and are assigned numbers baised on the cell dimensions given
//CellWide = 1;
//CellHigh = 1;
//CellWideMax = 1;
//CellHighMax = 1;
//CellX = 0;
//CellY = 0;

// Horizontal font alignment always set on creation
//ControlFontAlign = fa_left;
i.ControlFontAlignV = fa_middle;
i.ControlPaddingX = 4;
i.ControlPaddingY = 4;

// ::


// Positioning variables
i.IsAdjusted = false;
// Actual size may be used to use pixel-baised boundary box for the control; still must be within cell block (0 is full cell)
i.ActualW = 0;
i.ActualH = 0;

// Relative position is used if the boundary box should be adjusted
i.RelativeX = 0;
i.RelativeY = 0;

// Actual location may be used when moving controls, however the selection will need to change the grid cell it is in
i.ActualX = x;
i.ActualY = y;

// Real room location after adjustments made to the grid, boundary, and offsets
i.RoomX = 0;
i.RoomY = 0;
i.RoomW = 0;
i.RoomH = 0;

// Graphical variables
i.outboundMax = ceil(room_speed/3);
i.outbound = 0;
i.inboundMax = ceil(room_speed/3);
i.inbound = 0;

// Tooltip variables (relative)
i.TooltipId = -1;
i.TT_arrowsize = 16;
i.TT_xposition = 0;
i.TT_yposition = 0;
i.TT_direction = 0;
i.TT_minx = 0;
i.TT_miny = 0;
i.TT_maxx = 0;
i.TT_maxy = 0;
i.TT_relativeCellX = 0;
i.TT_relativeCellY = 0;

// Transitions: time: t, begin: xy, change: xy, delta: d
i.Transitioning = false;
i.TransitioningGroup = false;
i.TransitionScript = -1;

i.T_t = 0;
i.T_bx = 0;
i.T_cx = 0;
i.T_by = 0;
i.T_cy = 0;
i.T_d = room_speed;

i.T_bx_group = 0;
i.T_by_group = 0;
i.T_cx_group = 0;
i.T_cy_group = 0;

// Destination coordinates
i.T_dx_group = 0;
i.T_dy_group = 0;

// For hide positioning
i.T_hx_group = 0;
i.T_hy_group = 0;
i.T_hrelx_group = 0;
i.T_hrely_group = 0;
i.T_px_group = 0;
i.T_py_group = 0;
i.T_hscript_group = -1;
i.T_hspeed_group = 0; // User must set speed to activate

// Effects
i.FadeAlpha = 1; // of 1
i.FadeIn = 1;
i.FadeOut = 0;
i.FadeTime = room_speed; // in steps
i.FadeCalled = 0; // 0 for none, 1 for up, -1 for down
i.FadeOnHide = false;
i.FadeMode = 0; // Fade Mode: 0 = fade dimmest last, 1 = fade all together


// Value variables
i.value = 0;
i.valueString = "0";
i.valueSetting = 0;
i.valuePrevious = i.value;
i.valueStringPrevious = i.valueString;
i.valueChangeDetected = 0;



/// ???:
// The control will be disabled for this many steps before allowing action
//i.Disable = floor(room_speed/20);

#define GMUI_ControlIsInLayer
///GMUI_ControlIsInLayer(control, layer)
var _ctl,_L;

_ctl = argument0;
_L = argument1;

if ((_ctl).Layer == _L)
    return true;
    
// Check if it has been added to another layer (nested if's for small GML performance improvement)
if ((_ctl).AdditionalLayer != -1) {
    if ((_ctl).AdditionalLayer > (_ctl).Layer) {
        if (_L <= (_ctl).AdditionalLayer) {
            if (_L > (_ctl).Layer)
                return true;
        }
    }
    else if (_L >= (_ctl).AddtionalLayer) {
        if (_L < (_ctl).Layer)
            return true;
    }
}
    
return false;

#define GMUI_ControlFilterInput
///GMUI_ControlFilterInput(Control Type, Input String - keyboard_string)
///Modifies keyboard string to be acceptable for the control. Typcially called on a keypress.
// Returns: new input string

var filter, CT, ks, _getDataType, isNumeric;
CT = string_lower(string_replace(string(argument0)," ",""));
ks = argument1;

_getDataType = GMUI_GetDataType(CT);

if (_getDataType == global.GMUIDataTypeInteger || _getDataType == global.GMUIDataTypeDecimal)
    isNumeric = true;
else
    isNumeric = false;

    
// Numerics
if (isNumeric) { 
    // Check that the last character entered is valid
    filter = string_copy(ks,string_length(ks),1);
    if (string_digits(filter) == "" && filter != ".") {
        if (!(string_length(ks) == 1 && string_copy(ks,1,1) == "-"))
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    
    // Limitation of a numeric in GM
    if (string_length(string_digits(ks)) > 17)
        ks = string_copy(ks,1,18-(18 - string_length(string_digits(ks))));
    
    // Only one minus sign and decimal point allowed
    filter = string_copy(ks,string_length(ks),1);
    if (filter == "-" || filter == ".")
    {
        if (string_count("-",ks) > 1 || string_count(".",ks) > 1)
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    else
    {
        // Apply zero's rule
        if (string_copy(ks,1,2) == "00")
            ks = string_copy(ks,2,string_length(ks)-1);
        else if (string_copy(ks,1,1) == "0" && string_length(ks) > 1 && string_copy(ks,2,1) != ".")
            ks = string_copy(ks,2,string_length(ks)-1);
    }
}
else if (_getDataType == global.GMUIDataTypeString) {
    // Any string limitations can go here.
    // (They will probably be optional, like only allow alphabet or alphanumeric or custom or something...
}

return ks;


#define GMUI_ControlPositionToGroup
///GMUI_ControlPositionToGroup(Control id)

with (argument0) {
    // Reset positioning to base on group's position
    CellX = GMUI_GetAnchoredCellX((GMUIP).GMUI_groupCellsW[Layer,Group],RelativeCellX,Anchor) + (GMUIP).GMUI_groupCellX[Layer,Group];
    CellY = GMUI_GetAnchoredCellY((GMUIP).GMUI_groupCellsH[Layer,Group],RelativeCellY,Anchor) + (GMUIP).GMUI_groupCellY[Layer,Group];
    
    ActualX = GMUI_CellGetActualX(CellX);
    ActualY = GMUI_CellGetActualY(CellY);
    
    
    // If control is outside of the group boundaries, expand the group to fit it
    if (CellX + CellWide > (GMUIP).GMUI_groupCellX[Layer,Group] + (GMUIP).GMUI_groupCellsW[Layer,Group]) {
        (GMUIP).GMUI_groupCellsW[Layer,Group] = CellX + CellWide - (GMUIP).GMUI_groupCellX[Layer,Group];
    }
    if (CellY + CellHigh > (GMUIP).GMUI_groupCellY[Layer,Group] + (GMUIP).GMUI_groupCellsH[Layer,Group]) {
        (GMUIP).GMUI_groupCellsH[Layer,Group] = CellY + CellHigh - (GMUIP).GMUI_groupCellY[Layer,Group];
    }
    
    // Update control draw location in the room
    GMUI_ControlUpdateXY(id);
}


#define GMUI_ControlSetDefaultAttributes
///GMUI_ControlSetDefaultAttributes(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultAttributes");
    return false;
}

with (argument0)
{
    GMUI_ControlSetAttributes(
    (GMUII()).ControlMaxStringLength,
    (GMUII()).ControlMaxDecimalLength,
    (GMUII()).ControlMinValue,
    (GMUII()).ControlMaxValue
    );
}


return true;

#define GMUI_ControlSetDefaultButton
///GMUI_ControlSetDefaultButton(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultButton");
    return false;
}

with (argument0)
{
    GMUI_ControlSetButton(
    (GMUII()).ControlButtonText,
    (GMUII()).ControlButtonGraphic,
    (GMUII()).ControlFontAlign,
    (GMUII()).ControlButtonTextHoverColor
    );
}


return true;

#define GMUI_ControlSetDefaultFontStyle
///GMUI_ControlSetDefaultStyle(id)
/// Get the default style values from the grid controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultFontStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetFontStyle(
    (GMUII()).ControlFont,
    (GMUII()).ControlFontColor,
    (GMUII()).ControlFontAlign
    );
}

return true;

#define GMUI_ControlSetDefaultPicker
///GMUI_ControlSetDefaultPicker(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultPicker");
    return false;
}

with (argument0)
{
    GMUI_ControlSetPicker(
    (GMUII()).ControlPickerWidth,
    (GMUII()).ControlPickerHeight,
    (GMUII()).ControlPickerDirection,
    (GMUII()).ControlPickerSpriteRightOrUp,
    (GMUII()).ControlPickerSpriteLeftOrDown
    );
}


return true;

#define GMUI_ControlSetDefaultSprite
///GMUI_ControlSetDefaultSprite(id)
///Set the default attributes of the control from the controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetDefaultSprite);
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteExt(
        (GMUII()).ControlGraphic,
        (GMUII()).ControlGraphicIndex,
        (GMUII()).ControlGraphicHoveringIndex,
        (GMUII()).ControlGraphicSelectedIndex,
        (GMUII()).ControlGraphicXScale,
        (GMUII()).ControlGraphicYScale,
        (GMUII()).ControlGraphicColor,
        (GMUII()).ControlGraphicAlpha
    );
    
    ControlGraphicRotation = 0;
}


return true;

#define GMUI_ControlSetDefaultSpriteMap
///GMUI_ControlSetDefaultSpriteMap(id)
///Set the default attributes of the control from the controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetDefaultSpriteMap);
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteMap(
        (GMUII()).ControlGraphicTop,
        (GMUII()).ControlGraphicTopRight,
        (GMUII()).ControlGraphicRight,
        (GMUII()).ControlGraphicBottomRight,
        (GMUII()).ControlGraphicBottom,
        (GMUII()).ControlGraphicBottomLeft,
        (GMUII()).ControlGraphicLeft,
        (GMUII()).ControlGraphicTopLeft,
        (GMUII()).ControlGraphicCenter,
        (GMUII()).ControlGraphicCenterIsFixed
    );
    
    ControlGraphicMapIsUsed = false;
}


return true;

#define GMUI_ControlSetDefaultStyle
///GMUI_ControlSetDefaultStyle(id)
/// Get the default style values from the grid controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetStyle(
    (GMUII()).ControlBackgroundColor,
    (GMUII()).ControlBorderColor,
    (GMUII()).ControlHoverColor,
    (GMUII()).ControlHoverBorder,
    (GMUII()).ControlHoverAlpha,
    (GMUII()).ControlOverwriteColor,
    (GMUII()).ControlOverwriteAlpha,
    (GMUII()).ControlSelectColor,
    (GMUII()).ControlSelectAlpha,
    (GMUII()).ControlShowCursor
    );
}

return true;

#define GMUI_ControlSetType
///GMUI_ControlSetType(Control, "Control Type")
///Set the type variables based on the control the developer wants to make

var IID,            _type,           _getType;
    IID=argument0;  _type=argument1; _getType=0;

if (!GMUI_IsControlID(IID) && IID != GMUII()) {
    GMUI_ThrowError("Invalid control for GMUI_ControlSetType");
    return "";
}

// Sanitation of type input from developer
_type = string_lower(string_replace(_type," ",""));

// Set if input, or button, or etc 
switch (_type) {
    case "spritepicker":
        (IID).ControlPicker = true;
        (IID).optionsInitialized = false;
        break;
    case "intpicker":
    case "doublepicker":
        (IID).ControlPicker = true;
        
    case "textint":
    case "textdecimal":
    case "textstring":
        (IID).ControlInput = true;
        
        break;
    case "button":
    case "textbutton":
        (IID).ControlSelectable = false;
        break;
    case "slider":
        (IID).sliderInitialized = false;
        (IID).sliderComputed = false;
        (IID).ControlShowValue = false;
        break;
    case "toggle":
    case "checkbox":
        (IID).toggleInitialized = false;
        (IID).ControlSelectable = false;
        break;
    case "sprite":
        _type = "image";
    case "image":
        (IID).ControlInput = false;
        (IID).ControlSelectable = false;
        break;
    case "dropdown":
        
        break;
    case "label":
    case "tooltip":
        (IID).ControlInteraction = false;
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

(IID).ControlType = _type;


// Set the data type
_getType = GMUI_GetDataType(_type);
(IID).ControlDataType = _getType;

if (_getType == global.GMUIDataTypeInteger || _getType == global.GMUIDataTypeDecimal || _getType == global.GMUIDataTypeBoolean) {
    (IID).ControlIsNumeric = true;
    (IID).ControlIsString = false;
}
else if (_getType == global.GMUIDataTypeString) {
    (IID).ControlIsString = true;
    (IID).ControlIsNumeric = false;
}

// Return sanitized and processed type back
return _type;



#define GMUI_ControlSliderMove
///GMUI_ControlSliderMove([bool] Move to mouse, else stop and set)
///Called by control. Move the position of the thumb based on mouse position or stop where the mouse is

// Update adjustment
if (argument0) {
    var MX,MY;
    MX = mouse_x-(GMUIP).GMUI_grid_x[Layer];
    MY = mouse_y-(GMUIP).GMUI_grid_y[Layer];
    
    if (!SliderVertical)
        SliderRelativeFinalXorY = minmax(MX,RoomX+SliderStartEndPadding,RoomW-SliderStartEndPadding)-RoomX;
    else
        SliderRelativeFinalXorY = minmax(MY,RoomY+SliderStartEndPadding,RoomH-SliderStartEndPadding)-RoomY;
}
    
// Set value to position
var vald,pad2,vali;
vald = ControlMaxValue-ControlMinValue;
pad2 = SliderStartEndPadding*2;

if (!SliderVertical)
    valueSetting = vald*(SliderRelativeFinalXorY-SliderStartEndPadding)/(RoomW-RoomX-pad2)+ControlMinValue;
else
    valueSetting = vald*(SliderRelativeFinalXorY-SliderStartEndPadding)/(RoomH-RoomY-pad2)+ControlMinValue;
    
if (SliderRoundValuesToSnap) {
    vali = vald/(SliderTickAmount-1);
    valueSetting = round(valueSetting/vali)*vali;
}
    
// Set transitioning values if smoothsnap on
if (SliderSmoothSnap) {
    if (script_exists(SliderMovementScript)) {
        if (round(Slider_c) != round(SliderRelativeFinalXorY-SliderRelativeXorY)) {
            Slider_t = 0;
            Slider_b = SliderRelativeXorY;
            if (SliderSnap){
                Slider_c = round((SliderRelativeFinalXorY-SliderStartEndPadding)/SliderSnapDistance)*SliderSnapDistance
                    + SliderStartEndPadding - SliderRelativeXorY;
            }
            else {
                Slider_c = SliderRelativeFinalXorY-SliderRelativeXorY;
            }
        }
        
        if (Slider_t < Slider_d) {
            Slider_t += 1;
            SliderRelativeXorY = script_execute(SliderMovementScript,Slider_t,Slider_b,Slider_c,Slider_d);
        }
        else {
            Slider_t = Slider_d;
        }
    }
}
else {
    Slider_t = 0;
    
    if (SliderSnap)
        SliderRelativeXorY = round((SliderRelativeFinalXorY-SliderStartEndPadding)/SliderSnapDistance)*SliderSnapDistance
            + SliderStartEndPadding;
    else
        SliderRelativeXorY = SliderRelativeFinalXorY;
}

    
// Update actual value
if (!argument0) {
    if (real(value) != valueSetting)
        GMUI_SetValue(valueName,valueSetting,2);
}


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

#define GMUI_ControlToggleUpdate
///GMUI_ControlToggleUpdate(Control ID)
///Resets toggle timing for the animation

with (argument0) {
    if (Toggle_t == Toggle_d)
        Toggle_t = 0;
    else
        Toggle_t = Toggle_d - Toggle_t;
}

#define GMUI_ControlUpdateXY
///GMUI_ControlUpdateXY(control)
///Updates the actual location in the room after adjustments

var _ctrl, _GMUIP, _xoffset, _yoffset, _lw, _lh;
_ctrl = argument0;
_GMUIP = (_ctrl).GMUIP;

if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlUpdateXY);
    return false;
}

_xoffset = GMUI_GridViewOffsetX(_GMUIP);
_yoffset = GMUI_GridViewOffsetY(_GMUIP);

_lw = GMUI_GridGetWidth((_ctrl).GMUIP,(_ctrl).Layer);
_lh = GMUI_GridGetHeight((_ctrl).GMUIP,(_ctrl).Layer);

// X,Y position
(_ctrl).RoomX = (_ctrl).ActualX + (_ctrl).RelativeX + (_GMUIP).GMUI_grid_x[(_ctrl).Layer] + _xoffset;
(_ctrl).RoomY = (_ctrl).ActualY + (_ctrl).RelativeY + (_GMUIP).GMUI_grid_y[(_ctrl).Layer] + _yoffset;

// Width and height
if ((_ctrl).ActualW > 0)
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).ActualW;
else
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).CellWide * (_GMUIP).cellsize;
    
if ((_ctrl).ActualH > 0)
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).ActualH;
else
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).CellHigh * (_GMUIP).cellsize_h;
    
// If the control has a tooltip, update the tooltip location (based on top-left)
if ((_ctrl).TooltipId != -1) {
    GMUI_ControlPosition((_ctrl).TooltipId,
        (_ctrl).CellX + ((_ctrl).TooltipId).TT_relativeCellX,
        (_ctrl).CellY + ((_ctrl).TooltipId).TT_relativeCellY,
        ((_ctrl).TooltipId).RelativeX,
        ((_ctrl).TooltipId).RelativeY,
        global.GMUIAnchorTopLeft);
    ((_ctrl).TooltipId).NeedsPositionUpdate = true;
}

#define GMUI_CreateEvent
///GMUI_CreateEvent(Form Script, Cell Width, Cell Height)
///Called from creation of new GMUI instance for the grid interfaces and variables

// // Create grid variables
// Is this already using a GMUI? Assign the instance number as long as its not
var isOk,G;
isOk = 1;
for (G=1;G<=global.GMUIii;G+=1) {
    if (id = global.GMUIiid[G]) {
        isOk = 0;
        break;
    }
}
    
if (!isOk)
    return 0;
else {
    // New ID
    global.GMUIii += 1;
}

// Define the instance & number running GMUI
global.GMUIiid[global.GMUIii] = id;
GMUInumber = global.GMUIii;
// Current grid is now this one. The 0 index is the currently active grid
global.GMUIiid[0] = id;


// Initial time to not execute any actions from the grid
InitialDisable = floor(room_speed/20); // Default 1/20th of a second
// Freeing GMUI data
RemovingGMUI = false;
// Layer that is currently enabled (0 is the bottom-most)
UILayer = 0;
// Highest layer, for reference
UILayerTop = 0;
// Layer that was enabled before the current
UILayerPrevious = 0;
// Layer that is being added to
UIAddToLayer = 0;
// Will only switch layer being added to until complete
UIInterfaceSet = false;

// Other specific functionality settings that can be turned off if unwanted
GMUI_Settings(argument0);

// Set the default layering depths
GMUI_SetLayerDepths();

// Previous values of the mouse to determine if it has moved or not
mouse_px = 0;
mouse_py = 0;
previousHoveringControl = -1;

// Debug information
if (DebugData) {
    TestInRegion = -1;
    TestOnDirection = -1;
    TestHoverObject = -1;
}
    
// Rather pointless to be redundant but it gives more flexibility if you really need it...
persistence = persistent;

// Error management (DEBUG)
GMUI_Error[0] = "";
GMUI_ErrorNumber = 0;

    
// Get cellsize arguments (w,h)
if (argument1 < 1)
    cellsize = 16;
else
    cellsize = argument1;
if (argument2 < 1)
    cellsize_h = cellsize;
else
    cellsize_h = argument2;
    
// Set the interface area for new layers, using view 0 if enabled. Can be adjusted later
GMUI_CreateSetDefaultArea();



// Grid setup (New layers will have their own grids)
GMUI_gridlist = ds_list_create();
GMUI_defaultX = 0;
GMUI_defaultY = 0;
GMUI_grid_Transition = false; // Any layer is transitioning flag

GMUI_AddLayer(0,GMUI_defaultX,GMUI_defaultY);

// Navigation settings
GMUI_navigateDirection = -1;
GMUI_backKey = -1;
GMUI_forwardKey = -1;
GMUI_backAltKey = -1;
GMUI_forwardAltKey = -1;
GMUI_enableTab = true;


// Map setup for control name keys to instances
GMUI_map = ds_map_create();

// List of all controls
GMUI_controlList = ds_list_create();

// Create all of the default control settings
GMUI_SetControlDefaults();

// Currently hovering or selecting on control for controls to revert if not them
HoveringControl = -1;
SelectedControl = -1;
PreviousSelectedControl = -1;

// An offset change will trigger repositioning controls
previousXOffset = 0;
previousYOffset = 0;


// Map setup for menu name keys to group id's
GMUI_menu_map = ds_map_create();
GMUI_menu_layer = layerDepth_maxLayers;

GMUI_menuLastId = 0;
GMUI_menuCurrent = 0;
GMUI_menuOpenCount = 0;
GMUI_menuResponse = 0; // Cancel:-1, No: 0, Yes: 1

// Popup setup for popup name keys to group id's; uses menu id's for reference
GMUI_popup_map = ds_map_create();

// Warnings
GMUI_warnings_map = ds_map_create();


// Grouping variables (handled in GMUI_AddLayer())
// List of groups per layer [layer number; default 0]
//GMUI_groupList[0] = ds_list_create();
// List of controls per group [layer number, group number]
//GMUI_groupControlList[0,0] = ds_list_create();

//Positioning
GMUI_groupCellX[0,0] = 0;
GMUI_groupCellY[0,0] = 0;
GMUI_groupActualX[0,0] = 0;
GMUI_groupActualY[0,0] = 0;
GMUI_groupRelativeX[0,0] = 0;
GMUI_groupRelativeY[0,0] = 0;
GMUI_groupCellsW[0,0] = 0;
GMUI_groupCellsH[0,0] = 0;
GMUI_groupRelativeCellX[0,0] = 0;
GMUI_groupRelativeCellY[0,0] = 0;
GMUI_groupAnchor[0,0] = global.GMUIAnchorTopLeft;
GMUI_groupClickOff[0,0] = false;
GMUI_groupTransitioning[0,0] = false;
//GMUI_groupTransitioningControl[0,0] = -1;
GMUI_groupAction[0,0] = -1;
GMUI_groupSettingsMap[0,0] = -1;


// Call the form code to create the interface
GMUI_SetForm(argument0);
UIInterfaceSet = true;
GMUI_GridSetAllGroupValues(id);
//GMUI_GridSetAllMenuValues(id);
GMUI_GridSetRegions();

// Upon success, give the GMUI id back
return GMUInumber;


#define GMUI_CreateMenuType
///GMUI_CreateMenuType (Type[script calling], menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_GMUI,_menuName,_CellX,_CellY,_CW,_CH,_Anchor,_menuNumber,_layerNumber, _menuType, _prevLayer;
_SCRIPT = GMUI_CreateMenuType;
_GMUI = GMUII();
_menuScript = argument0;
_menuName = string(argument1);
_CellX = argument2;
_CellY = argument3;
_CW = argument4;
_CH = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Get menu number and assign name to the ID
(_GMUI).GMUI_menuLastId += 1;
_menuNumber = (_GMUI).GMUI_menuLastId;
switch (_menuScript) {
    case GMUI_CreatePopup: ds_map_add((_GMUI).GMUI_popup_map,_menuName,_menuNumber);
        break;
    case GMUI_CreateWarning: ds_map_add((_GMUI).GMUI_warnings_map,_menuName,_menuNumber);
        break;
    default:
    case GMUI_CreateMenu: ds_map_add((_GMUI).GMUI_menu_map,_menuName,_menuNumber);
        break;
}

_prevLayer = (_GMUI).UIAddToLayer;
_layerNumber = GMUI_GetMenuLayer(_GMUI,_menuNumber);
if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_AddLayer(_layerNumber,(_GMUI).GMUI_defaultX,(_GMUI).GMUI_defaultY);
}

// Create a group with the assigned layer and group numbers
if (GMUI_CreateGroup(_menuNumber,_CellX,_CellY,_Anchor)) {
    (_GMUI).GMUI_groupCellsW[_layerNumber,_menuNumber] = _CW;
    (_GMUI).GMUI_groupCellsH[_layerNumber,_menuNumber] = _CH;
    (_GMUI).GMUI_groupClickOff[_layerNumber,_menuNumber] = false;
    (_GMUI).GMUI_groupAction[_layerNumber,_menuNumber] = -1;
    UIAddToLayer = _prevLayer;
}
else {
    UIAddToLayer = _prevLayer;
    return -1;
}


return _menuNumber;

#define GMUI_CreateSetDefaultArea
///GMUI_CreateSetDefaultArea() Set the default area to use to set the grid size for layers called by GMUI_Create()
///This depends on views or room size to set the grid size

//UIsnaptoview = true;
//UIgridview = 0;

UIgridwidth = room_width;
UIgridheight = room_height;

if (view_enabled) {
    UIgridwidth = view_wport[UIgridview];
    UIgridheight = view_hport[UIgridview];
}

#define GMUI_DrawSpriteBox
///GMUI_DrawSpriteBox(GMUI instance, Layer, Group, Control[0] / Group [1] / Menu[2], Alpha)
///Draws the box of the specified type

var _GMUII, _layer, _group, _bType, _alpha;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_bType = argument3;
_alpha = minmax(argument4,0,1);

var _dbx, _dby, _dbw, _dbh, _xoffset, _yoffset, _spr_width, _spr_height, _spr_isFixed,
    _sprTopLeft, _sprTop, _sprTopRight, _sprRight, _sprBottomRight, _sprBottom, _sprBottomLeft, _sprLeft, _sprCenter;

_xoffset = GMUI_GridViewOffsetX(_GMUII);
_yoffset = GMUI_GridViewOffsetY(_GMUII);

if (_bType == 0) {
    // Control
    if (!ControlGraphicMapIsUsed)
        return false;
    
    // dimensions
    _dbx = RoomX;
    _dby = RoomY;
    _dbw = CellWide * (GMUIP).cellsize;
    _dbh = CellHigh * (GMUIP).cellsize_h;
    _spr_width = sprite_get_width(ControlGraphicTopLeft);
    _spr_height = sprite_get_height(ControlGraphicTopLeft);
    
    _sprTopLeft = ControlGraphicTopLeft;
    _sprTop = ControlGraphicTop;
    _sprTopRight = ControlGraphicTopRight;
    _sprRight = ControlGraphicRight;
    _sprBottomRight = ControlGraphicBottomRight;
    _sprBottom = ControlGraphicBottom;
    _sprBottomLeft = ControlGraphicBottomLeft;
    _sprLeft = ControlGraphicLeft;
    
    _sprCenter = ControlGraphicCenter;
    _spr_isFixed = ControlGraphicCenterIsFixed;
}
else if (_bType == 1) {
    // Group
    if (!(_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group])
        return false;
        
    // dimensions
    _dbx = (_GMUII).GMUI_groupActualX[_layer,_group] + (_GMUII).GMUI_grid_x[_layer] + _xoffset;
    _dby = (_GMUII).GMUI_groupActualY[_layer,_group] + (_GMUII).GMUI_grid_y[_layer] + _yoffset;
    _dbw = (_GMUII).GMUI_groupCellsW[_layer,_group]*(_GMUII).cellsize + (_GMUII).GMUI_grid_x[_layer,_group];
    _dbh = (_GMUII).GMUI_groupCellsH[_layer,_group]*(_GMUII).cellsize_h + (_GMUII).GMUI_grid_y[_layer,_group];
    _spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    _spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    
    _sprTopLeft = (_GMUII).GMUI_groupGraphicTopLeft[_layer,_group];
    _sprTop = (_GMUII).GMUI_groupGraphicTop[_layer,_group];
    _sprTopRight = (_GMUII).GMUI_groupGraphicTopRight[_layer,_group];
    _sprRight = (_GMUII).GMUI_groupGraphicRight[_layer,_group];
    _sprBottomRight = (_GMUII).GMUI_groupGraphicBottomRight[_layer,_group];
    _sprBottom = (_GMUII).GMUI_groupGraphicBottom[_layer,_group];
    _sprBottomLeft = (_GMUII).GMUI_groupGraphicBottomLeft[_layer,_group];
    _sprLeft = (_GMUII).GMUI_groupGraphicLeft[_layer,_group];
    
    _sprCenter = (_GMUII).GMUI_groupGraphicCenter[_layer,_group];
    _spr_isFixed = (_GMUII).GMUI_groupGraphicCenterIsFixed[_layer,_group];
}
else if (_bType == 2) {
    // Menu
    
    // dimensions
}

// Draw the box based on the dimensions and sprites gathered 
// top left
draw_sprite_ext(_sprTopLeft,-1,_dbx,_dby,1,1,0,c_white,_alpha);

// top
draw_sprite_stretched_ext(_sprTop,-1,_dbx+_spr_width,_dby,_dbw-_spr_width*2,sprite_get_height(_sprTop),c_white,_alpha);//_spr_height);

// top right
draw_sprite_ext(_sprTopRight,-1,_dbx+_dbw-_spr_width,_dby,1,1,0,c_white,_alpha);

// right
draw_sprite_stretched_ext(_sprRight,-1,_dbx+_dbw-_spr_width,_dby+_spr_height,_spr_width,_dbh-_spr_height,c_white,_alpha);

// bottom right
draw_sprite_ext(_sprBottomRight,-1,_dbx+_dbw-_spr_width,_dby+_dbh-_spr_height,1,1,0,c_white,_alpha);

// bottom
draw_sprite_stretched_ext(_sprBottom,-1,_dbx+_spr_width,_dby+_dbh-_spr_height,_dbw-_spr_width*2,sprite_get_width(_sprBottom),c_white,_alpha);

// bottom left
draw_sprite_ext(_sprBottomLeft,-1,_dbx,_dby+_dbh-_spr_height,1,1,0,c_white,_alpha);

// left
draw_sprite_stretched_ext(_sprLeft,-1,_dbx,_dby+_spr_height,_spr_width,_dbh-_spr_height,c_white,_alpha);


// center (either partial or stretched to fit)
if (_spr_isFixed) {
    draw_sprite_part_ext(_sprCenter,-1,0,0,_dbw-_spr_width*2,_dbh-_spr_height*2,_dbx+_spr_width,_dby+_spr_height,1,1,c_white,_alpha);
}
else {
    draw_sprite_stretched_ext(_sprCenter,-1,_dbx+_spr_width,_dby+_spr_height,_dbw-_spr_width*2,_dbh-_spr_height*2,c_white,_alpha);
}

#define GMUI_GetAnchoredCellX
///GMUI_GetAnchoredCellX(Area Width, Cell X given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring


// Width of a GMUI grid is usually: ds_grid_width((GMUII()).GMUI_grid[Layer]);

var __GridW, __CellX, __Anchor;
__GridW = argument0;
__CellX = argument1;
__Anchor = argument2;

// Left anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorBottomLeft) {
    return __CellX;
}
else {
    // The Mid X's, else the Right X's 
    if (__Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorBottom) {
        // Half-width accounts for the cell 0 added to the width.
        // (On even widths, 0 is left of the middle and 1 is right of the middle)
        return floor(__GridW / 2 - 0.5) + __CellX;
    }
    else if (__Anchor == global.GMUIAnchorTopRight || __Anchor == global.GMUIAnchorRight || __Anchor == global.GMUIAnchorBottomRight)
        return __GridW - __CellX - 1;
    else
        return __CellX;
}

#define GMUI_GetAnchoredCellY
///GMUI_GetAnchoredCellY(GMUII, Layer, Cell Y given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring


// Height of a GMUI grid is usually: ds_grid_height((GMUII()).GMUI_grid[Layer]);

var __GridH, __CellY, __Anchor;
__GridH = argument0;
__CellY = argument1;
__Anchor = argument2;

// Top anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorTopRight) {
    return __CellY;
}
else {  
    // The Mid Y's else the Bottom Y's
    if (__Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorRight) {
        // Half-height accounts for the cell 0 added to the height.
        // (On even height, 0 is top of the middle and 1 is bottom of the middle)
        return floor(__GridH / 2 - 0.5) + __CellY;
    }
    else if (__Anchor == global.GMUIAnchorBottomLeft || __Anchor == global.GMUIAnchorBottom || __Anchor == global.GMUIAnchorBottomRight)
        return __GridH - __CellY - 1;
    else
        return __CellY;
}

#define GMUI_GetControlAtPosition
///GMUI_GetControlAtPosition(GMUI instance,X,Y)
///Returns the control that is present in the cell if one exists there

var _CellHor, _CellVer, _PosX, _PosY, _GMUII, _ctrlObject;
_GMUII = argument0;
_PosX = argument1;
_PosY = argument2;

// Position (typically mouse) must be greater than the x and y position of the grid to find a control
if (_PosX < (_GMUII).GMUI_grid_x[(_GMUII).UILayer] || _PosY < (_GMUII).GMUI_grid_y[(_GMUII).UILayer])
    return -1;

_CellHor = GMUI_GridGetCellX(_GMUII,(_GMUII).UILayer,_PosX);
_CellVer = GMUI_GridGetCellY(_GMUII,(_GMUII).UILayer,_PosY);
    
// Position (typically mouse) must be within the width and height of the grid
if (_CellHor >= (_GMUII).GMUI_grid_w[(_GMUII).UILayer] || _CellVer >= (_GMUII).GMUI_grid_h[(_GMUII).UILayer])
    return -1;


// Retrieve value and then object at that position
_ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],_CellHor,_CellVer);

if (is_real(_ctrlObject)) {
    if (_ctrlObject != 0) {
        if (instance_exists(_ctrlObject)) {
            return _ctrlObject;
        }
        else
            GMUI_ThrowErrorDetailed("Instance recorded is not a control object or no longer exists",GMUI_GetControlAtPosition);
    }
}

// Couldn't find the instance, or none assigned at this cell.
return -1;

#define GMUI_GetDataType
///GMUI_GetDataType("Control Type")
///Takes the control type and returns the data type it is
// Datatypes are defined in GMUI_Init()

var _controlType;
    _controlType = string_lower(string_replace(string(argument0)," ",""));
    
switch (_controlType) {
    case "spritepicker":
    case "textint":
    case "intpicker":
    case "image":
        return global.GMUIDataTypeInteger;
        break;
    case "textdecimal":
    case "doublepicker":
        return global.GMUIDataTypeDecimal;
        break;
    case "textstring":
    case "label":
        return global.GMUIDataTypeString;
        break;
    case "button":
    case "textbutton":
        return global.GMUIDataTypeButton;
        break;
    case "tooltip":
        return global.GMUIDataTypeInfo;
        break;
    case "toggle":
    case "checkbox":
        return global.GMUIDataTypeBoolean;
        break;
    default:
        return -1;
        break;
}

#define GMUI_GetMenuLayer
///GMUI_GetMenuLayer(GMUI, Menu Number)
///Returns the layer number of the given menu

return (argument0).GMUI_menu_layer + argument1 - 1;

#define GMUI_GridAdjust
///GMUI_GridAdjust(cells wide , cells high)
/// Adjusts grid for all layers of the GMUI instance

//var layer, i;
//for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
//
//    layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
//    
//    if (layer >= 0) {
//        GMUI_GridAdjustLayer(layer,argument0,argument1);
//    }
//}

GMUI_GridAdjustLayer(-1,argument0,argument1);

#define GMUI_GridAdjustLayer
///GMUI_GridAdjustLayer(Layer Number [or all: -1], cells wide, cells high)
/// Adjusts the layer's grid based on new dimensions and moves the controls according to their anchors

// Layer needs to exist
if (!GMUI_LayerExists(argument0))
    return false;


var _GMUI,_Layer, CW, CH, _prevLayer;
_GMUI = GMUII();
_Layer = floor(argument0);

// If cells wide/high are 0, then it is assumed to be adjusted to the room or view dimensions
if (argument1 == 0)
    CW = ceil((_GMUI).UIgridwidth/(_GMUI).cellsize);
else
    CW = argument1;

if (argument2 == 0)
    CH = ceil((_GMUI).UIgridheight/(_GMUI).cellsize_h);
else
    CH = argument2;

ds_grid_resize((_GMUI).GMUI_grid[_Layer],CW,CH);

(_GMUI).UIgridwidth = max((_GMUI).UIgridwidth, CW * (_GMUI).cellsize);
(_GMUI).UIgridheight = max((_GMUI).UIgridheight, CH * (_GMUI).cellsize_h);
(_GMUI).GMUI_grid_w[_Layer] = CW * (_GMUI).cellsize;
(_GMUI).GMUI_grid_h[_Layer] = CH * (_GMUI).cellsize_h;


// Get grid dimensions
var gridW, gridH, anc, relX, relY, pCellX, pCellY;
gridW = GMUI_GridGetWidth(_GMUI,_Layer);
gridH = GMUI_GridGetHeight(_GMUI,_Layer);
//if (_Layer == 99) show_message(string(gridW) + " , " + string(gridH));
// Move any controls that are anchored to other positions
var ctrl;
for(i=0;i<ds_list_size((_GMUI).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((_GMUI).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridAdjustLayer()");
    }
    else if (((ctrl).Layer == _Layer || _Layer == -1) && ctrl.Group == 0) {
        // The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
    
        // Use the anchor and position relative to it 
        anc = (ctrl).Anchor;
        relX = (ctrl).RelativeCellX;
        relY = (ctrl).RelativeCellY;
        pCellX = (ctrl).CellX;
        pCellY = (ctrl).CellY;
        
        // Use grid's dimensions unless part of a group (handled by group move)
        (ctrl).CellX = GMUI_GetAnchoredCellX(gridW,relX,anc);
        (ctrl).CellY = GMUI_GetAnchoredCellY(gridH,relY,anc);
        
        // Actual position based on its grid position
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
        
        // Check boundaries
        if (!GMUI_ValidCellBounds(anc,(ctrl).CellX,(ctrl).CellY,gridW,gridH)) {
            GMUI_ThrowError("Cell values out of bounds. GMUI_GridAdjustLayer() on ('" + string((ctrl).Layer) + "'," + string(argument1) + "," + string(argument2) + "...");
        }
    }
}

// Move any groups that are anchored to other positions
var _Group, _MasterControl, _CellX, _CellY;
for(i=0;i<ds_list_size((_GMUI).GMUI_groupList[_Layer]);i+=1) {
    _Group = ds_list_find_value((_GMUI).GMUI_groupList[_Layer],i);
    _MasterControl = (_GMUI).GMUI_groupMasterControl[_Layer,_Group];
    
    _CellX = (_GMUI).GMUI_groupRelativeCellX[_Layer,_Group];
    _CellY = (_GMUI).GMUI_groupRelativeCellY[_Layer,_Group];
    
    _prevLayer = (_GMUI).UIAddToLayer;
    (_GMUI).UIAddToLayer = _Layer;
    GMUI_GroupSetPosition(_Group,_CellX,_CellY,(_GMUI).GMUI_groupRelativeX[_Layer,_Group],(_GMUI).GMUI_groupRelativeY[_Layer,_Group]);
    (_GMUI).UIAddToLayer = _prevLayer;
    
    // Reset hide position transition values
    (_MasterControl).T_px_group = GMUI_CellGetActualX((_GMUI).GMUI_groupCellX[_Layer,_Group]);
    (_MasterControl).T_py_group = GMUI_CellGetActualY((_GMUI).GMUI_groupCellY[_Layer,_Group]);
    (_MasterControl).T_hx_group = (_MasterControl).T_px_group + (_MasterControl).T_hrelx_group;
    (_MasterControl).T_hy_group = (_MasterControl).T_py_group + (_MasterControl).T_hrely_group;
    
    if ((_MasterControl).GroupHidden && (_MasterControl).T_hspeed_group > 0) {
        (_GMUI).GMUI_groupActualX[_Layer,_Group] = (_MasterControl).T_hx_group;
        (_GMUI).GMUI_groupActualY[_Layer,_Group] = (_MasterControl).T_hy_group;
        _CellX -= floor((_MasterControl).T_hrelx_group / (_GMUI).cellsize);
        _CellY -= floor((_MasterControl).T_hrely_group / (_GMUI).cellsize_h);
    }
}

// Reset the regions for the layer
GMUI_GridSetRegionsLayer(_Layer);



return true;


#define GMUI_GridDrawGroups
///GMUI_GridDrawGroups(GMUI instance)
///Draws the groups if set to do so
// CURRENTLY NOT USED! //

var _GMUII, layer, l, g, gx, gy, gw, gh, xoffset, yoffset, spr_width, spr_height;
_GMUII = argument0;

xoffset = GMUI_GridViewOffsetX(_GMUII);
yoffset = GMUI_GridViewOffsetY(_GMUII);

for(l=0;l<ds_list_size((_GMUII).GMUI_gridlist);l+=1) {

    layer = ds_list_find_value((_GMUII).GMUI_gridlist,l);
    
    if (layer >= 0) {
        // Draw grids for this layer
        for (g=0;g<ds_list_size((_GMUII).GMUI_groupList[layer]);g+=1) {
            // Draw the selected group if set from the form
            if ((_GMUII).GMUI_groupGraphicMapIsUsed[layer,g]) {
                // group dimensions
                gx = GMUI_groupActualX[layer,g] + (GMUII()).GMUI_grid_x[layer] + xoffset;
                gy = GMUI_groupActualY[layer,g] + (GMUII()).GMUI_grid_y[layer] + yoffset;
                gw = GMUI_groupCellsW[layer,g]*cellsize + (_GMUII).GMUI_grid_x[layer,g] + xoffset;
                gh = GMUI_groupCellsH[layer,g]*cellsize_h + (_GMUII).GMUI_grid_y[layer,g] + yoffset;
                
                spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft);
                spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft);
                    
                // top left
                draw_sprite((_GMUII).GMUI_groupGraphicTopLeft[layer,g],-1,gx,gy);
                
                // top
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicTop[layer,g],-1,gx+spr_width,gy,gw-spr_width,spr_height);
                
                // top right
                draw_sprite((_GMUII).GMUI_groupGraphicTopRight[layer,g],-1,gx+gw-spr_width,gy);
                
                // right
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicRight[layer,g],-1,gx+gw-spr_width,gy+spr_height,spr_width,gh-spr_height);
                
                // bottom right
                draw_sprite((_GMUII).GMUI_groupGraphicBottomRight[layer,g],-1,gx+gw-spr_width,gy+gh-spr_height);
                
                // bottom
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicBottom[layer,g],-1,gx+spr_width,gy+gh-spr_height,gw-spr_width,spr_height);
                
                // bottom left
                draw_sprite((_GMUII).GMUI_groupGraphicBottomLeft[layer,g],-1,gx,gy+gh-spr_height);
                
                // left
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicLeft[layer,g],-1,gx,gy+spr_height,spr_width,gh-spr_height);
            
                // center (either partial or stretched to fit)
                if ((_GMUII).GMUI_groupGraphicCenterIsFixed[layer,g]) {
                    draw_sprite_part((_GMUII).GMUI_groupGraphicCenter[layer,g],-1,0,0,gw-spr_width*2,gh-spr_height*2,gx+spr_width,gy+spr_height);
                }
                else {
                    draw_sprite_stretched((_GMUII).GMUI_groupGraphicCenter[layer,g],-1,gx+spr_width,gy+spr_height,gw-spr_width*2,gh-spr_height*2);
                }
            }            
        }
    
    }
}

#define GMUI_GridEnabled
///GMUI_GridEnabled()
/// Returns if the entire grid is enabled to be used

if (InitialDisable > 0)
{
    InitialDisable -= 1;
    return false;
}
else
{
    return true;
}

#define GMUI_GridGetCellX
///GMUI_GridGetCellX(GMUI instance, Layer, X)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = GMUI_GridViewOffsetX(_GMUII);

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUI).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUI).cellsize)-1;



#define GMUI_GridGetCellXOffset
///GMUI_GridGetCellXOffset(GMUI instance, Layer, X, Offset X)  Returns the horizontal cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate
// argument3 is the X offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUII).cellsize)-1;



#define GMUI_GridGetCellXRoom
///GMUI_GridGetCellXRoom(GMUI instance, Layer, X)  Returns the horizontal cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,0);



#define GMUI_GridGetCellY
///GMUI_GridGetCellY(GMUI instance, Layer, Y)  Returns the vertical cell block by coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = GMUI_GridViewOffsetY(_GMUII);

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



#define GMUI_GridGetCellYOffset
///GMUI_GridGetCellYOffset(GMUI instance, Layer, Y, Offset Y)  Returns the vertical cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate
// argument3 is the Y offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



#define GMUI_GridGetCellYRoom
///GMUI_GridGetCellYRoom(GMUI instance, Layer, Y)  Returns the vertical cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,0);



#define GMUI_GridGetMouseCellX
///GMUI_GridGetMouseCellX(GMUI instance)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUI, _offset;
_GMUI = argument0;
_offset = GMUI_GridViewOffsetX(_GMUI);


return ceil((mouse_x-(_GMUI).GMUI_grid_x[(_GMUI).UILayer]-_offset+1)/(_GMUI).cellsize)-1;



#define GMUI_GridGetMouseCellY
///GMUI_GridGetMouseCellY(GMUI instance)  Returns the vertical cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUI, _offset;
_GMUI = argument0;
_offset = GMUI_GridViewOffsetY(_GMUI);

return ceil((mouse_y-(_GMUI).GMUI_grid_y[(_GMUI).UILayer]-_offset+1)/(_GMUI).cellsize_h)-1;



#define GMUI_GridGetHeight
///GMUI_GridGetHeight(GMUI, Layer)
///Returns the width of the grid of the given instance and layer

return ds_grid_height((argument0).GMUI_grid[argument1]);

#define GMUI_GridGetWidth
///GMUI_GridGetWidth(GMUI, Layer)
///Returns the width of the grid of the given instance and layer

return ds_grid_width((argument0).GMUI_grid[argument1]);

#define GMUI_GridNextControl
///GMUI_GridNextControl(next control /or previous: false)
///Changes the selected control to the next control in the list by ID

// Select the first control if none are selected, otherwise pull the next ID
var ctrlIndex,ctrl,i;
if ((GMUII()).SelectedControl != -1) {
    ctrlIndex = ds_list_find_index((GMUII()).GMUI_controlList,(GMUII()).SelectedControl);
    if (ctrlIndex < 0)
        ctrlIndex = 0;
}
else
    ctrlIndex = 0;

GMUI_ResetControlStatus("Selected",GMUII());
if (argument0) {
    if (ctrlIndex == ds_list_size((GMUII()).GMUI_controlList)) {
        ctrlIndex = 0;
    }
    else {
        ctrlIndex += 1;
    }
}
else {
    if (ctrlIndex == 0)
        ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
    else
        ctrlIndex -= 1;
}

i=0;
while (i < ds_list_size((GMUII()).GMUI_controlList)) {
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,ctrlIndex);
    if (ctrl > 0 && instance_exists(ctrl)) {
        if ((!ctrl.Disabled) && (!ctrl.NonClickable) && (!ctrl.Hidden)) {
            GMUI_GridSelect(ctrl);
            return true;
        }
    }
    if (argument0) {
        ctrlIndex += 1;
        if (ctrlIndex > ds_list_size((GMUII()).GMUI_controlList)) {
            ctrlIndex = -1;
        }
    }
    else {
        ctrlIndex -= 1;
        if (ctrlIndex < 0) {
            ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
        }
    }
    i += 1;
}


return false;

#define GMUI_GridResetControlRegion
///GMUI_GridResetControlRegion(Layer, previous CellX, previous CellY, Cell Width, Cell Height, control id)
/// Resets any control values in the control's previous region


var _Layer, _pCellX, _pCellY, _CellW, _CellH, _CtrlId;
_Layer = argument0;
_pCellX = argument1;
_pCellY = argument2;
_CellW = argument3;
_CellH = argument4;
_CtrlId = argument5;

// Loop through region to reset control value to 0
var i,j;
for (i=0;i<_CellW;i+=1) {
    for (j=0;j<_CellH;j+=1) {
        if (ds_grid_get((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j) == _CtrlId) {
                ds_grid_set((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j,0);
        }
    }
}

#define GMUI_GridSelect
///GMUI_GridSelect(control object)
/// Selects a control object from the grid (Called by GMUI_GridStep)


// Set the keyboard string to the value string
(argument0).valuePrevious = (argument0).value;
(argument0).valueStringPrevious = (argument0).valueString;

keyboard_string = (argument0).valueString;

(GMUII()).SelectedControl = argument0;
(argument0).Selected = 1;

// Double selection will overwrite the current value
if ((GMUII()).PreviousSelectedControl == argument0) {
    if ((GMUII()).GMUIAllowDoubleSelect)
        (argument0).DoubleSelected = 1;   
}
else if (GMUI_IsScript((argument0).SelectingActionScript)) {
    // If there is a script to assigned to run it'll only be done once
    script_execute((argument0).SelectingActionScript);
}

#define GMUI_GridSetAllGroupValues
///GMUI_GridSetAllGroupValues(GMUI instance);
///Set all mapped values to groups, called after the UI is set

with (argument0) {

    // Cycle through each grid layer
    var i,l,j,g,k;
    for(i=0;i<ds_list_size(GMUI_gridlist);i+=1) {
        l = ds_list_find_value(GMUI_gridlist,i);
        for(j=0;j<ds_list_size(GMUI_groupList[l]);j+=1) {
            g = ds_list_find_value(GMUI_groupList[l],j);
            if (GMUI_groupSettingsMap[l,g] != -1) {
                // Set group mapped values
                GMUI_GridSetMappedValues(id,l,g);
                // Reset map
                ds_map_destroy(GMUI_groupSettingsMap[l,g]);
                GMUI_groupSettingsMap[l,g] = -1;
            }
        }
    }

}

#define GMUI_GridSetMappedValues
///GMUI_GridSetMappedValues(GMUI instance, layer, group number)
///Iterate over the value map for the specific group to set values

var _SCRIPT, _Layer, _Map, _Key, _i, _prevLayer;
_SCRIPT = GMUI_GridSetMappedValues;
_Layer = argument1;
_Group = argument2;

with (argument0) {
    _Map = GMUI_groupSettingsMap[_Layer,_Group];
    if (_Map == -1) {
        return false;
    }
    
    _prevLayer = UIAddToLayer;
    UIAddToLayer = _Layer;
    
    _Key = ds_map_find_first(_Map);
    for (_i=0;_i<ds_map_size(_Map);_i+=1) {
        // Match key values with the script calls
        switch (_Key) {
            //GMUI_GroupSetFadeOnHide, GMUI_MenuSetFadeOnHide, GMUI_PopupSetFadeOnHide
            case "FadeSpeed":
                if (ds_map_exists(_Map,"FadeMode")) {
                    GMUI_GroupSetFadeOnHide(_Group,
                        ds_map_find_value(_Map,"FadeSpeed"), ds_map_find_value(_Map,"FadeMode"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing FadeMode for GroupSetFadeOnHide. Unable to set",_SCRIPT);
                }
                break;
            //GMUI_GroupSetStyle, GMUI_MenuSetStyle, GMUI_PopupSetStyle
            case "BackgroundColor":
                if (ds_map_exists(_Map,"BackgroundAlpha")
                    && ds_map_exists(_Map,"BorderColor")
                    && ds_map_exists(_Map,"BorderAlpha")
                    && ds_map_exists(_Map,"IsRoundRect")) {
                    GMUI_GroupSetStyle(_Group,
                        ds_map_find_value(_Map, "BackgroundColor"),
                        ds_map_find_value(_Map, "BackgroundAlpha"),
                        ds_map_find_value(_Map, "BorderColor"),
                        ds_map_find_value(_Map, "BorderAlpha"),
                        ds_map_find_value(_Map, "IsRoundRect"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing value for SetStyle. Unable to set",_SCRIPT);
                }
                break;
            //GMUI_GroupSetHidePosition, GMUI_MenuSetHidePosition, GMUI_PopupSetHidePosition
            case "HideCellX":
                if (ds_map_exists(_Map,"HideCellY")
                    && ds_map_exists(_Map,"HideTransition")
                    && ds_map_exists(_Map,"HideSpeed")) {
                    GMUI_GroupSetHidePosition(_Group,
                        ds_map_find_value(_Map, "HideCellX"),
                        ds_map_find_value(_Map, "HideCellY"),
                        ds_map_find_value(_Map, "HideTransition"),
                        ds_map_find_value(_Map, "HideSpeed"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing value for SetHidePosition. Unable to set",_SCRIPT);
                }
                break;
            default:
                break;
        }
        _Key = ds_map_find_next(_Map,_Key);
    }
    
    //Restore the previous Add Layer value
    UIAddToLayer = _prevLayer;

    return true;
}

#define GMUI_GridSetRegions
/// Set the control regions for all layers

// Cycle through each grid layer to set region
var i,l;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
    l = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    GMUI_GridSetRegionsLayer(l);
}

#define GMUI_GridSetRegionsLayer
/// Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,_ctrl,_CX2,_CY2;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    _ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(_ctrl)) {
        GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridSetRegionsLayer);
    }
    else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
        if ((_ctrl).ControlInteraction) {
            // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
            _CX2 = (_ctrl).CellX+(_ctrl).CellWide-1+ceil((_ctrl).RelativeX / (GMUII()).cellsize);
            _CY2 = (_ctrl).CellY+(_ctrl).CellHigh-1+ceil((_ctrl).RelativeY / (GMUII()).cellsize_h);
            ds_grid_set_region(_Grid,(_ctrl).CellX,(_ctrl).CellY,_CX2,_CY2,_ctrl);
        }
        
        // Update control draw location in the room
        if ((_ctrl).Layer == _Layer)
            GMUI_ControlUpdateXY(_ctrl);
    }
    
}

#define GMUI_GridUpdateLayer
///GMUI_GridUpdateLayer(GMUI instance, Layer)
///[BETA]Update the draw flag for all controls on the layer
var _i,_ctrl,_Layer;
_Layer = argument1;

// Currently disabled.
//return true;

with (argument0) {
    // Loop through all controls in the layer
    for(_i=0;_i<ds_list_size(GMUI_controlList);_i+=1) {
        // Get control value
        _ctrl = ds_list_find_value(GMUI_controlList,_i);
    
        if (!instance_exists(_ctrl)) {
            GMUI_ThrowErrorDetailed("Control no longer exists", GMUI_GridUpdateLayer);
        }
        else if (GMUI_ControlIsInLayer(_ctrl,_Layer)) {
            _ctrl.NeedsDrawUpdate = true;
        }
    }
} 

#define GMUI_GridViewOffsetX
///GMUI_GridViewOffsetX(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings

with (argument0) {
    if (UIsnaptoview && !UIEnableSurfaces)
        return view_xview[UIgridview];
    else
        return 0;
} 

#define GMUI_GridViewOffsetY
///GMUI_GridViewOffsetY(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings

with (argument0) {
    if (UIsnaptoview && !UIEnableSurfaces)
        return view_yview[UIgridview];
    else
        return 0;
} 

#define GMUI_GroupExists
///GMUI_GroupExists(Layer Number, Group Number)
///Checks that the group number given exists in the layer in GMUI

if (!is_real(argument0))
    return false;
    
if (!is_real(argument0))
    return false;

var L,G;
L = floor(argument0);
G = floor(argument1);

return (ds_list_find_index((GMUII()).GMUI_groupList[L],G) != -1);

#define GMUI_GroupSetHidePosition
///GMUI_GroupSetHidePosition(Group Number, Cell X, Cell Y, Transition_script [or -1], speed in steps)
// Set a group position to transition from and to when showing or hiding group

//todo: get master control and set coordinates to it
var _GMUI, _LayerNumber, _GroupNumber, _MasterControl;
_GMUI = GMUII();
_Layer = UIAddToLayer;
_Group = argument0;


// Map values if interface is not done being created
if (!(_GMUI).UIInterfaceSet) {
    if ((_GMUI).GMUI_groupSettingsMap[_Layer,_Group] == -1) {
        (_GMUI).GMUI_groupSettingsMap[_Layer,_Group] = ds_map_create();
    }
    
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideCellX", argument1);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideCellY", argument2);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideTransition", argument3);
    ds_map_add((_GMUI).GMUI_groupSettingsMap[_Layer,_Group], "HideSpeed", argument4);

    return true;
}



if ((_GMUI).GMUI_groupMasterControl[_Layer,_Group] == -1) {
    GMUI_ThrowErrorDetailed("No controls to assign position", GMUI_GroupSetHidePosition);
    return false;
}
else {
    // convert from cell to actual, and call new script to call gmui group transition to cell actual
    _MasterControl = (_GMUI).GMUI_groupMasterControl[_Layer,_Group];
    
    (_MasterControl).T_px_group = GMUI_groupActualX[_Layer,_Group];
    (_MasterControl).T_py_group = GMUI_groupActualY[_Layer,_Group];
    
    (_MasterControl).T_hx_group = GMUI_CellGetActualX(GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_Layer),argument1,(_GMUI).GMUI_groupAnchor[_Layer,_Group]));
    (_MasterControl).T_hy_group = GMUI_CellGetActualY(GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_Layer),argument2,(_GMUI).GMUI_groupAnchor[_Layer,_Group]));
    
    // If group is currently hidden, start at the hide position
    if ((_MasterControl).GroupHidden) {
        (_GMUI).GMUI_groupActualX[_Layer,_Group] = (_MasterControl).T_hx_group;
        (_GMUI).GMUI_groupActualY[_Layer,_Group] = (_MasterControl).T_hy_group;
        with (_MasterControl) {
            T_hrelx_group = T_hx_group - T_px_group;
            T_hrely_group = T_hy_group - T_py_group;
        }
        
        // Bump all controls to their own hidden positions
        for(i=0;i<ds_list_size((_GMUI).GMUI_groupControlList[_Layer,_Group]);i+=1) {
        
            ctrl = ds_list_find_value((_GMUI).GMUI_groupControlList[_Layer,_Group],i);
    
            if (instance_exists(ctrl))
            {
                (ctrl).ActualX += (_MasterControl).T_hrelx_group;
                (ctrl).ActualY += (_MasterControl).T_hrely_group;
            }
        }
        
    }
    
    (_MasterControl).T_hscript_group = argument3;
    (_MasterControl).T_hspeed_group = argument4;
    return true;
}


#define GMUI_GroupSetPositionAnchored
///GMUI_GroupSetPositionAnchored(Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment, Anchor)
///Change the position of the group (and all of the controls inside it) according to its anchor

// Arguments
var _SCRIPT, _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl, _MasterControl;
_SCRIPT = GMUI_GroupSetPositionAnchored;
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY) || _GroupNumber <= 0) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist", _SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber), _SCRIPT);
    return false;
}

// Max adjustment values
_AdjustmentX = min(_AdjustmentX, (GMUII()).cellsize - 1);
_AdjustmentY = min(_AdjustmentY, (GMUII()).cellsize_h - 1);

_MasterControl = (GMUII()).GMUI_groupMasterControl[_LayerNumber,_GroupNumber];

// Change group position
(GMUII()).GMUI_groupRelativeCellX[_LayerNumber,_GroupNumber] = _CellX;
(GMUII()).GMUI_groupRelativeCellY[_LayerNumber,_GroupNumber] = _CellY;
(GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_LayerNumber),_CellX,_Anchor);
(GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_LayerNumber),_CellY,_Anchor);
(GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber] = _AdjustmentX;
(GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber] = _AdjustmentY;
(GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = GMUI_CellGetActualX((GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber]) + _AdjustmentX;
(GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = GMUI_CellGetActualY((GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber]) + _AdjustmentY;

// If not a transition move, then set the new primary (aka previous) location to this new one
if (!(_MasterControl).TransitioningGroup) {
    (_MasterControl).T_px_group = (GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber];
    (_MasterControl).T_py_group = (GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber];
    (_MasterControl).T_hx_group = (_MasterControl).T_px_group + (_MasterControl).T_hrelx_group;
    (_MasterControl).T_hy_group = (_MasterControl).T_py_group + (_MasterControl).T_hrely_group;
    
    if ((_MasterControl).GroupHidden) {
        (GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = (_MasterControl).T_hx_group;
        (GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = (_MasterControl).T_hy_group;
    }
}


// Re-position all controls within the group
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        var groupWidth,groupHeight;
        groupWidth = (GMUII()).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
        groupHeight = (GMUII()).GMUI_groupCellsH[_LayerNumber,_GroupNumber];
        
        // Reset positioning based on group's position
        (ctrl).CellX = GMUI_GetAnchoredCellX(groupWidth,(ctrl).RelativeCellX,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber];
        (ctrl).CellY = GMUI_GetAnchoredCellY(groupHeight,(ctrl).RelativeCellY,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber];
        (ctrl).RelativeX = (GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber];
        (ctrl).RelativeY = (GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber];
        
        // Properly have control configure its own adjustments (sets IsAdjusted and adds cell boundary as necessary)
        with (ctrl) {
            GMUI_ControlSetPositioning(RelativeX,RelativeY,ActualW,ActualH);
        }
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
        
        if ((_MasterControl).T_hspeed_group > 0 && !(_MasterControl).TransitioningGroup && (_MasterControl).GroupHidden) {
            (ctrl).ActualX += (_MasterControl).T_hrelx_group;
            (ctrl).ActualY += (_MasterControl).T_hrely_group;
        }
    }
}

// Reset all control regions for the layer
GMUI_GridSetRegionsLayer(_LayerNumber);


#define GMUI_InitStudio
///GMUI_InitStudio() This internal script is called by GMUI_Init, if running GM:Studio 1.x,2.x
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! EDIT THE OBJECTS INSTEAD!
//
// Copyright 2017 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

if (global.GMUIGameMaker8)
    return false;

    
    
// THE REST OF THIS SCRIPT ONLY EXISTS IN GM:STUDIO:

// Common GMUI values:

// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position
//global.GMUIAnchorRight = 1;
//global.GMUIAnchorTopRight = 2;
//global.GMUIAnchorTop = 3;
//global.GMUIAnchorTopLeft = 4;
//global.GMUIAnchorLeft = 5;
//global.GMUIAnchorBottomLeft = 6;
//global.GMUIAnchorBottom = 7;
//global.GMUIAnchorBottomRight = 8;
//global.GMUIAnchorCenter = 9;
//global.GMUIAnchorDefault = global.GMUIAnchorTopLeft;

// Hovering directions for special controls
//global.GMUIHoveringDirection_None = 0;
//global.GMUIHoveringDirection_Right = 1;
//global.GMUIHoveringDirection_Up = 2;
//global.GMUIHoveringDirection_Left = 3;
//global.GMUIHoveringDirection_Down = 4;

// Direction types
//global.GMUIDirectionTypeHorizontal = 0;
//global.GMUIDirectionTypeVertical = 1;
//global.GMUIDirectionTypeSideVertical = 2;
//global.GMUIDirectionTypeBoth = 3;

// Control datatypes
//global.GMUIDataTypeString = 0;
//global.GMUIDataTypeInteger = 1;
//global.GMUIDataTypeDecimal = 2;
//global.GMUIDataTypeButton = 3;
//global.GMUIDataTypeInfo = 4;
//global.GMUIDataTypeBoolean = 5;

// PopupTypes
//global.GMUIPopupBlank = -1;
//global.GMUIPopupInformation = 0;
//global.GMUIPopupConfirm = 1;
//global.GMUIPopupThreeOptions = 2;

// Slide shapes
//global.GMUISlideNone = -1;
//global.GMUISlideLine = -2;
//global.GMUISlideRect = -3;
//global.GMUISlideRoundRect = -4;
//global.GMUISlideFullRoundRect = -5;



#define GMUI_IsControl
///GMUI_IsControl()
/// Checks that the object calling script is a control in GMUI

// Call the actual check with the current object's ID
return GMUI_IsControlID(id);

#define GMUI_IsControlID
///GMUI_IsControlID(id)
/// Checks that the object ID provided is a control


return (ds_list_find_index((GMUII()).GMUI_controlList,argument0) != -1);

#define GMUI_IsScript
///GMUI_IsScript(script)
///Determines whether the value provided is an existing script

var _ScrVar;

_ScrVar = argument0;

if (is_real(_ScrVar)) {
    if (_ScrVar > -1) {
        if (script_exists(_ScrVar)) {
            return true;
        }
    }
}

return false;

#define GMUI_LastError
///GMUI_LastError()
/// Return the last error reported from the error list

return (GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber];

#define GMUI_LayerExists
///GMUI_LayerExists(Layer Number)
/// Checks that the layer number given exists in GMUI

if (!is_real(argument0))
    return false;

var L;L = floor(argument0);

return (ds_list_find_index((GMUII()).GMUI_gridlist,L) != -1);


#define GMUI_MenuControlDepth
///GMUI_MenuControlDepth(GMUI, Menu Number, ControlType)
///Returns the depth for the menu and control's type value

var _GMUII, _MenuNumber, _ControlType;
_GMUII = argument0;
_MenuNumber = argument1;
_ControlType = argument2;


return (_GMUII).layerDepth_menus-((_MenuNumber)*4) 
    - (_ControlType=="tooltip");

#define GMUI_MouseInAdjustedRegion
///GMUI_MouseInAdjustedRegion(Control Object, mouse x, mouse y)
/// Checks to see if the mouse is in the adjusted region of the control (true/false)

var _Control, _MX, _MY, _CW, _CH, _xoffset, _yoffset;
_Control = argument0;
_MX = argument1;
_MY = argument2;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInAdjustedRegion");
    return false;
}

// Get the proper width/height of the cell (using cellsize functions)
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = GMUI_CellGetActualX((_Control).CellWide);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = GMUI_CellGetActualY((_Control).CellHigh);
    
// Adjustments if using views
_xoffset = GMUI_GridViewOffsetX((_Control).GMUIP);
_yoffset = GMUI_GridViewOffsetY((_Control).GMUIP);

// Adjustment if grid is offset
_xoffset += ((_Control).GMUIP).GMUI_grid_x[(_Control).Layer];
_yoffset += ((_Control).GMUIP).GMUI_grid_y[(_Control).Layer];

    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _xoffset && _MX <= (_Control).ActualX + (_Control).RelativeX + _xoffset + _CW) &&
    (_MY >= (_Control).ActualY + (_Control).RelativeY + _yoffset && _MY <= (_Control).ActualY + (_Control).RelativeY + _yoffset + _CH)
    )
    return true;
else
    return false;

#define GMUI_MouseInSpecialRegion
///GMUI_MouseInAdjustedSpecialRegion(Control Object, mouse x, mouse y)
/// Returns direction if mouse is in the adjusted region of the control

var _Control, _MX, _MY, _D, _CW, _CH, sizingW, sizingH, _xoffset, _yoffset;
_Control = argument0;
_MX = argument1;
_MY = argument2;
sizingW = 0;
sizingH = 0;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInSpecialRegion");
    return global.GMUIHoveringDirection_None;
}

// Get the proper width/height of the cell
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = (_Control).CellWide * ((GMUII()).cellsize);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = (_Control).CellHigh * ((GMUII()).cellsize_h);
    
_D = (_Control).ControlPickerDirection;
    
// if sizing mode is half of cell, then use the direction to find midpoints, otherwise use picker size
if (_D == global.GMUIDirectionTypeSideVertical)
{
    sizingW = (_Control).ControlPickerWidth;
    sizingH = _CH / 2;
}
else if (_D == global.GMUIDirectionTypeVertical)
{
    sizingW = _CW;
    sizingH = (_Control).ControlPickerHeight + 2; // +2 borders
}
else
{
    sizingW = (_Control).ControlPickerWidth + 2; // +2 borders
}

// Adjustments if using views
_xoffset = GMUI_GridViewOffsetX((_Control).GMUIP);
_yoffset = GMUI_GridViewOffsetY((_Control).GMUIP);

// Adjustment if grid is offset
_xoffset += ((_Control).GMUIP).GMUI_grid_x[(_Control).Layer];
_yoffset += ((_Control).GMUIP).GMUI_grid_y[(_Control).Layer];
    

// Check if coordinates are inside the adjusted control based on what adjustments are set
if (_D == global.GMUIDirectionTypeHorizontal)
{
    if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + sizingW + _xoffset))
        return global.GMUIHoveringDirection_Left;
    else if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + _CW + _xoffset))
        return global.GMUIHoveringDirection_Right;
}
else if (_D == global.GMUIDirectionTypeSideVertical || _D == global.GMUIDirectionTypeVertical)
{
    if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _yoffset) && 
        (_MY <= (_Control).ActualY + (_Control).RelativeY + sizingH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
        return global.GMUIHoveringDirection_Up;
    else if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _CH - sizingH + _yoffset) &&
        (_MY <= (_Control).ActualY + (_Control).RelativeY + _CH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
    return global.GMUIHoveringDirection_Down;
}

// No Conditions were met
return global.GMUIHoveringDirection_None;



#define GMUI_NavigateNextControl
///GMUI_NavigateNextControl(check for next control [true] or previous [false])
///Check for the keys to change control selection

if (keyboard_check_pressed(vk_anykey)) {
    // Next control
    if (argument0 >= 1) {
        if (GMUI_enableTab) {
            if (keyboard_check_pressed(vk_tab))
                return true;
        }
        
        if (GMUI_forwardKey != -1) {
            if (keyboard_check_pressed(GMUI_forwardKey))
                return true;
            if (GMUI_forwardAltKey != -1) {
                if (keyboard_check_pressed(GMUI_forwardAltKey))
                    return true;
            }
        }
    }
    else {
    // Previous control
        if (GMUI_backKey != -1) {
            if (keyboard_check_pressed(GMUI_backKey))
                return true;
            if (GMUI_backAltKey != -1) {
                if (keyboard_check_pressed(GMUI_backAltKey))
                    return true;
            }
        }
    }
}

return false;

#define GMUI_ResetControlStatus
///GMUI_ResetControlStatus("Hovering" / "Selected" / "Position", GridID)
/// Resets the hovering or selected values of the controls

var _SCRIPT,_GridID,a0,ff,ffo,m,ms; a0 = string(argument0);
_SCRIPT = GMUI_ResetControlStatus;
_GID = argument1;

if (string_lower(a0) == "selected" || a0 == "1") {
    (_GID).SelectedControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' selected variable to false and find previous selection if there is one
        PreviousSelectedControl = -1;
        
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    if ((ffo).Selected)
                        PreviousSelectedControl = ffo;
                    (ffo).Selected = 0;
                    (ffo).DoubleSelected = 0;
                    (ffo).Holding = 0;
                    (ffo).HoldingTime = 0;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "hovering" || a0 == "0") {
    (_GID).HoveringControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).Hovering = 0;
                    (ffo).HoveringDirection = 0;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "position" || a0 == "2") {
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' position update to true
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).NeedsPositionUpdate = true;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else {
    GMUI_ThrowErrorDetailed("Incorrect parameter given",_SCRIPT);
}

#define GMUI_SetGroupStyle
///GMUI_SetGroupStyle(Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_SetGroupStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default [Not set in Demo]

if (argument0 >= 0)
GroupBackgroundColor = argument0;
if (argument1 >= 0)
GroupBackgroundAlpha = minmax(argument1,0,1);
if (argument2 >= 0)
GroupBorderColor = argument2;
if (argument3 >= 0)
GroupBorderAlpha = minmax(argument3,0,1);
if (argument4 >= 0)
GroupIsRoundRect = minmax(argument4,0,1);


ControlHasGroupStyle = true;

return true;
    

#define GMUI_StudioCheckDefined
///GMUI_StudioCheckDefined(value) Returns if the argument is defined or not (GM:Studio)

var a0; a0 = argument0;

//GM8:
if (global.GMUIGameMaker8)
    return true;

//Studio: UNCOMMENT THE NEXT LINE IN GM:STUDIO
//return !is_undefined(a0);

#define GMUI_SwitchToMenu
///GMUI_SwitchToMenu(GMUI, Menu number)
///Switches the depth of all controls in the menu of the current layer

// Arguments
var _SCRIPT, _GMUII, _LayerNumber, _MenuNumber, _MasterControl;
_SCRIPT = GMUI_SwitchToMenu;
_GMUII = argument0;
_MenuNumber = argument1;
_LayerNumber = GMUI_GetMenuLayer(_GMUII,_MenuNumber);

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",_SCRIPT);
    return false;
}

GMUI_SwitchToLayer(_LayerNumber);

_MasterControl = (_GMUII).GMUI_groupMasterControl[_LayerNumber,_MenuNumber];
(_MasterControl).PreviousMenu = (_GMUII).GMUI_menuCurrent;
(_MasterControl).PreviousMenuLayer = (_GMUII).UILayerPrevious;

(GMUII()).GMUI_menuCurrent = _MenuNumber;

var i;
for(i=0;i<ds_list_size((_GMUII).GMUI_groupControlList[_LayerNumber,_MenuNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((_GMUII).GMUI_groupControlList[_LayerNumber,_MenuNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _MenuNumber + ")", _SCRIPT);
    }
    else {
        // Set control depth to the # of menu's open if master control, -1 for not master, -2 for tooltip, etc.
        (ctrl).depth = GMUI_MenuControlDepth(_GMUII,(_GMUII).GMUI_menuOpenCount,(ctrl).ControlType)
            - (_MasterControl != ctrl);
    }
}


#define GMUI_ThrowError
///GMUI_ThrowError(Error Message)
///GMUI can store errors and can choose to save/report them if needed

(GMUII()).GMUI_ErrorNumber += 1;
(GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber] = string(argument0);

if ((GMUII()).PopUpGMUIError) {
    show_message(GMUI_LastError());
}

#define GMUI_ThrowErrorDetailed
///GMUI_ThrowErrorDetailed(Error Message,script)
///Throw script name and object caller name with the message

GMUI_ThrowError(string(argument0) + " | " + string(script_get_name(argument1)) + " | " + string(object_get_name(object_index)));

#define GMUI_ValidCellBounds
///GMUI_ValidCellBounds(anchor,cellX,cellY,gridW,gridH)
///This procedure will lightly check the boundaries for each anchor position, as controls outside the grid will not be recognized properly
// Only checks for max bounds such as negative or over the width/height. User should notice anything else, so I don't think it needs to be a strict check.... for now at least.

// The X cell values 
if (
argument0 == global.GMUIAnchorLeft || argument0 == global.GMUIAnchorTopLeft || argument0 == global.GMUIAnchorBottomLeft || 
argument0 == global.GMUIAnchorTopRight || argument0 == global.GMUIAnchorRight || argument0 == global.GMUIAnchorBottomRight
)
{
    if (argument1 < 0 || argument1 > argument3 - 1)
        return false;
}
//else if ( ... strict check on centered controls


// The Y cell values
if (
argument0 == global.GMUIAnchorTopLeft || argument0 == global.GMUIAnchorTopRight || argument0 == global.GMUIAnchorTop || 
argument0 == global.GMUIAnchorBottomLeft || argument0 == global.GMUIAnchorBottomRight || argument0 == global.GMUIAnchorBottom
)
{
    if (argument2 < 0 || argument2 > argument4 - 1)
        return false;
}
// else if ( ... strict check on centered controls

// Passed
return true;

#define GMUII
/// INTERNAL USE: Returns the current GMUI object instance
// (GMUII()).Value

return global.GMUIiid[0];

