#define GMUI_GroupSetPositionAnchored
///GMUI_GroupSetPositionAnchored(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment, Anchor)
///Change the position of the group (and all of the controls inside it) according to its anchor

// Arguments
var _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl;
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY) || _GroupNumber <= 0) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionAnchored");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionAnchored");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionAnchored");
    return false;
}

// Max adjustment values
_AdjustmentX = min(_AdjustmentX, (GMUII()).cellsize - 1);
_AdjustmentY = min(_AdjustmentY, (GMUII()).cellsize_h - 1);

// Change group position
(GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellX(ds_grid_width((GMUII()).GMUI_grid[_LayerNumber]),_CellX,_Anchor);
(GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellY(ds_grid_height((GMUII()).GMUI_grid[_LayerNumber]),_CellY,_Anchor);
(GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = GMUI_CellGetActualX((GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber]);
(GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = GMUI_CellGetActualY((GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber]);
(GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber] = _AdjustmentX;
(GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber] = _AdjustmentY;

// Re-position all controls within the group
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowError("Control no longer exists. GMUI_GroupSetPositionAnchored(" + _LayerNumber + "," + _GroupNumber + ")");
    }
    else {
        var pCellX,pCellY,groupWidth;
        groupWidth = (GMUII()).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
        pCellX = GMUI_GetAnchoredCellX(groupWidth,(ctrl).RelativeCellX,(ctrl).Anchor);
        pCellY = GMUI_GetAnchoredCellY(groupWidth,(ctrl).RelativeCellY,(ctrl).Anchor);
        
        // Reset positioning based on group's position
        (ctrl).CellX = GMUI_GetAnchoredCellX(groupWidth,pCellX,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber];
        (ctrl).CellY = GMUI_GetAnchoredCellY(groupWidth,pCellY,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber];
        (ctrl).RelativeX = (GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber];
        (ctrl).RelativeY = (GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber];
        
        // Properly have control configure its own adjustments (sets IsAdjusted and adds cell boundary as necessary)
        with (ctrl) {
            GMUI_ControlSetPositioning(RelativeX,RelativeY,ActualW,ActualH);
        }
            
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
    }
}

// Reset all control regions for the layer
GMUI_GridSetRegionsLayer(_LayerNumber);

