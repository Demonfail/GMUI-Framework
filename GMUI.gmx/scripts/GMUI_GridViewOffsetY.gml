///GMUI_GridViewOffsetY(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings

with (argument0) {
    if (UIsnaptoview && !UIEnableSurfaces)
        return view_yview[UIgridview];
    else
        return 0;
} 