x = mouse_x;
y = mouse_y;

image_index = 1;

update_cursor_pos();

switch(state){
	case "write":
		step_tool_select_se();
	
	break;
	
	case "switch":
		step_tool_select_se();
	
	
	break; 
	
	case "erase":
		step_tool_select_se();
	
	
	break;
	
}