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


if ((GMUII()).UILayerTop < _Layer)
    (GMUII()).UILayerTop = _Layer;

return true;
