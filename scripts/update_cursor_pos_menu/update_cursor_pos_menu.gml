// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_cursor_pos_menu(){
	var numPads= gamepad_get_device_count();
	axish = 0;
	axisv = 0;
	for(var i = 0; i < numPads; i++;)
	{
	    //if(gamepad_is_connected(i)) show_message(string(i) + ": " + gamepad_get_description(i));
		axish += gamepad_axis_value(i, gp_axislh);
		axisv += gamepad_axis_value(i, gp_axislv);
		
	}
	if(axish * axish > 0.05){
	x_offset += axish * global.cursorSensitivity;
	}
	if(axisv * axisv > 0.05){
	y_offset += axisv * global.cursorSensitivity;
	}
	x = mouse_x + x_offset;
	y = mouse_y + y_offset;
}