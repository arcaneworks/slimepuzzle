// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_cursor_pos_menu(){
	axish = gamepad_axis_value(0, gp_axislh);
	axisv = gamepad_axis_value(0, gp_axislv);
	if(axish * axish > 0.05){
	x_offset += axish * global.cursorSensitivity;
	}
	if(axisv * axisv > 0.05){
	y_offset += axisv * global.cursorSensitivity;
	}
	x = mouse_x + x_offset;
	y = mouse_y + y_offset;
}